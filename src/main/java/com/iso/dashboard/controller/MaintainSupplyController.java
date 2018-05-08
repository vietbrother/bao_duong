/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.controller;

import com.iso.dashboard.component.CustomGrid;
import com.iso.dashboard.dto.MaintainSup;
import com.iso.dashboard.dto.RepairType;
import com.iso.dashboard.dto.ResultDTO;
import com.iso.dashboard.service.MaintainSupService;
import com.iso.dashboard.service.RepairTypeMngtService;
import com.iso.dashboard.ui.ImportFileUI;
import com.iso.dashboard.ui.MaintainSupMngtUI;
import com.iso.dashboard.utils.BundleUtils;
import com.iso.dashboard.utils.CommonExport;
import com.iso.dashboard.utils.ComponentUtils;
import com.iso.dashboard.utils.Constants;
import com.iso.dashboard.utils.DataUtil;
import com.iso.dashboard.utils.ISOIcons;
import com.iso.dashboard.utils.WindowProgress;
import com.iso.dashboard.view.MaintainSupplyView;
import com.vaadin.data.Item;
import com.vaadin.data.util.IndexedContainer;
import com.vaadin.server.FileResource;
import com.vaadin.server.Page;
import com.vaadin.server.Resource;
import com.vaadin.server.Sizeable;
import com.vaadin.server.VaadinService;
import com.vaadin.ui.Button;
import com.vaadin.ui.Notification;
import com.vaadin.ui.UI;
import com.vaadin.ui.Window;
import com.vaadin.ui.themes.Reindeer;
import java.io.File;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.vaadin.dialogs.ConfirmDialog;

/**
 *
 * @author Thuclt-VNPTTech
 */
public class MaintainSupplyController {

    MaintainSupplyView view;
    
    private int repairType;

    CustomGrid pagedTable;
//    String[] headerName = new String[]{"Id", "Username", "Email", "Phone", ""};
    String prefix = "maintainSub.list";//tien to trong file language
    String headerKey = "header.maintainSub";//lay trong file cas
    String[] headerName = BundleUtils.getHeaderColumnName(prefix, headerKey);
    String[] headerColumn = BundleUtils.getHeaderColumn(headerKey);
    String jobListLabel = "maintainSub.list";
    Resource resource;

    volatile WindowProgress wp;

    public MaintainSupplyController(MaintainSupplyView view) {
        this.view = view;
        this.pagedTable = view.getPagedTable();
        this.repairType = view.getRepairType();
        initTable(MaintainSupService.getInstance().listRepairLaborsAll(null, String.valueOf(repairType)));
        doAction();
    }

    public void initTable(List<MaintainSup> lst) {
        IndexedContainer container = createContainer(lst);
        pagedTable.genGrid(container, prefix, headerColumn, null, new HandlerButtonActionGrid() {

            @Override
            public void actionEdit(Object obj) {
                MaintainSup item = (MaintainSup) obj;
                String uId = String.valueOf(item.getId());
                MaintainSup dto = MaintainSupService.getInstance().getRepairLaborById(uId);
                onUpdate(dto);
                view.getBtnSearch().click();
            }

            @Override
            public void actionDelete(Object obj) {
                ConfirmDialog d = ConfirmDialog.show(UI.getCurrent(),
                        BundleUtils.getString("message.warning.title"),
                        BundleUtils.getString("message.warning.content"),
                        BundleUtils.getString("common.confirmDelete.yes"),
                        BundleUtils.getString("common.confirmDelete.no"),
                        new ConfirmDialog.Listener() {

                            public void onClose(ConfirmDialog dialog) {
                                if (dialog.isConfirmed()) {
                                    // Confirmed to continue
                                    MaintainSup item = (MaintainSup) obj;
                                    String delId = String.valueOf(item.getId());
                                    ResultDTO res = MaintainSupService.getInstance().removeRepairLabor(delId);
                                    ComponentUtils.showNotification("Delete id : " + delId + " " + res.getKey() + " " + res.getMessage());
                                    view.getBtnSearch().click();
                                }
                            }
                        });
                d.setStyleName(Reindeer.WINDOW_LIGHT);
                d.setContentMode(ConfirmDialog.ContentMode.HTML);
                d.getOkButton().setIcon(ISOIcons.SAVE);
                d.getCancelButton().setIcon(ISOIcons.CANCEL);
            }

            @Override
            public void actionSelect(Object obj) {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }
        });

    }

    public void reloadData(List<MaintainSup> lstUnits) {
        pagedTable.setContainerDataSource(pagedTable.createWrapContainer(createContainer(lstUnits)));
    }

    public IndexedContainer createContainer(List<MaintainSup> lstUnits) {
        IndexedContainer container = new IndexedContainer();
        container.addContainerProperty("action", String.class, null);
        container.addContainerProperty("stt", String.class, null);
        container.addContainerProperty("name", String.class, null);
        container.addContainerProperty("quantity", String.class, null);
        container.addContainerProperty("type", String.class, null);
        container.addContainerProperty("unit", String.class, null);
        int i = 1;
        for (MaintainSup j : lstUnits) {
            Item item = container.addItem(j);
            item.getItemProperty("stt").setValue(String.valueOf(i));
            item.getItemProperty("name").setValue(j.getSupName());
            item.getItemProperty("quantity").setValue(j.getQuantity());
            item.getItemProperty("type").setValue(j.getRepairType() == null ? "" : j.getRepairType().getName());
            item.getItemProperty("unit").setValue(j.getSupUnit());
            i++;
        }
        container.sort(new Object[]{"id"}, new boolean[]{true});
        return container;
    }

    private void doAction() {
        view.getBtnSearch().addClickListener(new Button.ClickListener() {

            @Override
            public void buttonClick(Button.ClickEvent event) {
                onSearch();
            }
        });

        view.getBtnAdd().addClickListener(new Button.ClickListener() {

            @Override
            public void buttonClick(Button.ClickEvent event) {
                onInsert();
            }
        });

    }

    public boolean validateData(MaintainSupMngtUI ui) {
//        if (DataUtil.isNullOrEmpty(ui.getTxtUnit().getValue())) {
//            Notification.show(BundleUtils.getString("employeeTypeMngt.list.employeeType") + Constants.SPACE_CHARACTER + BundleUtils.getString("common.notnull"));
//            return false;
//        }
//        if (ui.getTxtUnit().getValue().length() > 20) {
//            Notification.show(BundleUtils.getString("employeeTypeMngt.list.employeeType") + Constants.SPACE_CHARACTER + BundleUtils.getString("common.maxlength.20"));
//            return false;
//        }
        return true;
    }

    private void onInsert() {
        createDialog(true, new MaintainSup());
    }

    private void onUpdate(MaintainSup dto) {
        createDialog(false, dto);
    }

    private void onSearch() {
        List<MaintainSup> list = MaintainSupService.getInstance().listRepairLaborsAll(view.getTxtRepairLabor().getValue(), String.valueOf(repairType));
        //Notification.show("lstUnits : " + list.size());
        reloadData(list);
    }

 
    private void initDataDialog(MaintainSupMngtUI ui, boolean isInsert, MaintainSup dto) {

        List<RepairType> lstType = RepairTypeMngtService.getInstance().listRepairTypes("");
        if (isInsert) {
            ComponentUtils.fillDataObjectCombo(ui.getCmbType(), "", "", lstType,
                    RepairType.class, "id", "name");
        } else {
            ui.getTxtName().setValue(dto.getSupName()== null ? "" : dto.getSupName());
            ui.getTxtLevel().setValue(dto.getQuantity()== null ? "" : dto.getQuantity());
            ui.getTxtQuota().setValue(dto.getSupUnit()== null ? "" : dto.getSupUnit());
            ComponentUtils.fillDataObjectCombo(ui.getCmbType(), "",
                    dto.getRepairType() == null ? "" : String.valueOf(dto.getRepairType().getId()),
                    lstType,
                    RepairType.class, "id", "name");
        }
    }

    public void createDialog(boolean isInsert, MaintainSup dto) {
        MaintainSupMngtUI ui = new MaintainSupMngtUI(isInsert ? BundleUtils.getString("common.button.add") : BundleUtils.getString("common.button.edit"));
        Window window = new Window(
                "",
                ui);
        //window.setWidth("700px");
        float height = UI.getCurrent().getWidth() * 3 / 4;
        window.setWidth(String.valueOf(height) + "%");
//        window.setIcon(VaadinIcons.CALENDAR_USER);
        initDataDialog(ui, isInsert, dto);
        ui.getBtnSave().addClickListener(new Button.ClickListener() {
            @Override
            public void buttonClick(Button.ClickEvent event) {
                boolean validate = validateData(ui);
                if (validate) {
                    ConfirmDialog d = ConfirmDialog.show(
                            UI.getCurrent(),
                            BundleUtils.getString("message.warning.title"),
                            BundleUtils.getString("message.warning.content"),
                            BundleUtils.getString("common.confirmDelete.yes"),
                            BundleUtils.getString("common.confirmDelete.no"),
                            new ConfirmDialog.Listener() {

                                public void onClose(ConfirmDialog dialog) {
                                    if (dialog.isConfirmed()) {
                                        // Confirmed to continue
                                        ResultDTO res = null;
                                        getDataFromUI(ui, dto);
                                        if (isInsert) {
                                            res = MaintainSupService.getInstance().addRepairLabor(dto);
                                            ComponentUtils.showNotification(BundleUtils.getString("common.button.add") + " " + res.getKey() + " " + res.getMessage());
                                        } else {
                                            res = MaintainSupService.getInstance().updateRepairLabor(dto);
                                            ComponentUtils.showNotification(BundleUtils.getString("common.button.update") + " "
                                                    + res.getKey() + " " + res.getMessage());
                                        }
                                        window.close();
                                        view.getBtnSearch().click();
                                    } else {
                                        // User did not confirm
                                        Notification.show("nok");
                                        window.close();
                                    }
                                }
                            });
                    d.setStyleName(Reindeer.LAYOUT_BLUE);
                    d.setContentMode(ConfirmDialog.ContentMode.HTML);
                    d.getOkButton().setIcon(ISOIcons.SAVE);
                    d.getOkButton().focus();
                    d.getCancelButton().setIcon(ISOIcons.CANCEL);
                }
            }

        });
        ui.getBtnCancel().addClickListener(new Button.ClickListener() {

            @Override
            public void buttonClick(Button.ClickEvent event) {
                window.close();
            }
        });

        ui.setWidth("100%");
        ui.setHeight(Constants.STYLE_CONF.AUTO_VALUE);

        window.setModal(true);
        DataUtil.reloadWindow(window);
        UI.getCurrent().addWindow(window);
    }

    private void getDataFromUI(MaintainSupMngtUI ui, MaintainSup dto) {
        dto.setSupName(ui.getTxtName().getValue());
        dto.setQuantity(ui.getTxtLevel().getValue());
        dto.setSupUnit(ui.getTxtQuota().getValue());
        RepairType type = (RepairType) ui.getCmbType().getValue();
        if (type != null && !DataUtil.isStringNullOrEmpty(type.getId()) && !Constants.DEFAULT_VALUE.equals(type.getId())) {
            dto.setRepairType(type);
        }
        dto.setMaintainType(repairType);
    }

}

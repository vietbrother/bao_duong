/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.controller;

import com.iso.dashboard.component.CustomGrid;
import com.iso.dashboard.dto.Maintenance;
import com.iso.dashboard.dto.ResultDTO;
import com.iso.dashboard.service.MaintenanceMngtService;
import com.iso.dashboard.ui.Maintenance1MngtUI;
import com.iso.dashboard.utils.BundleUtils;
import com.iso.dashboard.utils.CommonExport;
import com.iso.dashboard.utils.ComponentUtils;
import com.iso.dashboard.utils.Constants;
import com.iso.dashboard.utils.DataUtil;
import com.iso.dashboard.utils.ISOIcons;
import com.iso.dashboard.view.Maintenance1MngtView;
import com.vaadin.data.Item;
import com.vaadin.data.util.IndexedContainer;
import com.vaadin.server.FileResource;
import com.vaadin.server.Page;
import com.vaadin.server.Resource;
import com.vaadin.server.VaadinService;
import com.vaadin.ui.Button;
import com.vaadin.ui.Notification;
import com.vaadin.ui.UI;
import com.vaadin.ui.Window;
import com.vaadin.ui.themes.Reindeer;
import java.io.File;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.List;
import org.vaadin.dialogs.ConfirmDialog;

/**
 *
 * @author Thuclt-VNPTTech
 */
public class Maintenance1MngtController {

    Maintenance1MngtView view;
    MaintenanceMngtService service;

    CustomGrid pagedTable;
//    String[] headerName = new String[]{"Id", "Username", "Email", "Phone", ""};
    String prefix = "maintenance1Mngt.list";//tien to trong file language
    String headerKey = "header.maintenance1Mngt";//lay trong file cas
    String[] headerName = BundleUtils.getHeaderColumnName(prefix, headerKey);
    String[] headerColumn = BundleUtils.getHeaderColumn(headerKey);
    String jobListLabel = "maintenance1Mngt.list";
    Resource resource;

    public Maintenance1MngtController(Maintenance1MngtView view) {
        this.view = view;
        this.pagedTable = view.getPagedTable();
        initTable(MaintenanceMngtService.getInstance().listMaintenancesByType("1"));
        doAction();
    }

    public void initTable(List<Maintenance> lst) {
        IndexedContainer container = createContainer(lst);
        pagedTable.genGrid(container, prefix, headerColumn, null, new HandlerButtonActionGrid() {

            @Override
            public void actionEdit(Object obj) {
                Maintenance item = (Maintenance) obj;
                String uId = String.valueOf(item.getId());
                Notification.show("Edit " + uId);
                Maintenance dto = MaintenanceMngtService.getInstance().getMaintenanceById(uId);
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
                            Maintenance item = (Maintenance) obj;
                            String delId = String.valueOf(item.getId());
                            ResultDTO res = MaintenanceMngtService.getInstance().removeMaintenance(delId);
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

    public void reloadData(List<Maintenance> lst) {
        pagedTable.setContainerDataSource(pagedTable.createWrapContainer(createContainer(lst)));
    }

    public IndexedContainer createContainer(List<Maintenance> lst) {
        IndexedContainer container = new IndexedContainer();
//        container.addContainerProperty("stt", String.class, null);
        container.addContainerProperty("btnAction", String.class, null);
        container.addContainerProperty("id", String.class, null);
        container.addContainerProperty("maintenanceType", String.class, null);
        container.addContainerProperty("code", String.class, null);
        container.addContainerProperty("name", String.class, null);

        // Thông tin về tài sản
        container.addContainerProperty("assetCode", String.class, null);
        container.addContainerProperty("assetName", String.class, null);
        container.addContainerProperty("assetEmployee", String.class, null);
        container.addContainerProperty("assetOrganization", String.class, null);
        //
        container.addContainerProperty("content", String.class, null);
        container.addContainerProperty("description", String.class, null);
        for (Maintenance j : lst) {
            Item item = container.addItem(j);
            item.getItemProperty("id").setValue(String.valueOf(j.getId()));
            item.getItemProperty("maintenanceType").setValue(j.getMaintenanceType().getName());
            item.getItemProperty("code").setValue(j.getCode());
            item.getItemProperty("name").setValue(j.getName());

            //Thông tin tài sản
            item.getItemProperty("assetCode").setValue(j.getAsset().getCode()); // Biển số
            item.getItemProperty("assetName").setValue(j.getAsset().getName());
            item.getItemProperty("assetEmployee").setValue(j.getAsset().getEmployee().getFirstName()
                    + " " + j.getAsset().getEmployee().getLastName());
            item.getItemProperty("assetOrganization").setValue(j.getAsset().getOrganization().getName());
            //
            item.getItemProperty("content").setValue(j.getContent());
            item.getItemProperty("description").setValue(j.getDescription());
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

        view.getBtnExport().addClickListener(new Button.ClickListener() {

            @Override
            public void buttonClick(Button.ClickEvent event) {
                onExport();
            }
        });
    }

    public boolean validateData(Maintenance1MngtUI ui) {
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
        createDialog(true, new Maintenance());
    }

    private void onUpdate(Maintenance dto) {
        createDialog(false, dto);
    }

    private void onSearch() {
        List<Maintenance> list = MaintenanceMngtService.getInstance().listMaintenances(view.getTxtMaintenance().getValue());
        Notification.show("lst : " + list.size());
        reloadData(list);
    }

    private void onExport() {

        try {
            List<Maintenance> lst = MaintenanceMngtService.getInstance().listMaintenances(view.getTxtMaintenance().getValue());
            String[] header = new String[]{"export_01", "export_02", "export_03"};
            String[] align = new String[]{"LEFT", "LEFT", "LEFT"};
            List<AbstractMap.SimpleEntry<String, String>> headerAlign = new ArrayList<AbstractMap.SimpleEntry<String, String>>();
            for (int i = 0; i < header.length; i++) {
                headerAlign.add(new AbstractMap.SimpleEntry(header[i], align[i]));
            }
            String fileTemplate = VaadinService.getCurrent().getBaseDirectory().getAbsolutePath()
                    //+ File.separator + "WEB-INF"
                    //+ File.separator + "templates"
                    //+ File.separator + "incident"
                    //+ File.separator + "TEMPLATE_EXPORT.xls"
                    + Constants.FILE_CONF.PATH_EXPORT_TEMPLATE_XLSX;

            String subTitle = Constants.EMPTY_CHARACTER;

            File fileExport = CommonExport.exportFile(lst,//list du lieu
                    headerAlign,//header
                    //"userMngt.list",//header prefix
                    jobListLabel,//header prefix
                    fileTemplate,//path template
                    BundleUtils.getString("userMngt.fileName.export"),//fileName out
                    7,//start row
                    subTitle,//sub title
                    4,//cell title Index
                    BundleUtils.getString("userMngt.report")//title
            );
            resource = new FileResource(fileExport);

            Page.getCurrent().open(resource, null, false);
        } catch (Exception e) {
        }
    }

    private void initDataDialog(Maintenance1MngtUI ui, boolean isInsert, Maintenance dto) {

        if (isInsert) {

        } else {
            ui.getTxtAssetCode().setValue(dto.getAsset().getCode() == null ? "" : dto.getAsset().getCode());
            ui.getTxtAssetName().setValue(dto.getAsset().getName() == null ? "" : dto.getAsset().getName());
            ui.getTxtKmNumber().setValue(String.valueOf(dto.getAsset().getSeats()) == null ? ""
                    : String.valueOf(dto.getAsset().getSeats()));
            ui.getTxtDepartment().setValue(dto.getAsset().getOrganization().getName() == null ? ""
                    : dto.getAsset().getOrganization().getName());
            ui.getTxtEmployeeName().setValue((dto.getAsset().getEmployee().getFirstName() + " "
                    + dto.getAsset().getEmployee().getLastName())
                    == null ? "" : (dto.getAsset().getEmployee().getFirstName() + " "
                            + dto.getAsset().getEmployee().getLastName()));
        }
    }

    public void createDialog(boolean isInsert, Maintenance dto) {
        Maintenance1MngtUI ui = new Maintenance1MngtUI(isInsert ? BundleUtils.getString("common.button.add")
                : BundleUtils.getString("common.button.edit"));
//        Maintenance1MngtUI ui = new Maintenance1MngtUI("menu.maintenance1Mngt");
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
                                    res = MaintenanceMngtService.getInstance().addMaintenance(dto);
                                    ComponentUtils.showNotification(BundleUtils.getString("common.button.add") + " " + res.getKey() + " " + res.getMessage());
                                } else {
                                    res = MaintenanceMngtService.getInstance().updateMaintenance(dto);
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
        ui.getTxtAssetCode().focus();
    }

    private void getDataFromUI(Maintenance1MngtUI ui, Maintenance dto) {
//        dto.setUnit(ui.getTxtUnit().getValue().trim());
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.controller;

import com.iso.dashboard.component.CustomGrid;
import com.iso.dashboard.dto.RepairLabor;
import com.iso.dashboard.dto.RepairType;
import com.iso.dashboard.dto.ResultDTO;
import com.iso.dashboard.dto.StockSupply;
import com.iso.dashboard.service.RepairLaborMngtService;
import com.iso.dashboard.service.StockSupplyMngtService;
import com.iso.dashboard.ui.ImportFileUI;
import com.iso.dashboard.ui.RepairLaborMngtUI;
import com.iso.dashboard.ui.StockSupplyMngtUI;
import com.iso.dashboard.utils.BundleUtils;
import com.iso.dashboard.utils.ComponentUtils;
import com.iso.dashboard.utils.Constants;
import com.iso.dashboard.utils.DataUtil;
import com.iso.dashboard.utils.ISOIcons;
import com.iso.dashboard.utils.WindowProgress;
import com.iso.dashboard.view.StockSupplyMngtView;
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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import org.vaadin.dialogs.ConfirmDialog;

/**
 *
 * @author Thuclt-VNPTTech
 */
public class StockSupplyMngtController {

    StockSupplyMngtView view;

    CustomGrid pagedTable;
//    String[] headerName = new String[]{"Id", "Username", "Email", "Phone", ""};
    String prefix = "materialMngt.list";//tien to trong file language
    String headerKey = "header.materialMngt";//lay trong file cas
    String[] headerName = BundleUtils.getHeaderColumnName(prefix, headerKey);
    String[] headerColumn = BundleUtils.getHeaderColumn(headerKey);
    String jobListLabel = "materialMngt.list";
    Resource resource;

    volatile WindowProgress wp;

    public StockSupplyMngtController(StockSupplyMngtView view) {
        this.view = view;
        this.pagedTable = view.getPagedTable();
        initTable(StockSupplyMngtService.getInstance().listRepairLaborsAll(""));
        doAction();
    }

    public void initTable(List<StockSupply> lst) {
        IndexedContainer container = createContainer(lst);
        pagedTable.genGrid(container, prefix, headerColumn, null, new HandlerButtonActionGrid() {

            @Override
            public void actionEdit(Object obj) {
                StockSupply item = (StockSupply) obj;
                String uId = String.valueOf(item.getId());
                Notification.show("Edit " + uId);
                StockSupply dto = StockSupplyMngtService.getInstance().getRepairLaborById(uId);
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
                            StockSupply item = (StockSupply) obj;
                            String delId = String.valueOf(item.getId());
                            ResultDTO res = StockSupplyMngtService.getInstance().removeRepairLabor(delId);
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

    public void reloadData(List<StockSupply> lstUnits) {
        pagedTable.setContainerDataSource(pagedTable.createWrapContainer(createContainer(lstUnits)));
    }

    public IndexedContainer createContainer(List<StockSupply> lstUnits) {
        IndexedContainer container = new IndexedContainer();
        container.addContainerProperty("stt", String.class, null);
        container.addContainerProperty("action", String.class, null);
        container.addContainerProperty("code", String.class, null);
        container.addContainerProperty("name", String.class, null);
        container.addContainerProperty("contractCode", String.class, null);
        container.addContainerProperty("price", String.class, null);
        container.addContainerProperty("quantity", String.class, null);
        container.addContainerProperty("unit", String.class, null);
        container.addContainerProperty("updatedTime", String.class, null);
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        int i = 1;
        for (StockSupply j : lstUnits) {
            Item item = container.addItem(j);
            item.getItemProperty("stt").setValue(String.valueOf(i));
            item.getItemProperty("code").setValue(j.getCode());
            item.getItemProperty("name").setValue(j.getName());
            item.getItemProperty("contractCode").setValue(j.getContractCode());
            item.getItemProperty("price").setValue(j.getPrice());
            item.getItemProperty("quantity").setValue(j.getQuantity());
            item.getItemProperty("unit").setValue(j.getUnit());
            item.getItemProperty("updatedTime").setValue(j.getUpdatedTime() == null ? "" : sdf.format(j.getUpdatedTime()));
            i++;
        }
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

        view.getBtnImport().addClickListener(new Button.ClickListener() {

            @Override
            public void buttonClick(Button.ClickEvent event) {
                onCreateImportDialog();
            }
        });
    }

    public boolean validateData(StockSupplyMngtUI ui) {
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
        createDialog(true, new StockSupply());
    }

    private void onUpdate(StockSupply dto) {
        createDialog(false, dto);
    }

    private void onSearch() {
        List<StockSupply> list = StockSupplyMngtService.getInstance().listRepairLaborsAll(view.getTxtRepairLabor().getValue());
        //Notification.show("lstUnits : " + list.size());
        reloadData(list);
    }

    private void onCreateImportDialog() {
        ImportFileUI ui = new ImportFileUI(BundleUtils.getString("common.button.importFile"));
        Window window = new Window("", ui);
        //window.setWidth("700px");
        float height = UI.getCurrent().getWidth() * 1 / 2;
        window.setWidth(String.valueOf(height) + "%");
        window.setHeight(80.0f, Sizeable.Unit.PERCENTAGE);
        ui.getBtnExportFileTemplate().addClickListener(new Button.ClickListener() {

            @Override
            public void buttonClick(Button.ClickEvent event) {
                try {

                    File fileExport = new File(VaadinService.getCurrent()
                            .getBaseDirectory().getAbsolutePath() + "/WEB-INF/templates/TEMPLATE_KHO_VATTU.xls");
                    resource = new FileResource(fileExport);

                    Page.getCurrent().open(resource, null, false);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
        ui.getBtnSave().addClickListener(new Button.ClickListener() {

            @Override
            public void buttonClick(Button.ClickEvent event) {
                boolean validate = true;
                ArrayList<String> lst = ui.getUploadImport().getUrl();
                if (DataUtil.isListNullOrEmpty(lst)) {
                    validate = false;
                    ComponentUtils.showNotification("File is empty");
                }
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
                                wp = new WindowProgress(BundleUtils.getString("common.importing"));
                                UI.getCurrent().addWindow(wp);
                                UI.getCurrent().setPollInterval(1000);
                                ImportThread thread = new ImportThread(ui.getUploadImport().getPath() + lst.get(lst.size() - 1),
                                        window);
                                thread.start();
                            } else {
                                // User did not confirm
                                Notification.show("nok");
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

    class ImportThread extends Thread {

        private final String url;
        private final Window window;

        public ImportThread(String url, Window window) {
            this.url = url;
            this.window = window;
        }

        public Window getWindow() {
            return window;
        }

        @Override
        public void run() {
            try {

                String pathFileImport = url;
                File fileImport = new File(pathFileImport);
                List<Object[]> lstDataAll = ImportFileUI.importExcel(fileImport,
                        0,//sheet 
                        8,//begin row
                        0,//from column
                        6,//to column
                        2);
                List<Object[]> lstData = new ArrayList<>();
                if (lstDataAll != null && lstDataAll.size() > Constants.FILE_CONF.MAX_ROW_IMPORT_USER) {
                    lstData = lstDataAll.subList(0, Constants.FILE_CONF.MAX_ROW_IMPORT_USER);
                } else if (lstDataAll != null && lstDataAll.size() < Constants.FILE_CONF.MAX_ROW_IMPORT_USER) {
                    lstData = lstDataAll;
                }

                List<StockSupply> lstDataSave = new ArrayList<>();
                if (lstData != null && !lstData.isEmpty()) {

                    int currentParent = 0;
                    for (Object[] obj : lstData) {
                        StockSupply labor = new StockSupply();
                        labor.setCode(obj[1] == null ? null : String.valueOf(obj[1]).trim());
                        labor.setName(obj[2] == null ? null : String.valueOf(obj[2]).trim());
                        labor.setContractCode(obj[3] == null ? null : String.valueOf(obj[3]).trim());
                        labor.setPrice(obj[4] == null ? null : String.valueOf(obj[4]));
                        labor.setQuantity(obj[5] == null ? null : String.valueOf(obj[5]).trim());
                        labor.setUnit(obj[6] == null ? null : String.valueOf(obj[6]).trim());
                        lstDataSave.add(labor);
                    }
                    for (StockSupply labor : lstDataSave) {
                        StockSupplyMngtService.getInstance().addRepairLabor(labor);
                    }

                } else {
                    Notification.show(BundleUtils.getString("common.search.nodata"));
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                UI.getCurrent().access(new Runnable() {
                    @Override
                    public void run() {
                        wp.close();
                        getWindow().close();
                        Notification.show(BundleUtils.getString("common.complete"));
                        view.getBtnSearch().click();
                    }
                });
                UI.getCurrent().setPollInterval(-1);
                this.stop();
            }
        }
    }

    private void initDataDialog(StockSupplyMngtUI ui, boolean isInsert, StockSupply dto) {

        if (!isInsert) {
            ui.getTxtName().setValue(dto.getName() == null ? "" : dto.getName());
            ui.getTxtCode().setValue(dto.getCode()== null ? "" : dto.getCode());
            ui.getTxtContractCode().setValue(dto.getContractCode()== null ? "" : dto.getContractCode());
            ui.getTxtPrice().setValue(dto.getPrice()== null ? "" : dto.getPrice());
            ui.getTxtQuantity().setValue(dto.getQuantity()== null ? "" : dto.getQuantity());
            ui.getTxtUnit().setValue(dto.getUnit()== null ? "" : dto.getUnit());
        }
    }

    public void createDialog(boolean isInsert, StockSupply dto) {
        StockSupplyMngtUI ui = new StockSupplyMngtUI(isInsert ? BundleUtils.getString("common.button.add") : BundleUtils.getString("common.button.edit"));
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
                                    res = StockSupplyMngtService.getInstance().addRepairLabor(dto);
                                    ComponentUtils.showNotification(BundleUtils.getString("common.button.add") + " " + res.getKey() + " " + res.getMessage());
                                } else {
                                    res = StockSupplyMngtService.getInstance().updateRepairLabor(dto);
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

    private void getDataFromUI(StockSupplyMngtUI ui, StockSupply dto) {
        dto.setName(ui.getTxtName().getValue());
        dto.setCode(ui.getTxtCode().getValue());
        dto.setContractCode(ui.getTxtContractCode().getValue());
        dto.setPrice(ui.getTxtPrice().getValue());
        dto.setQuantity(ui.getTxtQuantity().getValue());
        dto.setUnit(ui.getTxtUnit().getValue());
    }

}

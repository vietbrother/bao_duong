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
import com.iso.dashboard.dto.ResultMaintainDTO;
import com.iso.dashboard.service.RepairLaborMngtService;
import com.iso.dashboard.service.RepairTypeMngtService;
import com.iso.dashboard.ui.ImportFileUI;
import com.iso.dashboard.ui.RepairLaborMngtUI;
import com.iso.dashboard.utils.BundleUtils;
import com.iso.dashboard.utils.CommonExport;
import com.iso.dashboard.utils.ComponentUtils;
import com.iso.dashboard.utils.Constants;
import com.iso.dashboard.utils.DataUtil;
import com.iso.dashboard.utils.ISOIcons;
import com.iso.dashboard.utils.WindowProgress;
import com.iso.dashboard.view.RepairLaborMngtView;
import com.vaadin.data.Item;
import com.vaadin.data.util.IndexedContainer;
import com.vaadin.data.util.converter.Converter;
import com.vaadin.server.FileResource;
import com.vaadin.server.Page;
import com.vaadin.server.Resource;
import com.vaadin.server.Sizeable;
import com.vaadin.server.VaadinService;
import com.vaadin.ui.Button;
import com.vaadin.ui.Grid;
import com.vaadin.ui.Label;
import com.vaadin.ui.Notification;
import com.vaadin.ui.UI;
import com.vaadin.ui.Window;
import com.vaadin.ui.renderers.HtmlRenderer;
import com.vaadin.ui.renderers.Renderer;
import com.vaadin.ui.themes.Reindeer;
import com.vaadin.ui.themes.ValoTheme;
import java.io.File;
import static java.lang.Math.log;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.swing.text.html.HTMLDocument;
import org.vaadin.dialogs.ConfirmDialog;

/**
 *
 * @author Thuclt-VNPTTech
 */
public class RepairLaborMngtController {

    RepairLaborMngtView view;
    RepairLaborMngtService service;

    private int repairType;

    CustomGrid pagedTable;
//    String[] headerName = new String[]{"Id", "Username", "Email", "Phone", ""};
    String prefix = "repairLaborMngt.list";//tien to trong file language
    String headerKey = "header.repairLaborMngt";//lay trong file cas
    String[] headerName = BundleUtils.getHeaderColumnName(prefix, headerKey);
    String[] headerColumn = BundleUtils.getHeaderColumn(headerKey);
    String jobListLabel = "repairLaborMngt.list";
    Resource resource;

    volatile WindowProgress wp;

    public RepairLaborMngtController(RepairLaborMngtView view) {
        this.view = view;
        this.pagedTable = view.getPagedTable();
        this.repairType = view.getRepairType();
        initTable(RepairLaborMngtService.getInstance().getListResultMaintain(repairType, null));
        doAction();
    }

    public void initTable(List<ResultMaintainDTO> lst) {
        List<RepairType> repairTypes = RepairTypeMngtService.getInstance().listRepairTypes("");
        List<String> headerTemp = Arrays.asList(headerColumn);
        List<String> tempList = new ArrayList<String>(headerTemp);
        if (lst != null && !lst.isEmpty()) {
            ResultMaintainDTO dto = lst.get(0);
            tempList.addAll(dto.getLstLabel());
        } else if (repairTypes != null) {
            for (RepairType repairType1 : repairTypes) {
                tempList.add(repairType1.getName());
            }
        }
        String[] tempArray = new String[tempList.size()];
        headerColumn = tempList.toArray(tempArray);
        IndexedContainer container = createContainer(lst, tempList);
        pagedTable.setDontCreatActionButton(1);
        pagedTable.genGrid(container, prefix, headerColumn, null, null);
        pagedTable.setRowStyleGenerator(new Grid.RowStyleGenerator() {

            @Override
            public String getStyle(Grid.RowReference row) {
                return ValoTheme.LAYOUT_HORIZONTAL_WRAPPING;
            }
        });
        pagedTable.setCellStyleGenerator(new Grid.CellStyleGenerator() {

            @Override
            public String getStyle(Grid.CellReference cell) {
                return ValoTheme.LAYOUT_HORIZONTAL_WRAPPING;
            }
        });
        pagedTable.addStyleName("commentsGrid");
        pagedTable.getColumn("name").setRenderer(new HtmlRenderer(), new Converter<String, String>() {

            @Override
            public String convertToModel(String value, Class<? extends String> targetType, Locale locale)
                    throws com.vaadin.data.util.converter.Converter.ConversionException {
                return value;
            }

            @Override
            public String convertToPresentation(String value, Class<? extends String> targetType, Locale locale)
                    throws com.vaadin.data.util.converter.Converter.ConversionException {
                if (value != null) {
                    return "<p class=\"wrap\">" + value + "</p>";
                } else {
                    return "";
                }
            }

            @Override
            public Class<String> getModelType() {
                return String.class;
            }

            @Override
            public Class<String> getPresentationType() {
                return String.class;
            }
        });
        pagedTable.getColumn("name").setWidth(400);

    }

    public void reloadData(List<ResultMaintainDTO> lstUnits, List<String> lstHeader) {
        pagedTable.setContainerDataSource(pagedTable.createWrapContainer(createContainer(lstUnits, lstHeader)));
    }

    public IndexedContainer createContainer(List<ResultMaintainDTO> lstUnits, List<String> lstHeader) {
        IndexedContainer container = new IndexedContainer();
        for (String type : lstHeader) {
            container.addContainerProperty(type, String.class, null);
        }
        int i = 1;
        for (ResultMaintainDTO j : lstUnits) {
            Item item = container.addItem(j);
            item.getItemProperty("stt").setValue(String.valueOf(i));
            item.getItemProperty("name").setValue(j.getName());
            item.getItemProperty("level").setValue(j.getSubInfo());
            List<String> lstData = j.getListHeader();
            List<String> lstLabel = j.getLstLabel();
            int k = 0;
            for (String data : lstData) {
                item.getItemProperty(lstLabel.get(k)).setValue(data);
                k++;
            }
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

//        view.getBtnAdd().addClickListener(new Button.ClickListener() {
//
//            @Override
//            public void buttonClick(Button.ClickEvent event) {
//                onInsert();
//            }
//        });
        view.getBtnImport().addClickListener(new Button.ClickListener() {

            @Override
            public void buttonClick(Button.ClickEvent event) {
                onCreateImportDialog();
            }
        });
    }

    public boolean validateData(RepairLaborMngtUI ui) {
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
        createDialog(true, new RepairLabor());
    }

    private void onUpdate(RepairLabor dto) {
        createDialog(false, dto);
    }

    private void onSearch() {
        String repairName = view.getTxtRepairLabor().getValue();
        List<ResultMaintainDTO> list = RepairLaborMngtService.getInstance().getListResultMaintain(repairType, repairName);
        reloadData(list, Arrays.asList(headerColumn));
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
                    List<RepairLabor> lstLaborParent = RepairLaborMngtService.getInstance().listRepairLabors("", String.valueOf(repairType));
                    List<RepairType> lstRepairType = RepairTypeMngtService.getInstance().listRepairTypes("");

                    List<String> headerList = new ArrayList<>();
                    headerList.add(BundleUtils.getString("repairLaborMngt.list.name"));
                    headerList.add(BundleUtils.getString("repairLaborMngt.list.level"));
                    for (RepairType type : lstRepairType) {
                        headerList.add(type.getName());
                    }
                    headerList.add(BundleUtils.getString("repairLaborMngt.list.decreaseLevel"));
                    String[] header = headerList.toArray(new String[0]);

                    List<AbstractMap.SimpleEntry<String, String>> headerAlign = new ArrayList<AbstractMap.SimpleEntry<String, String>>();
                    for (int i = 0; i < header.length; i++) {
                        headerAlign.add(new AbstractMap.SimpleEntry(header[i], "LEFT"));
                    }

                    String fileTemplate = VaadinService.getCurrent().getBaseDirectory().getAbsolutePath()
                            + Constants.FILE_CONF.PATH_IMPORT_TEMPLATE_XLS;

                    String subTitle = Constants.EMPTY_CHARACTER;
                    List<String[]> lstDataTemplate = new ArrayList<>();
                    for (RepairLabor labor : lstLaborParent) {
                        String[] objTemplate = new String[headerList.size() + 1];
                        objTemplate[1] = labor.getName();
                        lstDataTemplate.add(objTemplate);
                    }

                    File fileExport = CommonExport.exportFileTemplate(lstDataTemplate,//list du lieu
                            headerAlign,//header
                            //"userMngt.list",//header prefix
                            "",//header prefix
                            fileTemplate,//path template
                            BundleUtils.getString("repairLaborMngt.list"),//fileName out
                            7,//start row
                            subTitle,//sub title
                            4,//cell title Index
                            BundleUtils.getString("repairLaborMngt.list")//title
                    );
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
                Map<String, Integer> mapParent = new HashMap<>();
                List<RepairLabor> lstLaborParent = RepairLaborMngtService.getInstance().listRepairLabors("", String.valueOf(repairType));
                for (RepairLabor parent : lstLaborParent) {
                    mapParent.put(parent.getName(), parent.getId());
                }

                List<RepairType> lstRepairType = RepairTypeMngtService.getInstance().listRepairTypes("");

                String pathFileImport = url;
                File fileImport = new File(pathFileImport);
                List<Object[]> lstDataAll = ImportFileUI.importExcel(fileImport,
                        0,//sheet 
                        8,//begin row
                        0,//from column
                        lstRepairType.size() + 3,//to column
                        2);
                List<Object[]> lstData = new ArrayList<>();
                if (lstDataAll != null && lstDataAll.size() > Constants.FILE_CONF.MAX_ROW_IMPORT_USER) {
                    lstData = lstDataAll.subList(0, Constants.FILE_CONF.MAX_ROW_IMPORT_USER);
                } else if (lstDataAll != null && lstDataAll.size() < Constants.FILE_CONF.MAX_ROW_IMPORT_USER) {
                    lstData = lstDataAll;
                }

                List<RepairLabor> lstDataSave = new ArrayList<>();
                if (lstData != null && !lstData.isEmpty()) {

                    int currentParent = 0;
                    for (Object[] obj : lstData) {
                        if (obj[0] == null && obj[1] == null && obj[2] == null
                                && obj[3] == null && obj[4] == null && obj[5] == null
                                && obj[6] == null && obj[7] == null) {
                            break;
                        }
                        if (mapParent.get(String.valueOf(obj[1]).trim()) == null) {
                            int temp = 3;

                            for (RepairType type : lstRepairType) {
                                RepairLabor labor = new RepairLabor();
                                labor.setParentId(currentParent);
                                labor.setCode(obj[1] == null ? null : String.valueOf(obj[1]).trim());
                                labor.setName(obj[1] == null ? null : String.valueOf(obj[1]).trim());
                                labor.setLevel(obj[2] == null ? null : String.valueOf(obj[2]).trim());
                                labor.setDecreaseRate(obj[3 + lstRepairType.size()] == null ? null
                                        : String.valueOf(obj[3 + lstRepairType.size()]).trim());
                                labor.setRepairType(type);
                                labor.setQuota(obj[temp] == null || "".equals(obj[temp]) ? "0" : String.valueOf(obj[temp]).trim());
                                labor.setMaintainType(repairType);
                                lstDataSave.add(labor);
                                temp++;
                            }

                        } else {
                            currentParent = mapParent.get(String.valueOf(obj[1]));
                        }
                    }
                    RepairLaborMngtService.getInstance().removeRepairLaborByType(String.valueOf(repairType));
                    for (RepairLabor labor : lstDataSave) {
                        RepairLaborMngtService.getInstance().addRepairLabor(labor);
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

    private void initDataDialog(RepairLaborMngtUI ui, boolean isInsert, RepairLabor dto) {

        List<RepairLabor> lstParent = RepairLaborMngtService.getInstance().listRepairLabors("", String.valueOf(repairType));
        List<RepairType> lstType = RepairTypeMngtService.getInstance().listRepairTypes("");
        if (isInsert) {
            ComponentUtils.fillDataObjectCombo(ui.getCmbType(), "", "", lstType,
                    RepairType.class, "id", "name");
            ComponentUtils.fillDataObjectCombo(ui.getCmbParent(), "", "", lstParent,
                    RepairLabor.class, "id", "name");
        } else {
            ui.getTxtName().setValue(dto.getName() == null ? "" : dto.getName());
            ui.getTxtLevel().setValue(dto.getLevel() == null ? "" : dto.getLevel());
            ui.getTxtQuota().setValue(dto.getQuota() == null ? "" : dto.getQuota());
            ui.getTxtDecreaseLevel().setValue(dto.getDecreaseRate() == null ? "" : dto.getDecreaseRate());
            ComponentUtils.fillDataObjectCombo(ui.getCmbType(), "",
                    dto.getRepairType() == null ? "" : String.valueOf(dto.getRepairType().getId()),
                    lstType,
                    RepairType.class, "id", "name");
            ComponentUtils.fillDataObjectCombo(ui.getCmbParent(), "",
                    dto.getParentId() == null ? "" : String.valueOf(dto.getParentId()),
                    lstParent,
                    RepairLabor.class, "id", "name");
        }
    }

    public void createDialog(boolean isInsert, RepairLabor dto) {
        RepairLaborMngtUI ui = new RepairLaborMngtUI(isInsert ? BundleUtils.getString("common.button.add") : BundleUtils.getString("common.button.edit"));
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
                                            res = RepairLaborMngtService.getInstance().addRepairLabor(dto);
                                            ComponentUtils.showNotification(BundleUtils.getString("common.button.add") + " " + res.getKey() + " " + res.getMessage());
                                        } else {
                                            res = RepairLaborMngtService.getInstance().updateRepairLabor(dto);
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

    private void getDataFromUI(RepairLaborMngtUI ui, RepairLabor dto) {
        dto.setName(ui.getTxtName().getValue());
        dto.setLevel(ui.getTxtLevel().getValue());
        dto.setQuota(ui.getTxtQuota().getValue());
        dto.setDecreaseRate(ui.getTxtDecreaseLevel().getValue());
        RepairType type = (RepairType) ui.getCmbType().getValue();
        if (type != null && !DataUtil.isStringNullOrEmpty(type.getId()) && !Constants.DEFAULT_VALUE.equals(type.getId())) {
            dto.setRepairType(type);
        }
        RepairLabor parent = (RepairLabor) ui.getCmbParent().getValue();
        if (parent != null && !DataUtil.isStringNullOrEmpty(parent.getId()) && !Constants.DEFAULT_VALUE.equals(parent.getId())) {
            dto.setParentId(parent.getId());
        }
        dto.setMaintainType(repairType);
    }

}

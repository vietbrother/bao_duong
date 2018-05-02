/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.controller;

import com.iso.dashboard.component.CustomGrid;
import com.iso.dashboard.dto.CProfileMachine;
import com.iso.dashboard.dto.Employee;
import com.iso.dashboard.dto.MProfileEmployee;
import com.iso.dashboard.dto.RepairType;
import com.iso.dashboard.dto.ResultDTO;
import com.iso.dashboard.service.ProfileMachineEmployeeService;
import com.iso.dashboard.service.ProfileMachineMngtService;
import com.iso.dashboard.service.RepairTypeMngtService;
import com.iso.dashboard.ui.ProfileMachineMngtUI;
import com.iso.dashboard.utils.BundleUtils;
import com.iso.dashboard.utils.ComponentUtils;
import com.iso.dashboard.utils.Constants;
import com.iso.dashboard.utils.DataUtil;
import com.iso.dashboard.utils.ISOIcons;
import com.iso.dashboard.view.ProfileMachineMngtView;
import com.vaadin.data.Item;
import com.vaadin.data.util.IndexedContainer;
import com.vaadin.server.Resource;
import com.vaadin.server.Sizeable;
import com.vaadin.ui.Button;
import com.vaadin.ui.Notification;
import com.vaadin.ui.UI;
import com.vaadin.ui.Window;
import com.vaadin.ui.themes.Reindeer;
import java.util.ArrayList;
import java.util.List;
import org.vaadin.dialogs.ConfirmDialog;

public class ProfileMachineMngtController {

    ProfileMachineMngtView view;
    ProfileMachineMngtService service;

    CustomGrid pagedTable;
//    String[] headerName = new String[]{"Id", "Username", "Email", "Phone", ""};
    String prefix = "profileMachine.list";//tien to trong file language
    String headerKey = "header.profileMachineMngt";//lay trong file cas
    String[] headerName = BundleUtils.getHeaderColumnName(prefix, headerKey);
    String[] headerColumn = BundleUtils.getHeaderColumn(headerKey);
    String jobListLabel = "profileMachine.list";
    Resource resource;

    public ProfileMachineMngtController(ProfileMachineMngtView view) {
        this.view = view;
        this.pagedTable = view.getPagedTable();
        initTable(ProfileMachineMngtService.getInstance().listCProfileMachines(null));
        doAction();
    }

    public void initTable(List<CProfileMachine> lst) {
        IndexedContainer container = createContainer(lst);
        pagedTable.genGrid(container, prefix, headerColumn, null, new HandlerButtonActionGrid() {

            @Override
            public void actionEdit(Object obj) {
                CProfileMachine item = (CProfileMachine) obj;
                String uId = String.valueOf(item.getId());
                //Notification.show("Edit " + uId);
                CProfileMachine dto = ProfileMachineMngtService.getInstance().getCProfileMachineById(uId);
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
                                    CProfileMachine item = (CProfileMachine) obj;
                                    String delId = String.valueOf(item.getId());
                                    ResultDTO res = ProfileMachineMngtService.getInstance().removeCProfileMachine(delId);
                                    ProfileMachineEmployeeService.getInstance().removeMProfileEmployeeByProfileId(delId, null);
                                    ComponentUtils.showNotification(BundleUtils.getString("common.button.delete") + " " + res.getMessage());
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

    public void reloadData(List<CProfileMachine> lstUnits) {
        pagedTable.setContainerDataSource(pagedTable.createWrapContainer(createContainer(lstUnits)));
    }

    public IndexedContainer createContainer(List<CProfileMachine> lstUnits) {
        IndexedContainer container = new IndexedContainer();
//        container.addContainerProperty("stt", String.class, null);
        container.addContainerProperty("btnAction", String.class, null);
        container.addContainerProperty("id", String.class, null);
        container.addContainerProperty("code", String.class, null);
        container.addContainerProperty("name", String.class, null);
        container.addContainerProperty("type", String.class, null);
        container.addContainerProperty("country", String.class, null);
        for (CProfileMachine j : lstUnits) {
            Item item = container.addItem(j);
            item.getItemProperty("id").setValue(String.valueOf(j.getId()));
            item.getItemProperty("code").setValue(j.getCode());
            item.getItemProperty("name").setValue(j.getName());
            item.getItemProperty("type").setValue(j.getRepairType() == null ? "" : j.getRepairType().getName());
            item.getItemProperty("country").setValue(j.getManufactureCountry());
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

    public boolean validateData(ProfileMachineMngtUI ui) {
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
        createDialog(true, new CProfileMachine());
    }

    private void onUpdate(CProfileMachine dto) {
        createDialog(false, dto);
    }

    private void onSearch() {
        List<CProfileMachine> list = ProfileMachineMngtService.getInstance().listCProfileMachines(view.getTxtProfileMachine().getValue());
        Notification.show("lstUnits : " + list.size());
        reloadData(list);
    }

    private void initDataDialog(ProfileMachineMngtUI ui, boolean isInsert, CProfileMachine dto) {

        List<RepairType> lstType = RepairTypeMngtService.getInstance().listRepairTypes("");
        if (isInsert) {
            ComponentUtils.fillDataObjectCombo(ui.getCmbType(), "", "", lstType,
                    RepairType.class, "id", "name");
        } else {
            ui.getTxtName().setValue(dto.getName() == null ? "" : dto.getName());
            ui.getTxtCode().setValue(dto.getCode() == null ? "" : dto.getCode());
            ui.getTxtBattery().setValue(dto.getBattery() == null ? "" : dto.getBattery());
            ui.getTxtDriveSystem().setValue(dto.getDriveSystem() == null ? "" : dto.getDriveSystem());
            ui.getTxtManufactoryCountry().setValue(dto.getManufactureCountry() == null ? "" : dto.getManufactureCountry());
            ui.getTxtManufactoryYear().setValue(dto.getManufactureYear() == null ? "" : dto.getManufactureYear());
            ui.getTxtMaxPower().setValue(dto.getMaxPower() == null ? "" : dto.getMaxPower());
            ui.getTxtNumberSeating().setValue(dto.getNumberSeating() == null ? "" : dto.getNumberSeating());
            ui.getTxtSize().setValue(dto.getSizeTotal() == null ? "" : dto.getSizeTotal());
            ui.getTxtVolume().setValue(dto.getVolume() == null ? "" : dto.getVolume());
            ui.getTxtWeight().setValue(dto.getWeight() == null ? "" : dto.getWeight());
            ui.getTxtWeightCurrent().setValue(dto.getWeightCurrent()== null ? "" : dto.getWeightCurrent());
            ui.getTxtWheelFormula().setValue(dto.getWheelFormula() == null ? "" : dto.getWheelFormula());
            ui.getTxtWheelUse().setValue(dto.getWheelUse() == null ? "" : dto.getWheelUse());
            ui.getTxtWidth().setValue(dto.getWidth() == null ? "" : dto.getWidth());
            ui.getTxaDetail().setValue(dto.getDetail() == null ? "" : dto.getDetail());

            ComponentUtils.fillDataObjectCombo(ui.getCmbType(), "",
                    dto.getRepairType() == null ? "" : String.valueOf(dto.getRepairType().getId()),
                    lstType,
                    RepairType.class, "id", "name");

            List<MProfileEmployee> lstMapEmployees = ProfileMachineEmployeeService.getInstance().getMProfileEmployeeByProfileId(dto.getId());
            List<Employee> employees = new ArrayList<>();
            for (MProfileEmployee temp : lstMapEmployees) {
                employees.add(temp.getEmployee());
            }
            ui.getReferenceUi().getController().reloadData(employees);
        }
    }

    public void createDialog(boolean isInsert, CProfileMachine dto) {
        ProfileMachineMngtUI ui = new ProfileMachineMngtUI(isInsert ? "" : String.valueOf(dto.getId()), dto.getAvatar());
        Window window = new Window(
                "",
                ui);
        //window.setWidth("700px");
        window.setHeight(90.0f, Sizeable.Unit.PERCENTAGE);
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
                                        List<Employee> lstEmp = ui.getReferenceUi().getController().getEmployees();
                                        if (isInsert) {
                                            res = ProfileMachineMngtService.getInstance().addCProfileMachine(dto);
                                            if (res.getId() != null) {
                                                dto.setId(Integer.valueOf(res.getId()));
                                                if (lstEmp != null) {
                                                    List<MProfileEmployee> lstMap = new ArrayList<>();
                                                    for (Employee emp : lstEmp) {
                                                        MProfileEmployee mapping = new MProfileEmployee();
                                                        mapping.setEmployee(emp);
                                                        mapping.setProfile(dto);
                                                        lstMap.add(mapping);
                                                    }
                                                    for (MProfileEmployee mapPE : lstMap) {
                                                        ProfileMachineEmployeeService.getInstance().addMProfileEmployee(mapPE);
                                                    }
                                                }
                                            }
                                            ComponentUtils.showNotification(BundleUtils.getString("common.button.add") + " " + res.getKey() + " " + res.getMessage());
                                        } else {
                                            res = ProfileMachineMngtService.getInstance().updateCProfileMachine(dto);
                                            ProfileMachineEmployeeService.getInstance().removeMProfileEmployeeByProfileId(String.valueOf(dto.getId()), null);
                                            if (lstEmp != null) {
                                                List<MProfileEmployee> lstMap = new ArrayList<>();
                                                for (Employee emp : lstEmp) {
                                                    MProfileEmployee mapping = new MProfileEmployee();
                                                    mapping.setEmployee(emp);
                                                    mapping.setProfile(dto);
                                                    lstMap.add(mapping);
                                                }
                                                for (MProfileEmployee mapPE : lstMap) {
                                                    ProfileMachineEmployeeService.getInstance().addMProfileEmployee(mapPE);
                                                }
                                            }
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

    private void getDataFromUI(ProfileMachineMngtUI ui, CProfileMachine dto) {
        dto.setName(ui.getTxtName().getValue().trim());
        dto.setCode(ui.getTxtCode().getValue().trim());
        dto.setBattery(ui.getTxtBattery().getValue());
        dto.setAvatar(ui.getUploadAvatar().getUrl() == null ? "" 
                : (ui.getUploadAvatar().getPath() + ui.getUploadAvatar().getUrl().get(0)));
        dto.setDetail(ui.getTxaDetail().getValue());
        dto.setDriveSystem(ui.getTxtDriveSystem().getValue());
        dto.setManufactureCountry(ui.getTxtManufactoryCountry().getValue());
        dto.setManufactureYear(ui.getTxtManufactoryYear().getValue());
        dto.setMaxPower(ui.getTxtMaxPower().getValue());
        dto.setNumberSeating(ui.getTxtNumberSeating().getValue());
        dto.setSizeTotal(ui.getTxtSize().getValue());
        dto.setVolume(ui.getTxtVolume().getValue());
        dto.setWeight(ui.getTxtWeight().getValue());
        dto.setWeightCurrent(ui.getTxtWeightCurrent().getValue());
        dto.setWheelFormula(ui.getTxtWheelFormula().getValue());
        dto.setWheelUse(ui.getTxtWheelUse().getValue());
        dto.setWidth(ui.getTxtWidth().getValue());
        
        RepairType type = (RepairType) ui.getCmbType().getValue();
        if (type != null && !DataUtil.isStringNullOrEmpty(type.getId()) && !Constants.DEFAULT_VALUE.equals(type.getId())) {
            dto.setRepairType(type);
        }
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.controller;

import com.iso.dashboard.component.CustomPageTable;
import com.iso.dashboard.dto.CProfileMachine;
import com.iso.dashboard.dto.CTask;
import com.iso.dashboard.dto.CTaskAssignee;
import com.iso.dashboard.dto.CTaskAssigneePK;
import com.iso.dashboard.dto.Employee;
import com.iso.dashboard.dto.MProfileEmployee;
import com.iso.dashboard.service.EmployeeMngtService;
import com.iso.dashboard.service.ProfileMachineEmployeeService;
import com.iso.dashboard.service.TaskOrgMngService;
import com.iso.dashboard.service.UserMngService;
import com.iso.dashboard.ui.TaskReportMngtUI;
import com.iso.dashboard.ui.TreeEmployeeSearchUI;
import com.iso.dashboard.utils.BundleUtils;
import com.iso.dashboard.utils.Constants;
import com.iso.dashboard.utils.DataUtil;
import com.iso.dashboard.utils.ISOIcons;
import com.iso.dashboard.view.ProfileReferenceView;
import com.vaadin.data.Item;
import com.vaadin.data.util.IndexedContainer;
import com.vaadin.server.Resource;
import com.vaadin.server.Sizeable;
import com.vaadin.ui.Alignment;
import com.vaadin.ui.Button;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Notification;
import com.vaadin.ui.Table;
import com.vaadin.ui.UI;
import com.vaadin.ui.Window;
import com.vaadin.ui.themes.ValoTheme;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author VIET_BROTHER
 */
public class ProfileReferenceController {

    ProfileReferenceView view;
    UserMngService service;

    CustomPageTable pagedTable;
//    String[] headerName = new String[]{"Id", "Username", "Email", "Phone", ""};
    String prefix = "task.assign.list";//tien to trong file language
    String headerKey = "header.taskAssign";//lay trong file cas
    String[] headerName = BundleUtils.getHeaderColumnName(prefix, headerKey);
    String[] columnVisible = BundleUtils.getHeaderColumnVisible(headerKey);
    String userListLabel = "task.attach.list";
    Resource resource;
    private List<Employee> employees = new ArrayList<>();
    private String profileId;

    public ProfileReferenceController(ProfileReferenceView view, String profileId) {
        this.view = view;
        this.pagedTable = view.getPagedTable();
        this.profileId = profileId;
        if (profileId != null && !"".equals(profileId)) {
            //List<MProfileEmployee> assignees = ProfileMachineEmployeeService.getInstance().listMProfileEmployee(String.valueOf(profileId));
            List<MProfileEmployee> assignees = ProfileMachineEmployeeService.getInstance().getMProfileEmployeeByProfileId(Integer.valueOf(profileId));
            if (assignees != null) {
                assignees.forEach((assignee) -> {
                    employees.add(assignee.getEmployee());
                });
            }
        }
        initTable(employees, profileId);
        doAction();
    }

    public void initTable(List<Employee> lstEmployee, String profileId) {

        pagedTable.addGeneratedColumn("action", (Table source, Object itemId, Object columnId) -> {
            Button btnDelete = new Button();
            btnDelete.setIcon(ISOIcons.DELETE);
            btnDelete.setStyleName(ValoTheme.BUTTON_BORDERLESS_COLORED);
            btnDelete.setDescription(BundleUtils.getString("common.button.delete"));
            btnDelete.addClickListener((Button.ClickEvent event) -> {
                Employee employee = (Employee) itemId;
                if (profileId != null && !"".equals(profileId)) {
                    MProfileEmployee assignees = ProfileMachineEmployeeService.getInstance().getMProfileEmployeeByEmployeeId(employee.getId());
                    if (assignees != null) {
                        ProfileMachineEmployeeService.getInstance().removeMProfileEmployee(String.valueOf(assignees.getId()));
                    }
                }
                employees.remove(employee);
                reloadData(employees);
            });
            HorizontalLayout hori = new HorizontalLayout();
            hori.addComponent(btnDelete);
            hori.setComponentAlignment(btnDelete, Alignment.MIDDLE_CENTER);
            return hori;
        }//            private static final long serialVersionUID = -5042109683675242407L;
        );
        reloadData(lstEmployee);
        pagedTable.setSizeFull();
        pagedTable.setPageLength(10);
        pagedTable.setImmediate(true);
        pagedTable.setSelectable(true);
        pagedTable.setAlwaysRecalculateColumnWidths(true);
        pagedTable.setResponsive(true);
        pagedTable.setColumnHeaders(headerName);
        pagedTable.setVisibleColumns((Object[]) columnVisible);
    }

    public IndexedContainer createContainer(List<Employee> lstUser) {
        IndexedContainer container = new IndexedContainer();
        container.addContainerProperty("index", Integer.class, null);
        container.addContainerProperty("action", String.class, null);
        container.addContainerProperty("name", String.class, null);
        container.addContainerProperty("title", String.class, null);
        container.addContainerProperty("department", String.class, null);
        int i = 1;
        for (Employee u : lstUser) {
            Item item = container.addItem(u);
            item.getItemProperty("index").setValue(i);
            item.getItemProperty("name").setValue(u.getFirstName() + " " + u.getLastName());
            item.getItemProperty("title").setValue(u.getJob().getJobTitle());
            item.getItemProperty("department").setValue(u.getDepartment().getName());
            i++;
        };
        container.sort(new Object[]{"name"}, new boolean[]{true});
        return container;
    }

    public void reloadData(List<Employee> lstUsers) {
        pagedTable.setContainerDataSource(createContainer(lstUsers));
    }

    private void doAction() {

        view.getBtnAdd().addClickListener((Button.ClickEvent event) -> {
            onInsert(profileId);
        });

    }

    public boolean validateData(TaskReportMngtUI ui) {
        if (DataUtil.isNullOrEmpty(ui.getTxaTaskContent().getValue())) {
            Notification.show(BundleUtils.getString("userMngt.list.mobile") + Constants.SPACE_CHARACTER + BundleUtils.getString("common.notnull"));
            return false;
        }

        if (ui.getPbTimeAttach().getValue() == null) {
            Notification.show(BundleUtils.getString("task.attach.list.time") + Constants.SPACE_CHARACTER
                    + BundleUtils.getString("common.notnull"));
            return false;
        }
        return true;
    }

    private void onInsert(String profileId) {
        TreeEmployeeSearchUI ui = new TreeEmployeeSearchUI("");
        Window window = new Window("", ui);
        float height = UI.getCurrent().getWidth() * 7.5f / 10;
        window.setWidth(String.valueOf(height) + "%");
        window.setHeight(50.0f, Sizeable.Unit.PERCENTAGE);
        ui.setWidth("100%");
        ui.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        ui.getBtnSelect().addClickListener((Button.ClickEvent event) -> {
            List<Employee> list = ui.getTreeTaskSelected();
            if (list != null) {
                list.stream().filter((emp) -> (!employees.contains(emp))).forEach((emp) -> {
                    employees.add(emp);
                });
            }
            reloadData(employees);
            CTask cTask = TaskOrgMngService.getInstance().getTaskOrgById(String.valueOf(profileId));
            if (cTask != null && (cTask.getStatus() == null || cTask.getStatus() == 1)) {
                cTask.setStatus(2);
                TaskOrgMngService.getInstance().updateTaskOrg(cTask);
            }
            window.close();
        });
        window.setModal(true);
        DataUtil.reloadWindow(window);
        UI.getCurrent().addWindow(window);
    }

    public ProfileReferenceView getView() {
        return view;
    }

    public void setView(ProfileReferenceView view) {
        this.view = view;
    }

    public UserMngService getService() {
        return service;
    }

    public void setService(UserMngService service) {
        this.service = service;
    }

    public CustomPageTable getPagedTable() {
        return pagedTable;
    }

    public void setPagedTable(CustomPageTable pagedTable) {
        this.pagedTable = pagedTable;
    }

    public String getPrefix() {
        return prefix;
    }

    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }

    public String getHeaderKey() {
        return headerKey;
    }

    public void setHeaderKey(String headerKey) {
        this.headerKey = headerKey;
    }

    public String[] getHeaderName() {
        return headerName;
    }

    public void setHeaderName(String[] headerName) {
        this.headerName = headerName;
    }

    public String[] getColumnVisible() {
        return columnVisible;
    }

    public void setColumnVisible(String[] columnVisible) {
        this.columnVisible = columnVisible;
    }

    public String getUserListLabel() {
        return userListLabel;
    }

    public void setUserListLabel(String userListLabel) {
        this.userListLabel = userListLabel;
    }

    public Resource getResource() {
        return resource;
    }

    public void setResource(Resource resource) {
        this.resource = resource;
    }

    public List<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(List<Employee> employees) {
        this.employees = employees;
    }

    
}

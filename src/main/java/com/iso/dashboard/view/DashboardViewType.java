package com.iso.dashboard.view;

import com.iso.dashboard.view.dashboard.DashboardView;
import com.iso.view.reports.ReportsView;
import com.iso.dashboard.view.sales.SalesView;
import com.vaadin.icons.VaadinIcons;
//import com.iso.dashboard.view.transactions.TransactionsView;
import com.vaadin.navigator.View;
import com.vaadin.server.FontAwesome;
import com.vaadin.server.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public enum DashboardViewType {

    DASHBOARD("dashboard", DashboardView.class, FontAwesome.HOME, true, true, false),
    //USER_MNGT("userMngt", UserMngtView.class, FontAwesome.USER_PLUS, true, true, false),
    ORGANIZATION_MNGT("organizationMngt", OrganizationMngtView.class, FontAwesome.SITEMAP, true, true, false),
    //
//    STAFF_MNGT("staffMngt", DashboardView.class, VaadinIcons.USERS, true, true, true),
    STAFF_EMPLOYEE_MNGT("employeeMngt", EmployeeMngtView.class, FontAwesome.USERS, true, true, false),
    PROFILE_MNGT("profileMachineMngt", ProfileMachineMngtView.class, FontAwesome.BOOK, true, true, false),
//    STAFF_JOB_MNGT("jobMngt", JobMngtView.class, FontAwesome.ANGLE_RIGHT, true, false, false),
//    STAFF_EMPLOYEE_TYPE_MNGT("employeeTypeMngt", EmployeeTypeMngtView.class, FontAwesome.ANGLE_RIGHT, true, false, false),
    //
//    TASK_MNGT("taskMngt", DashboardView.class, VaadinIcons.CALENDAR_CLOCK, true, true, true),
//    TASK_GROUP_MNGT("taskGroupMngt", CataTaskGroupMngtView.class, FontAwesome.TASKS, true, false, false),
//    TASK_PRIORITY_MNGT("taskPriorityMngt", CataTaskPriorityMngtView.class, FontAwesome.TASKS, true, false, false),
//    TASK_ORG_MNGT("taskOrgMngt", TaskOrgMngtView.class, FontAwesome.TASKS, true, false, false),
//    TASK_PERSONAL_MNGT("taskPersonalMngt", TaskPersonalMngtView.class, FontAwesome.TASKS, true, false, false),
//    TASK_ASIGN_MNGT("taskAsignMngt", TaskAsignMngtView.class, FontAwesome.TASKS, true, false, false),
//    ARCHIVES_MNGT("archivesMngt", DashboardView.class, VaadinIcons.CALENDAR_BRIEFCASE, true, true, true),
//    ARCHIVES_FILE_MNGT("fileMngt", FileMngtView.class, FontAwesome.FILE_O, true, false, false),
//    ARCHIVES_DOCUMENT_MNGT("documentMngt", DocumentMngtView.class, FontAwesome.FILE_O, true, false, false),
//    PROCESS_MNGT("processMngt", DashboardView.class, VaadinIcons.FILE_TREE, true, true, true),
//    GUIDE_MNGT("guideMngt", CataGuideMngtView.class, VaadinIcons.BOOKMARK, true, false, false),
    //
    ASSET_MNGT("assetMngt", DashboardView.class, FontAwesome.ARCHIVE, true, true, true),
    REPAIR_TYPE_MNGT("repairTypeMngt", RepairTypeMngtView.class, FontAwesome.ANGLE_RIGHT, true, false, false),

	//ASSET_LIST_MNGT("assetListMngt", AssetMngtView.class, FontAwesome.ANGLE_RIGHT, true, false, false),
    //C_UNIT_MNGT("unitMngt", UnitMngtView.class, FontAwesome.ANGLE_RIGHT, true, false, false),
    //PROVIDER_MNGT("providerMngt", ProviderMngtView.class, FontAwesome.ANGLE_RIGHT, true, false, false),
    //ASSET_TYPE_MNGT("assetTypeMngt", AssetTypeMngtView.class, FontAwesome.ANGLE_RIGHT, true, false, false),
    //ASSET_GROUP_MNGT("assetGroupMngt", AssetGroupMngtView.class, FontAwesome.ANGLE_RIGHT, true, false, false),
    //ASSET_CLASS_MNGT("assetClassMngt", AssetClassMngtView.class, FontAwesome.ANGLE_RIGHT, true, false, false),
    //
    MATERIAL_MNGT("materialMngt", DashboardView.class, FontAwesome.MAGNET, true, true, true),
    MATERIAL_LIST_MNGT("materialListMngt", MaterialMngtView.class, FontAwesome.ANGLE_RIGHT, true, false, false),
    //
    //MAINTENANCE_MNGT("maintenanceMngt", DashboardView.class, FontAwesome.CAR, true, true, true),
    //MAINTENANCE_0_MNGT("maintenance0Mngt", Maintenance1MngtView.class, FontAwesome.ANGLE_RIGHT, true, false, false),
    //MAINTENANCE_1_MNGT("maintenance1Mngt", Maintenance1MngtView.class, FontAwesome.ANGLE_RIGHT, true, false, false),
    //MAINTENANCE_2_MNGT("maintenance2Mngt", Maintenance1MngtView.class, FontAwesome.ANGLE_RIGHT, true, false, false),
    //
    REPAIR_MNGT("repairMngt", DashboardView.class, FontAwesome.ARCHIVE, true, true, true),
    //REPAIR_TYPE_MNGT("repairTypeMngt", RepairTypeMngtView.class, FontAwesome.ANGLE_RIGHT, true, false, false),
    REPAIR_LABOR_MNGT("repairLaborMngt", RepairLaborMngtView.class, FontAwesome.ANGLE_RIGHT, true, false, false),
    
    MAINTEN1_LABOR_MNGT("mainten1LaborMngt", Mainten1LaborMngtView.class, FontAwesome.ANGLE_RIGHT, true, false, false),
    MAINTEN2_LABOR_MNGT("mainten2LaborMngt", Mainten2LaborMngtView.class, FontAwesome.ANGLE_RIGHT, true, false, false);

    public static Map<String, List<DashboardViewType>> mapSubMenu = new HashMap<>();

    static {
//        List<DashboardViewType> lstWorkMngtSubMenu = new ArrayList<>();
//        lstWorkMngtSubMenu.add(TASK_GROUP_MNGT);
//        lstWorkMngtSubMenu.add(TASK_PRIORITY_MNGT);
//        lstWorkMngtSubMenu.add(TASK_ORG_MNGT);
//        lstWorkMngtSubMenu.add(TASK_PERSONAL_MNGT);
//        lstWorkMngtSubMenu.add(TASK_ASIGN_MNGT);
//        mapSubMenu.put(TASK_MNGT.getViewName(), lstWorkMngtSubMenu);

//        List<DashboardViewType> lstArchivesMngtSubMenu = new ArrayList<>();
//        lstArchivesMngtSubMenu.add(ARCHIVES_FILE_MNGT);
//        lstArchivesMngtSubMenu.add(ARCHIVES_DOCUMENT_MNGT);
//        mapSubMenu.put(ARCHIVES_MNGT.getViewName(), lstArchivesMngtSubMenu);
//
//        List<DashboardViewType> lstStaffMngtSubMenu = new ArrayList<>();
//        lstStaffMngtSubMenu.add(STAFF_EMPLOYEE_MNGT);
//        lstStaffMngtSubMenu.add(STAFF_JOB_MNGT);
//        lstStaffMngtSubMenu.add(STAFF_EMPLOYEE_TYPE_MNGT);
//        mapSubMenu.put(STAFF_MNGT.getViewName(), lstStaffMngtSubMenu);
//
//        List<DashboardViewType> lstProcessMngtSubMenu = new ArrayList<>();
//        lstProcessMngtSubMenu.add(GUIDE_MNGT);
//        mapSubMenu.put(PROCESS_MNGT.getViewName(), lstProcessMngtSubMenu);

        List<DashboardViewType> lstAssetMngtSubMenu = new ArrayList<>();
        lstAssetMngtSubMenu.add(REPAIR_TYPE_MNGT);
        mapSubMenu.put(ASSET_MNGT.getViewName(), lstAssetMngtSubMenu);
        
        List<DashboardViewType> lstMaterialMngtSubMenu = new ArrayList<>();
        lstMaterialMngtSubMenu.add(MATERIAL_LIST_MNGT);
        mapSubMenu.put(MATERIAL_MNGT.getViewName(), lstMaterialMngtSubMenu);
        
        List<DashboardViewType> lstRepairMngtSubMenu = new ArrayList<>();
        lstRepairMngtSubMenu.add(REPAIR_LABOR_MNGT);
        lstRepairMngtSubMenu.add(MAINTEN1_LABOR_MNGT);
        lstRepairMngtSubMenu.add(MAINTEN2_LABOR_MNGT);
        mapSubMenu.put(REPAIR_MNGT.getViewName(), lstRepairMngtSubMenu);

    }

    private final String viewName;
    private final Class<? extends View> viewClass;
    private final Resource icon;
    private final boolean stateful;
    private final boolean isParentView;
    private final boolean isContainChild;

    private DashboardViewType(final String viewName,
            final Class<? extends View> viewClass, final Resource icon,
            final boolean stateful,
            boolean isParentView, boolean isContainChild) {
        this.viewName = viewName;
        this.viewClass = viewClass;
        this.icon = icon;
        this.stateful = stateful;
        this.isParentView = isParentView;
        this.isContainChild = isContainChild;
    }

    public boolean isStateful() {
        return stateful;
    }

    public String getViewName() {
        return viewName;
    }

    public boolean isParentView() {
        return isParentView;
    }

    public boolean isContainChild() {
        return isContainChild;
    }

    public Class<? extends View> getViewClass() {
        return viewClass;
    }

    public Resource getIcon() {
        return icon;
    }

    public static DashboardViewType getByViewName(final String viewName) {
        DashboardViewType result = null;
        for (DashboardViewType viewType : values()) {
            if (viewType.getViewName().equals(viewName)) {
                result = viewType;
                break;
            }
        }
        return result;
    }

}

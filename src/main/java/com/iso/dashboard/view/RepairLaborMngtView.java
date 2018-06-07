/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.view;

import com.iso.dashboard.component.CustomGrid;
import com.iso.dashboard.controller.RepairLaborMngtController;
import com.iso.dashboard.dto.RepairLabor;
import com.iso.dashboard.utils.BundleUtils;
import com.iso.dashboard.utils.Constants;
import com.iso.dashboard.utils.ISOIcons;
import com.vaadin.navigator.View;
import com.vaadin.navigator.ViewChangeListener;
import com.vaadin.server.Responsive;
import com.vaadin.ui.Alignment;
import com.vaadin.ui.Button;
import com.vaadin.ui.Component;
import com.vaadin.ui.CssLayout;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Panel;
import com.vaadin.ui.TabSheet;
import com.vaadin.ui.TextField;
import com.vaadin.ui.VerticalLayout;
import com.vaadin.ui.themes.ValoTheme;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Thuclt-VNPTTech
 */
public class RepairLaborMngtView extends Panel implements View {

    private TextField txtRepairLabor;

    private Button btnSearch;
    private Button btnAdd;
    private Button btnImport;

    private CustomGrid pagedTable;

    private int repairType;

    public List<RepairLabor> repairTypes = new ArrayList<>();

    public RepairLaborMngtView() {
        setSizeFull();
//        addStyleName("transactions");
        addStyleName(ValoTheme.PANEL_BORDERLESS);
//        setMargin(false);
//        setSpacing(false);
        setSizeFull();
        VerticalLayout root = new VerticalLayout();
        root.setCaption(BundleUtils.getStringCas("menu.repairLaborMngt"));
        root.setSizeFull();
        root.setSpacing(false);
        root.addStyleName("dashboard-view");
//        root.addStyleName("transactions");
//        setContent(root);
        Responsive.makeResponsive(root);

        Component content = buildContent();
        TabSheet tabSheet = new TabSheet();
//        tabSheet.setCaption(BundleUtils.getStringCas("menu.userMngt"));
        tabSheet.setStyleName(ValoTheme.TABSHEET_PADDED_TABBAR);
        tabSheet.setStyleName(ValoTheme.TABSHEET_ICONS_ON_TOP);
        setContent(tabSheet);
        tabSheet.addComponent(root);
        root.addComponent(content);
        root.setExpandRatio(content, 1);

//        addComponent(buildToolbar());
        new RepairLaborMngtController(this);
    }

    public RepairLaborMngtView(int repairType) {
        this.repairType = repairType;
        setSizeFull();
//        addStyleName("transactions");
        addStyleName(ValoTheme.PANEL_BORDERLESS);
//        setMargin(false);
//        setSpacing(false);
        setSizeFull();
        VerticalLayout root = new VerticalLayout();
        root.setCaption(BundleUtils.getStringCas("menu.repairLaborMngt"));
        root.setSizeFull();
        root.setSpacing(false);
        root.addStyleName("dashboard-view");
//        root.addStyleName("transactions");
//        setContent(root);
        Responsive.makeResponsive(root);

        Component content = buildContent();
        TabSheet tabSheet = new TabSheet();
//        tabSheet.setCaption(BundleUtils.getStringCas("menu.userMngt"));
        tabSheet.setStyleName(ValoTheme.TABSHEET_PADDED_TABBAR);
        tabSheet.setStyleName(ValoTheme.TABSHEET_ICONS_ON_TOP);
        setContent(tabSheet);
        tabSheet.addComponent(root);
        root.addComponent(content);
        root.setExpandRatio(content, 1);

//        addComponent(buildToolbar());
        new RepairLaborMngtController(this);
    }

    private Component buildContent() {
        CssLayout contenPanel = new CssLayout();
        contenPanel.addStyleName("dashboard-panels");
        Responsive.makeResponsive(contenPanel);

        contenPanel.addComponent(buildToolbar());
        contenPanel.addComponent(buildResultLayout());

        return contenPanel;
    }

    private Component buildToolbar() {
        HorizontalLayout header = new HorizontalLayout();
        header.addStyleName("viewheader");
        header.setSpacing(true);
        Responsive.makeResponsive(header);

        HorizontalLayout condition = buildSearchForm();
        condition.addStyleName("toolbar");
        header.addComponent(condition);
        header.setExpandRatio(condition, 6.0f);

        HorizontalLayout tools = buildButtonForm();
        tools.addStyleName("toolbar");
        header.addComponent(tools);
        header.setExpandRatio(tools, 3.0f);

        return header;
    }

    private Component buildResultLayout() {
        VerticalLayout mainLayout = new VerticalLayout();
        mainLayout.setWidth("100%");

        for (int i = 0; i < 240; i++) {
            RepairLabor et = new RepairLabor();
            et.setName(i + "_@native.com");
//            job.setUserName(i + "_native");
            et.setId(i + 1);
            repairTypes.add(et);
        }
        VerticalLayout tableLayout = new VerticalLayout();
        tableLayout.setSizeFull();
        CustomGrid table = createTable();
        tableLayout.addComponent(table);
        mainLayout.addComponent(tableLayout);
        mainLayout.setComponentAlignment(tableLayout, Alignment.MIDDLE_LEFT);

        mainLayout.setMargin(true);
        return mainLayout;
    }

    public CustomGrid createTable() {
        pagedTable = new CustomGrid();

        return pagedTable;
    }

    private HorizontalLayout buildSearchForm() {
        HorizontalLayout searchForm = new HorizontalLayout();
        searchForm.setSpacing(true);
        Responsive.makeResponsive(searchForm);

        txtRepairLabor = new TextField();
        txtRepairLabor.setImmediate(true);
        txtRepairLabor.setInputPrompt(BundleUtils.getString("repairTypeMngt.list.name"));
        txtRepairLabor.setWidth("100.0%");
        txtRepairLabor.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        searchForm.addComponent(txtRepairLabor);

        return searchForm;
    }

    private HorizontalLayout buildButtonForm() {
        HorizontalLayout buttonForm = new HorizontalLayout();
        buttonForm.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        Responsive.makeResponsive(buttonForm);

        btnSearch = new Button();
        btnSearch.setCaption(BundleUtils.getString("common.button.search"));
        btnSearch.setDescription(BundleUtils.getString("common.button.search"));
        btnSearch.setIcon(ISOIcons.SEARCH);
        btnSearch.setImmediate(true);
        btnSearch.setWidth(Constants.STYLE_CONF.AUTO_VALUE);
        btnSearch.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        btnSearch.setStyleName(ValoTheme.BUTTON_PRIMARY);
        buttonForm.addComponent(btnSearch);

        // btnImport
        btnImport = new Button();
        btnImport.setCaption(BundleUtils.getString("common.button.upload"));
        btnImport.setDescription(BundleUtils.getString("common.button.upload"));
        btnImport.setIcon(ISOIcons.IMPORT);
        btnImport.setImmediate(true);
        btnImport.setWidth(Constants.STYLE_CONF.AUTO_VALUE);
        btnImport.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        buttonForm.addComponent(btnImport);

//        btnAdd = new Button();
//        btnAdd.setCaption(BundleUtils.getString("common.button.add"));
//        btnAdd.setDescription(BundleUtils.getString("common.button.add"));
//        btnAdd.setIcon(ISOIcons.ADD);
//        btnAdd.setImmediate(true);
//        btnAdd.setWidth(Constants.STYLE_CONF.AUTO_VALUE);
//        btnAdd.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
//        buttonForm.addComponent(btnAdd);

        return buttonForm;
    }

    @Override
    public void enter(ViewChangeListener.ViewChangeEvent event) {
        //action when load view
    }

    public TextField getTxtRepairLabor() {
        return txtRepairLabor;
    }

    public void setTxtRepairLabor(TextField txtRepairLabor) {
        this.txtRepairLabor = txtRepairLabor;
    }

    public Button getBtnSearch() {
        return btnSearch;
    }

    public void setBtnSearch(Button btnSearch) {
        this.btnSearch = btnSearch;
    }

    public Button getBtnAdd() {
        return btnAdd;
    }

    public void setBtnAdd(Button btnAdd) {
        this.btnAdd = btnAdd;
    }

    public Button getBtnImport() {
        return btnImport;
    }

    public void setBtnImport(Button btnImport) {
        this.btnImport = btnImport;
    }

    public List<RepairLabor> getRepairTypes() {
        return repairTypes;
    }

    public void setRepairTypes(List<RepairLabor> repairTypes) {
        this.repairTypes = repairTypes;
    }

    public CustomGrid getPagedTable() {
        return pagedTable;
    }

    public void setPagedTable(CustomGrid pagedTable) {
        this.pagedTable = pagedTable;
    }

    public List<RepairLabor> getRepairLabors() {
        return repairTypes;
    }

    public void setRepairLabors(List<RepairLabor> repairTypes) {
        this.repairTypes = repairTypes;
    }

    public int getRepairType() {
        return repairType;
    }

    public void setRepairType(int repairType) {
        this.repairType = repairType;
    }

}

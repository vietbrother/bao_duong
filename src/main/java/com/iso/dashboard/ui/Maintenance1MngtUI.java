/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.ui;

import com.iso.dashboard.utils.BundleUtils;
import com.iso.dashboard.utils.Constants;
import com.iso.dashboard.utils.ISOIcons;
import com.iso.dashboard.view.EmployeeEducationMngtView;
import com.iso.dashboard.view.EmployeeProcessMngtView;
import com.iso.dashboard.view.EmployeeRewardMngtView;
import com.vaadin.server.FontAwesome;
import com.vaadin.server.Responsive;
import com.vaadin.server.Sizeable;
import com.vaadin.ui.Alignment;
import com.vaadin.ui.Button;
import com.vaadin.ui.CheckBox;
import com.vaadin.ui.Component;
import com.vaadin.ui.CssLayout;
import com.vaadin.ui.FormLayout;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Label;
import com.vaadin.ui.TabSheet;
import com.vaadin.ui.TextField;
import com.vaadin.ui.VerticalLayout;
import com.vaadin.ui.themes.ValoTheme;

/**
 *
 * @author Thuclt-VNPTTech
 */
public class Maintenance1MngtUI extends VerticalLayout {

    private VerticalLayout mainLayout;

    private TextField txtAssetCode;

    private TextField txtAssetName;
    private TextField txtKmNumber;
    private Label lbCataMaintenance; // Hạng mục sữa chửa
    private Label lbxEmpty1;
    private Label lbxEmpty2;
    private CheckBox cbxBDDinhKy1; // Bảo dưỡng định kỳ 1
    private CheckBox cbxBDDinhKy2; // Bảo dưỡng định kỳ 2
    private CheckBox cbxSuaKhamLuuHanh; // Sửa khám lưu hành
    private CheckBox cbxSuaChuaDotXuat; // Sửa chữa đột xuất
    private CheckBox cbxSuaChuaTaiNan; // Sửa chữa tai nạn

    private TextField txtEmployeeName;
    private TextField txtDepartment;

    private Button btnSave;
    private Button btnCancel;

    private String caption;

    public Maintenance1MngtUI(String caption) {
        this.caption = caption;
        this.setIcon(FontAwesome.CALENDAR);
        addComponent(buildFieldsInfo());

        EmployeeProcessMngtView employeeProcessMngtView = new EmployeeProcessMngtView();
        employeeProcessMngtView.getBtnAdd().setVisible(false);
        employeeProcessMngtView.getBtnExport().setVisible(false);
        employeeProcessMngtView.getBtnSearch().setVisible(false);
        employeeProcessMngtView.getTxtEmployeeProcess().setVisible(false);
        employeeProcessMngtView.getHeader().setVisible(false);
        employeeProcessMngtView.setCaption("1. ẮC QUY");

        TabSheet detailsWrapper = new TabSheet(employeeProcessMngtView);
        detailsWrapper.setSizeFull();
        detailsWrapper.addStyleName(ValoTheme.TABSHEET_PADDED_TABBAR);
        addComponent(detailsWrapper);
        addComponent(buildButton());

        // add new tab
        EmployeeEducationMngtView employeeEducationMngtView = new EmployeeEducationMngtView();
        employeeEducationMngtView.getBtnAdd().setVisible(false);
        employeeEducationMngtView.getBtnExport().setVisible(false);
        employeeEducationMngtView.getBtnSearch().setVisible(false);
        employeeEducationMngtView.getTxtEmployeeEducation().setVisible(false);
        employeeEducationMngtView.setCaption("2. LỐP");
        employeeEducationMngtView.getHeader().setVisible(false);
        detailsWrapper.addTab(employeeEducationMngtView);

        // add new tab
        EmployeeRewardMngtView rewardMngtView = new EmployeeRewardMngtView();
        rewardMngtView.getBtnAdd().setVisible(false);
        rewardMngtView.getBtnExport().setVisible(false);
        rewardMngtView.getBtnSearch().setVisible(false);
        rewardMngtView.getTxtEmployeeReward().setVisible(false);
        rewardMngtView.setCaption("3. CÁC PHỤ TÙNG KHÁC");
        rewardMngtView.getHeader().setVisible(false);
        detailsWrapper.addTab(rewardMngtView);

    }

    private void buildMainLayout() {
        mainLayout = new VerticalLayout();
        mainLayout.setCaption(this.caption);
        mainLayout.setIcon(FontAwesome.CALENDAR);
        mainLayout.setSizeUndefined();
        mainLayout.setMargin(true);
        mainLayout.setSpacing(true);
        Responsive.makeResponsive(mainLayout);

        Component mainContent = buildContent();
        mainLayout.addComponent(mainContent);
        mainLayout.setExpandRatio(mainContent, 1.0f);
        mainLayout.addComponent(buildButton());

    }

    public Component buildContent() {
        CssLayout contenPanel = new CssLayout();
        contenPanel.addStyleName("dashboard-panels");
        Responsive.makeResponsive(contenPanel);

        contenPanel.addComponent(buildFieldsInfo());
//        contenPanel.addComponent(buildButton());
        return contenPanel;
    }

    public Component buildFieldsInfo() {
        /**
         * create fields infomation
         */
        txtAssetCode = new TextField();
        txtAssetCode.setImmediate(true);
        txtAssetCode.setRequired(true);
        txtAssetCode.setWidth("100.0%");
        txtAssetCode.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtAssetCode.setDescription(BundleUtils.getString("maintenance1Mngt.list.assetCode"));
        txtAssetCode.setCaption(BundleUtils.getString("maintenance1Mngt.list.assetCode"));
        txtAssetCode.setInputPrompt(BundleUtils.getString("maintenance1Mngt.list.assetCode"));

        txtAssetName = new TextField();
        txtAssetName.setImmediate(true);
        txtAssetName.setRequired(true);
        txtAssetName.setWidth("100.0%");
        txtAssetName.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtAssetName.setDescription(BundleUtils.getString("maintenance1Mngt.list.assetName"));
        txtAssetName.setCaption(BundleUtils.getString("maintenance1Mngt.list.assetName"));
        txtAssetName.setInputPrompt(BundleUtils.getString("maintenance1Mngt.list.assetName"));

        txtKmNumber = new TextField();
        txtKmNumber.setImmediate(true);
        txtKmNumber.setRequired(true);
        txtKmNumber.setWidth("100.0%");
        txtKmNumber.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtKmNumber.setDescription(BundleUtils.getString("maintenance1Mngt.list.kmNumber"));
        txtKmNumber.setCaption(BundleUtils.getString("maintenance1Mngt.list.kmNumber"));
        txtKmNumber.setInputPrompt(BundleUtils.getString("maintenance1Mngt.list.kmNumber"));

        txtEmployeeName = new TextField();
        txtEmployeeName.setImmediate(true);
        txtEmployeeName.setRequired(true);
        txtEmployeeName.setWidth("100.0%");
        txtEmployeeName.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtEmployeeName.setDescription(BundleUtils.getString("maintenance1Mngt.list.assetEmployee"));
        txtEmployeeName.setCaption(BundleUtils.getString("maintenance1Mngt.list.assetEmployee"));
        txtEmployeeName.setInputPrompt(BundleUtils.getString("maintenance1Mngt.list.assetEmployee"));
        
        txtDepartment = new TextField();
        txtDepartment.setImmediate(true);
        txtDepartment.setRequired(true);
        txtDepartment.setWidth("100.0%");
        txtDepartment.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtDepartment.setDescription(BundleUtils.getString("maintenance1Mngt.list.assetOrganization"));
        txtDepartment.setCaption(BundleUtils.getString("maintenance1Mngt.list.assetOrganization"));
        txtDepartment.setInputPrompt(BundleUtils.getString("maintenance1Mngt.list.assetOrganization"));
        
        lbCataMaintenance = new Label();
        lbCataMaintenance.setImmediate(true);
        lbCataMaintenance.setWidth("100.0%");
        lbCataMaintenance.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
//        lbCataMaintenance.setDescription(BundleUtils.getString("maintenance1Mngt.list.assetOrganization"));
        lbCataMaintenance.setCaption(BundleUtils.getString("maintenance1Mngt.list.lbCataMaintenance"));
        
        lbxEmpty1 = new Label();
        lbxEmpty1.setImmediate(true);
        lbxEmpty1.setWidth("100.0%");
        lbxEmpty1.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        lbxEmpty1.setCaption("  ");
        
        lbxEmpty2 = new Label();
        lbxEmpty2.setImmediate(true);
        lbxEmpty2.setWidth("100.0%");
        lbxEmpty2.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        lbxEmpty2.setCaption("    ");
        
        cbxBDDinhKy1 = new CheckBox();
        cbxBDDinhKy1.setImmediate(true);
        cbxBDDinhKy1.setRequired(true);
        cbxBDDinhKy1.setWidth("100.0%");
        cbxBDDinhKy1.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        cbxBDDinhKy1.setDescription(BundleUtils.getString("maintenance1Mngt.list.cbxBDDinhKy1"));
        cbxBDDinhKy1.setCaption(BundleUtils.getString("maintenance1Mngt.list.cbxBDDinhKy1"));
        
        cbxBDDinhKy2 = new CheckBox();
        cbxBDDinhKy2.setImmediate(true);
        cbxBDDinhKy2.setRequired(true);
        cbxBDDinhKy2.setWidth("100.0%");
        cbxBDDinhKy2.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        cbxBDDinhKy2.setDescription(BundleUtils.getString("maintenance1Mngt.list.cbxBDDinhKy2"));
        cbxBDDinhKy2.setCaption(BundleUtils.getString("maintenance1Mngt.list.cbxBDDinhKy2"));
        
        cbxSuaChuaDotXuat = new CheckBox();
        cbxSuaChuaDotXuat.setImmediate(true);
        cbxSuaChuaDotXuat.setRequired(true);
        cbxSuaChuaDotXuat.setWidth("100.0%");
        cbxSuaChuaDotXuat.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        cbxSuaChuaDotXuat.setDescription(BundleUtils.getString("maintenance1Mngt.list.cbxSuaChuaDotXuat"));
        cbxSuaChuaDotXuat.setCaption(BundleUtils.getString("maintenance1Mngt.list.cbxSuaChuaDotXuat"));
        
        cbxSuaChuaTaiNan = new CheckBox();
        cbxSuaChuaTaiNan.setImmediate(true);
        cbxSuaChuaTaiNan.setRequired(true);
        cbxSuaChuaTaiNan.setWidth("100.0%");
        cbxSuaChuaTaiNan.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        cbxSuaChuaTaiNan.setDescription(BundleUtils.getString("maintenance1Mngt.list.cbxSuaChuaTaiNan"));
        cbxSuaChuaTaiNan.setCaption(BundleUtils.getString("maintenance1Mngt.list.cbxSuaChuaTaiNan"));
        
        cbxSuaKhamLuuHanh = new CheckBox();
        cbxSuaKhamLuuHanh.setImmediate(true);
        cbxSuaKhamLuuHanh.setRequired(true);
        cbxSuaKhamLuuHanh.setWidth("100.0%");
        cbxSuaKhamLuuHanh.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        cbxSuaKhamLuuHanh.setDescription(BundleUtils.getString("maintenance1Mngt.list.cbxSuaKhamLuuHanh"));
        cbxSuaKhamLuuHanh.setCaption(BundleUtils.getString("maintenance1Mngt.list.cbxSuaKhamLuuHanh"));

        HorizontalLayout grid = new HorizontalLayout();
        grid.setCaption("Thông tin bảo dưỡng ôtô - xe máy");
        grid.setSizeFull();
        grid.setSpacing(true);
        
        // Column 1
        FormLayout subFrm1 = new FormLayout();
        subFrm1.addStyleName(ValoTheme.FORMLAYOUT_LIGHT);
        subFrm1.addComponent(txtAssetCode);
        subFrm1.addComponent(txtKmNumber);
        subFrm1.addComponent(txtEmployeeName);
        subFrm1.addComponent(lbCataMaintenance);
        subFrm1.addComponent(cbxBDDinhKy1);
        subFrm1.addComponent(cbxSuaChuaDotXuat);
        
        
        grid.addComponent(subFrm1);

        // Column 2
        FormLayout subFrm2 = new FormLayout();
        subFrm2.addStyleName(ValoTheme.FORMLAYOUT_LIGHT);
        subFrm2.addComponent(txtAssetName);
        subFrm2.addComponent(lbxEmpty1);
        subFrm2.addComponent(txtDepartment);
        subFrm2.addComponent(lbxEmpty2);
        subFrm2.addComponent(cbxBDDinhKy2);
        subFrm2.addComponent(cbxSuaKhamLuuHanh);
        subFrm2.addComponent(cbxSuaChuaTaiNan);
        grid.addComponent(subFrm2);

        return grid;
    }

    public Component buildButton() {
        /**
         * Create button action
         */
        // btnSave
        btnSave = new Button();
        btnSave.setCaption(BundleUtils.getString("common.button.save"));
        btnSave.setImmediate(true);
        btnSave.setStyleName(ValoTheme.BUTTON_PRIMARY);
        btnSave.setWidth(Constants.STYLE_CONF.AUTO_VALUE);
        btnSave.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        btnSave.setIcon(ISOIcons.SAVE);
        // btnCancel
        btnCancel = new Button();
        btnCancel.setCaption(BundleUtils.getString("common.button.cancel"));
        btnCancel.setImmediate(true);
        btnCancel.setWidth(Constants.STYLE_CONF.AUTO_VALUE);
        btnCancel.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        btnCancel.setIcon(ISOIcons.CANCEL);

        HorizontalLayout temp = new HorizontalLayout();
        temp.setSpacing(true);
        temp.addStyleName("fields");
        temp.addComponents(btnSave,
                btnCancel
        );
        HorizontalLayout footer = new HorizontalLayout();
        footer.addStyleName(ValoTheme.WINDOW_BOTTOM_TOOLBAR);
        footer.setWidth(100.0f, Sizeable.Unit.PERCENTAGE);
        footer.setSpacing(false);
        footer.addComponent(temp);
        footer.setComponentAlignment(temp, Alignment.BOTTOM_RIGHT);

        return footer;
    }

    public VerticalLayout getMainLayout() {
        return mainLayout;
    }

    public void setMainLayout(VerticalLayout mainLayout) {
        this.mainLayout = mainLayout;
    }

    public TextField getTxtAssetCode() {
        return txtAssetCode;
    }

    public void setTxtAssetCode(TextField txtAssetCode) {
        this.txtAssetCode = txtAssetCode;
    }

    public TextField getTxtAssetName() {
        return txtAssetName;
    }

    public void setTxtAssetName(TextField txtAssetName) {
        this.txtAssetName = txtAssetName;
    }

    public TextField getTxtKmNumber() {
        return txtKmNumber;
    }

    public void setTxtKmNumber(TextField txtKmNumber) {
        this.txtKmNumber = txtKmNumber;
    }

    public Label getLbCataMaintenance() {
        return lbCataMaintenance;
    }

    public void setLbCataMaintenance(Label lbCataMaintenance) {
        this.lbCataMaintenance = lbCataMaintenance;
    }

    public CheckBox getCbxBDDinhKy1() {
        return cbxBDDinhKy1;
    }

    public void setCbxBDDinhKy1(CheckBox cbxBDDinhKy1) {
        this.cbxBDDinhKy1 = cbxBDDinhKy1;
    }

    public CheckBox getCbxBDDinhKy2() {
        return cbxBDDinhKy2;
    }

    public void setCbxBDDinhKy2(CheckBox cbxBDDinhKy2) {
        this.cbxBDDinhKy2 = cbxBDDinhKy2;
    }

    public CheckBox getCbxSuaKhamLuuHanh() {
        return cbxSuaKhamLuuHanh;
    }

    public void setCbxSuaKhamLuuHanh(CheckBox cbxSuaKhamLuuHanh) {
        this.cbxSuaKhamLuuHanh = cbxSuaKhamLuuHanh;
    }

    public CheckBox getCbxSuaChuaDotXuat() {
        return cbxSuaChuaDotXuat;
    }

    public void setCbxSuaChuaDotXuat(CheckBox cbxSuaChuaDotXuat) {
        this.cbxSuaChuaDotXuat = cbxSuaChuaDotXuat;
    }

    public CheckBox getCbxSuaChuaTaiNan() {
        return cbxSuaChuaTaiNan;
    }

    public void setCbxSuaChuaTaiNan(CheckBox cbxSuaChuaTaiNan) {
        this.cbxSuaChuaTaiNan = cbxSuaChuaTaiNan;
    }

    public TextField getTxtEmployeeName() {
        return txtEmployeeName;
    }

    public void setTxtEmployeeName(TextField txtEmployeeName) {
        this.txtEmployeeName = txtEmployeeName;
    }

    public TextField getTxtDepartment() {
        return txtDepartment;
    }

    public void setTxtDepartment(TextField txtDepartment) {
        this.txtDepartment = txtDepartment;
    }

    public Button getBtnSave() {
        return btnSave;
    }

    public void setBtnSave(Button btnSave) {
        this.btnSave = btnSave;
    }

    public Button getBtnCancel() {
        return btnCancel;
    }

    public void setBtnCancel(Button btnCancel) {
        this.btnCancel = btnCancel;
    }

    @Override
    public String getCaption() {
        return caption;
    }

    @Override
    public void setCaption(String caption) {
        this.caption = caption;
    }

}

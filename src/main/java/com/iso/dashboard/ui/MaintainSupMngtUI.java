/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.ui;

import com.iso.dashboard.utils.BundleUtils;
import com.iso.dashboard.utils.Constants;
import com.iso.dashboard.utils.ISOIcons;
import com.vaadin.server.FontAwesome;
import com.vaadin.server.Responsive;
import com.vaadin.ui.Alignment;
import com.vaadin.ui.Button;
import com.vaadin.ui.ComboBox;
import com.vaadin.ui.Component;
import com.vaadin.ui.CssLayout;
import com.vaadin.ui.CustomComponent;
import com.vaadin.ui.FormLayout;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.TabSheet;
import com.vaadin.ui.TextField;
import com.vaadin.ui.VerticalLayout;
import com.vaadin.ui.themes.ValoTheme;


public class MaintainSupMngtUI extends CustomComponent {

    private VerticalLayout mainLayout;
    private TextField txtName;
    private TextField txtLevel;
    private TextField txtQuota;
    private TextField txtDecreaseLevel;
    private ComboBox cmbParent;
    private ComboBox cmbType;
    private Button btnSave;
    private Button btnCancel;

    private String caption;

    public MaintainSupMngtUI(String caption) {
        this.caption = caption;
        buildMainLayout();
        TabSheet detailsWrapper = new TabSheet();
        detailsWrapper.setSizeFull();
        detailsWrapper.addStyleName(ValoTheme.TABSHEET_PADDED_TABBAR);
//        detailsWrapper.addStyleName(ValoTheme.TABSHEET_CENTERED_TABS);
        detailsWrapper.addComponent(mainLayout);
        setCompositionRoot(detailsWrapper);

    }

    private void buildMainLayout() {
        mainLayout = new VerticalLayout();
        mainLayout.setCaption(this.caption);
        mainLayout.setIcon(FontAwesome.CALENDAR);
        mainLayout.setSizeFull();
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
        contenPanel.setWidth("100%");
        //Responsive.makeResponsive(contenPanel);

        contenPanel.addComponent(buildFieldsInfo());
        return contenPanel;
    }

    public Component buildFieldsInfo() {
        /**
         * create fields infomation
         */
        txtName = new TextField();
        txtName.setImmediate(true);
        txtName.setRequired(true);
        txtName.setWidth("100.0%");
        txtName.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtName.setRequired(true);
        txtName.setDescription(BundleUtils.getString("maintainSub.list.name"));
        txtName.setCaption(BundleUtils.getString("maintainSub.list.name"));
        txtName.setInputPrompt(BundleUtils.getString("maintainSub.list.name"));

        txtLevel = new TextField();
        txtLevel.setImmediate(true);
        txtLevel.setRequired(true);
        txtLevel.setWidth("100.0%");
        txtLevel.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtLevel.setRequired(true);
        txtLevel.setDescription(BundleUtils.getString("maintainSub.list.quantity"));
        txtLevel.setCaption(BundleUtils.getString("maintainSub.list.quantity"));
        txtLevel.setInputPrompt(BundleUtils.getString("maintainSub.list.quantity"));

        txtQuota = new TextField();
        txtQuota.setImmediate(true);
        txtQuota.setRequired(true);
        txtQuota.setWidth("100.0%");
        txtQuota.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtQuota.setRequired(true);
        txtQuota.setDescription(BundleUtils.getString("maintainSub.list.unit"));
        txtQuota.setCaption(BundleUtils.getString("maintainSub.list.unit"));
        txtQuota.setInputPrompt(BundleUtils.getString("maintainSub.list.unit"));
 
        cmbType = new ComboBox();
        cmbType.setCaption(BundleUtils.getString("repairLaborMngt.list.type"));
        cmbType.setImmediate(true);
        cmbType.setWidth(Constants.STYLE_CONF.AUTO_VALUE);
        cmbType.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        cmbType.setRequired(true);

        FormLayout details = new FormLayout();
        details.addStyleName(ValoTheme.FORMLAYOUT_LIGHT);
        details.addComponent(txtName);
        details.addComponent(txtLevel);
        details.addComponent(txtQuota);
        details.addComponent(cmbType);
        //details.addComponent(cmbParent);

        return details;
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
        footer.setWidth(100.0f, Unit.PERCENTAGE);
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

    public TextField getTxtName() {
        return txtName;
    }

    public void setTxtName(TextField txtName) {
        this.txtName = txtName;
    }

    public TextField getTxtLevel() {
        return txtLevel;
    }

    public void setTxtLevel(TextField txtLevel) {
        this.txtLevel = txtLevel;
    }

    public TextField getTxtQuota() {
        return txtQuota;
    }

    public void setTxtQuota(TextField txtQuota) {
        this.txtQuota = txtQuota;
    }

    public TextField getTxtDecreaseLevel() {
        return txtDecreaseLevel;
    }

    public void setTxtDecreaseLevel(TextField txtDecreaseLevel) {
        this.txtDecreaseLevel = txtDecreaseLevel;
    }

    public ComboBox getCmbParent() {
        return cmbParent;
    }

    public void setCmbParent(ComboBox cmbParent) {
        this.cmbParent = cmbParent;
    }

    public ComboBox getCmbType() {
        return cmbType;
    }

    public void setCmbType(ComboBox cmbType) {
        this.cmbType = cmbType;
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

    
    
}

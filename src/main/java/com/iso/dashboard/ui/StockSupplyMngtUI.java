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
import com.vaadin.ui.Component;
import com.vaadin.ui.CssLayout;
import com.vaadin.ui.CustomComponent;
import com.vaadin.ui.FormLayout;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.TabSheet;
import com.vaadin.ui.TextField;
import com.vaadin.ui.VerticalLayout;
import com.vaadin.ui.themes.ValoTheme;

public class StockSupplyMngtUI extends CustomComponent {

    private VerticalLayout mainLayout;
    private TextField txtName;
    private TextField txtCode;
    private TextField txtContractCode;
    private TextField txtPrice;
    private TextField txtQuantity;
    private TextField txtUnit;
    private Button btnSave;
    private Button btnCancel;

    private String caption;

    public StockSupplyMngtUI(String caption) {
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
        txtName.setDescription(BundleUtils.getString("materialMngt.list.name"));
        txtName.setCaption(BundleUtils.getString("materialMngt.list.name"));
        txtName.setInputPrompt(BundleUtils.getString("materialMngt.list.name"));

        txtCode = new TextField();
        txtCode.setImmediate(true);
        txtCode.setRequired(true);
        txtCode.setWidth("100.0%");
        txtCode.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtCode.setRequired(true);
        txtCode.setDescription(BundleUtils.getString("materialMngt.list.code"));
        txtCode.setCaption(BundleUtils.getString("materialMngt.list.code"));
        txtCode.setInputPrompt(BundleUtils.getString("materialMngt.list.code"));

        txtContractCode = new TextField();
        txtContractCode.setImmediate(true);
        txtContractCode.setRequired(true);
        txtContractCode.setWidth("100.0%");
        txtContractCode.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtContractCode.setRequired(true);
        txtContractCode.setDescription(BundleUtils.getString("materialMngt.list.contractCode"));
        txtContractCode.setCaption(BundleUtils.getString("materialMngt.list.contractCode"));
        txtContractCode.setInputPrompt(BundleUtils.getString("materialMngt.list.contractCode"));

        txtPrice = new TextField();
        txtPrice.setImmediate(true);
        txtPrice.setRequired(true);
        txtPrice.setWidth("100.0%");
        txtPrice.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtPrice.setRequired(true);
        txtPrice.setDescription(BundleUtils.getString("materialMngt.list.price"));
        txtPrice.setCaption(BundleUtils.getString("materialMngt.list.price"));
        txtPrice.setInputPrompt(BundleUtils.getString("materialMngt.list.price"));

        txtQuantity = new TextField();
        txtQuantity.setImmediate(true);
        txtQuantity.setRequired(true);
        txtQuantity.setWidth("100.0%");
        txtQuantity.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtQuantity.setRequired(true);
        txtQuantity.setDescription(BundleUtils.getString("materialMngt.list.quantity"));
        txtQuantity.setCaption(BundleUtils.getString("materialMngt.list.quantity"));
        txtQuantity.setInputPrompt(BundleUtils.getString("materialMngt.list.quantity"));

        txtUnit = new TextField();
        txtUnit.setImmediate(true);
        txtUnit.setRequired(true);
        txtUnit.setWidth("100.0%");
        txtUnit.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtUnit.setRequired(true);
        txtUnit.setDescription(BundleUtils.getString("materialMngt.list.unit"));
        txtUnit.setCaption(BundleUtils.getString("materialMngt.list.unit"));
        txtUnit.setInputPrompt(BundleUtils.getString("materialMngt.list.unit"));

        FormLayout details = new FormLayout();
        details.addStyleName(ValoTheme.FORMLAYOUT_LIGHT);
        details.addComponent(txtCode);
        details.addComponent(txtName);
        details.addComponent(txtContractCode);
        details.addComponent(txtPrice);
        details.addComponent(txtQuantity);
        details.addComponent(txtUnit);

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

    public TextField getTxtCode() {
        return txtCode;
    }

    public void setTxtCode(TextField txtCode) {
        this.txtCode = txtCode;
    }

    public TextField getTxtContractCode() {
        return txtContractCode;
    }

    public void setTxtContractCode(TextField txtContractCode) {
        this.txtContractCode = txtContractCode;
    }

    public TextField getTxtPrice() {
        return txtPrice;
    }

    public void setTxtPrice(TextField txtPrice) {
        this.txtPrice = txtPrice;
    }

    public TextField getTxtQuantity() {
        return txtQuantity;
    }

    public void setTxtQuantity(TextField txtQuantity) {
        this.txtQuantity = txtQuantity;
    }

    public TextField getTxtUnit() {
        return txtUnit;
    }

    public void setTxtUnit(TextField txtUnit) {
        this.txtUnit = txtUnit;
    }

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

}

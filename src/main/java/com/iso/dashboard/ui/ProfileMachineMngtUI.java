package com.iso.dashboard.ui;

import com.iso.dashboard.component.*;
import com.iso.dashboard.utils.BundleUtils;
import com.iso.dashboard.utils.Constants;
import com.iso.dashboard.utils.DateUtil;
import com.iso.dashboard.utils.ISOIcons;
import com.iso.dashboard.utils.PrintLog;
import com.iso.dashboard.utils.UploaderAvatar;
import com.iso.dashboard.view.ProfileReferenceView;
import com.vaadin.server.FontAwesome;
import com.vaadin.server.ThemeResource;
import com.vaadin.shared.ui.datefield.Resolution;
import com.vaadin.ui.Alignment;
import com.vaadin.ui.Button;
import com.vaadin.ui.ComboBox;
import com.vaadin.ui.Component;
import com.vaadin.ui.CustomComponent;
import com.vaadin.ui.FormLayout;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Image;
import com.vaadin.ui.Label;
import com.vaadin.ui.Notification;
import com.vaadin.ui.PopupDateField;
//import com.vaadin.ui.RadioButtonGroup;
import com.vaadin.ui.TabSheet;
import com.vaadin.ui.TextArea;
import com.vaadin.ui.TextField;
import com.vaadin.ui.Upload;
import com.vaadin.ui.VerticalLayout;
import com.vaadin.ui.themes.ValoTheme;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import org.apache.commons.lang3.RandomStringUtils;

public class ProfileMachineMngtUI extends CustomComponent {

    public static final String ID = "profilepreferenceswindow";

    private TextField txtCode;
    private TextField txtName;
    private OrgTreeSearchUI orgTreeSearchUI;
    private TreeEmpSearchUI empSearchUI;
    private TextField txtManufactoryName;
    private TextField txtManufactoryCountry;
    private TextField txtManufactoryYear;
    private ComboBox cmbType;
    private PopupDateField insuranceExp;
    private PopupDateField registryExp;
    private PopupDateField rubberReplace;
    private PopupDateField batteryReplace;
    private TextField txtWheelFormula;
    private TextField txtSize;
    private TextField txtNumberSeating;
    private TextField txtWidth;
    private TextField txtWeight;
    private TextField txtWeightCurrent;
    private TextField txtVolume;
    private TextField txtMaxPower;
    private TextField txtDriveSystem;
    private TextField txtBattery;
    private TextField txtWheelUse;
    private Image avatar;
    private TextArea txaDetail;

    private CustomGrid pagedTable;

    private Button btnUpload;
    private Button btnSave;
    private Button btnCancel;

    private String profileId;
    private String pathAvatar;
    private UploaderAvatar uploadAvatar;
    private ProfileReferenceView referenceUi;

    public ProfileMachineMngtUI(String profileId, String pathAvatar) {
        this.profileId = profileId;
        this.pathAvatar = pathAvatar;
        setSizeFull();
        //addStyleName("dashboard-view");
        setId(ID);
        //Responsive.makeResponsive(this);

        VerticalLayout content = new VerticalLayout();
        content.setSizeFull();
        //content.addStyleName("dashboard-panels");
        //content.setMargin(new MarginInfo(true, false, false, false));
        //content.setSpacing(false);
        setCompositionRoot(content);

        TabSheet detailsWrapper = new TabSheet();
        detailsWrapper.setSizeFull();
        detailsWrapper.addStyleName(ValoTheme.TABSHEET_PADDED_TABBAR);
        detailsWrapper.addStyleName(ValoTheme.TABSHEET_ICONS_ON_TOP);
        detailsWrapper.addStyleName(ValoTheme.TABSHEET_CENTERED_TABS);
        content.addComponent(detailsWrapper);
        content.setExpandRatio(detailsWrapper, 1f);

        detailsWrapper.addComponent(buildProfileTab());

        detailsWrapper.setSelectedTab(0);

        Component footer = buildFooter();
        content.addComponent(footer);
//        content.setExpandRatio(footer, 1f);

    }

    private Component buildPreferencesTab() {
        VerticalLayout root = new VerticalLayout();
        root.setCaption(BundleUtils.getStringCas("menu.employeeMngt"));
        root.setIcon(FontAwesome.COGS);
        root.setSpacing(true);
        root.setMargin(true);
        root.setSizeFull();

        referenceUi = new ProfileReferenceView(profileId);
        root.addComponent(referenceUi);
        root.setComponentAlignment(referenceUi, Alignment.MIDDLE_CENTER);

        return root;
    }

    private Component buildProfileTab() {
        HorizontalLayout root = new HorizontalLayout();
        root.setCaption(BundleUtils.getStringCas("menu.profileMachineMngt"));
        root.setIcon(FontAwesome.USER);
        root.setWidth(100.0f, Unit.PERCENTAGE);
        root.setMargin(true);
//        root.addStyleName("dashboard-view");
        root.addStyleName("profile-form");

        VerticalLayout pic = new VerticalLayout();
        pic.setSizeUndefined();
        pic.setMargin(true);
        pic.setSpacing(true);

        uploadAvatar = new UploaderAvatar(UploaderAvatar.TYPE_UPLOAD.AVATAR, pathAvatar);
        pic.addComponent(uploadAvatar);
        root.addComponent(pic);

        FormLayout details = new FormLayout();
        details.addStyleName(ValoTheme.FORMLAYOUT_LIGHT);
        //details.setSizeFull();
        root.addComponent(details);
        root.setExpandRatio(details, 1);

        txtCode = new TextField();
        txtCode.setImmediate(true);
        txtCode.setRequired(true);
        txtCode.setWidth("100.0%");
        txtCode.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtCode.setRequired(true);
        txtCode.setDescription(BundleUtils.getString("profileMachine.list.code"));
        txtCode.setCaption(BundleUtils.getString("profileMachine.list.code"));
        txtCode.setInputPrompt(BundleUtils.getString("profileMachine.list.code"));

        txtName = new TextField();
        txtName.setImmediate(true);
        txtName.setRequired(true);
        txtName.setWidth("100.0%");
        txtName.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtName.setRequired(true);
        txtName.setDescription(BundleUtils.getString("profileMachine.list.name"));
        txtName.setCaption(BundleUtils.getString("profileMachine.list.name"));
        txtName.setInputPrompt(BundleUtils.getString("profileMachine.list.name"));

        orgTreeSearchUI = new OrgTreeSearchUI(BundleUtils.getString("profileMachine.list.organization"));
        orgTreeSearchUI.setImmediate(true);
        orgTreeSearchUI.setWidth("100.0%");
        orgTreeSearchUI.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        orgTreeSearchUI.setDescription(BundleUtils.getString("profileMachine.list.organization"));

        empSearchUI = new TreeEmpSearchUI(BundleUtils.getString("profileMachine.list.employee"));
        empSearchUI.setImmediate(true);
        empSearchUI.setWidth("100.0%");
        empSearchUI.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        empSearchUI.setDescription(BundleUtils.getString("profileMachine.list.employee"));

        txtManufactoryName = new TextField();
        txtManufactoryName.setImmediate(true);
        txtManufactoryName.setRequired(true);
        txtManufactoryName.setWidth("100.0%");
        txtManufactoryName.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtManufactoryName.setRequired(true);
        txtManufactoryName.setDescription(BundleUtils.getString("profileMachine.list.manufactoryName"));
        txtManufactoryName.setCaption(BundleUtils.getString("profileMachine.list.manufactoryName"));
        txtManufactoryName.setInputPrompt(BundleUtils.getString("profileMachine.list.manufactoryName"));

        txtManufactoryCountry = new TextField();
        txtManufactoryCountry.setImmediate(true);
        txtManufactoryCountry.setRequired(true);
        txtManufactoryCountry.setWidth("100.0%");
        txtManufactoryCountry.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtManufactoryCountry.setRequired(true);
        txtManufactoryCountry.setDescription(BundleUtils.getString("profileMachine.list.manufactureCountry"));
        txtManufactoryCountry.setCaption(BundleUtils.getString("profileMachine.list.manufactureCountry"));
        txtManufactoryCountry.setInputPrompt(BundleUtils.getString("profileMachine.list.manufactureCountry"));

        txtManufactoryYear = new TextField();
        txtManufactoryYear.setImmediate(true);
        txtManufactoryYear.setRequired(true);
        txtManufactoryYear.setWidth("100.0%");
        txtManufactoryYear.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtManufactoryYear.setRequired(true);
        txtManufactoryYear.setDescription(BundleUtils.getString("profileMachine.list.manufactureYear"));
        txtManufactoryYear.setCaption(BundleUtils.getString("profileMachine.list.manufactureYear"));
        txtManufactoryYear.setInputPrompt(BundleUtils.getString("profileMachine.list.manufactureYear"));

        cmbType = new ComboBox();
        cmbType.setCaption(BundleUtils.getString("profileMachine.list.type"));
        cmbType.setImmediate(true);
        cmbType.setWidth(Constants.STYLE_CONF.AUTO_VALUE);
        cmbType.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        cmbType.setRequired(true);

        insuranceExp = new PopupDateField();
        insuranceExp.setImmediate(true);
        insuranceExp.setWidth("100.0%");
        insuranceExp.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        insuranceExp.setDateFormat(Constants.DATE.ddMMyyy);
        insuranceExp.setResolution(Resolution.SECOND);
        insuranceExp.setCaption(BundleUtils.getString("profileMachine.list.insurance"));
        insuranceExp.setInputPrompt(BundleUtils.getString("profileMachine.list.insurance"));

        registryExp = new PopupDateField();
        registryExp.setImmediate(true);
        registryExp.setWidth("100.0%");
        registryExp.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        registryExp.setDateFormat(Constants.DATE.ddMMyyy);
        registryExp.setResolution(Resolution.SECOND);
        registryExp.setCaption(BundleUtils.getString("profileMachine.list.registry"));
        registryExp.setInputPrompt(BundleUtils.getString("profileMachine.list.registry"));

        rubberReplace = new PopupDateField();
        rubberReplace.setImmediate(true);
        rubberReplace.setWidth("100.0%");
        rubberReplace.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        rubberReplace.setDateFormat(Constants.DATE.ddMMyyy);
        rubberReplace.setResolution(Resolution.SECOND);
        rubberReplace.setCaption(BundleUtils.getString("profileMachine.list.rubber"));
        rubberReplace.setInputPrompt(BundleUtils.getString("profileMachine.list.rubber"));

        batteryReplace = new PopupDateField();
        batteryReplace.setImmediate(true);
        batteryReplace.setWidth("100.0%");
        batteryReplace.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        batteryReplace.setDateFormat(Constants.DATE.ddMMyyy);
        batteryReplace.setResolution(Resolution.SECOND);
        batteryReplace.setCaption(BundleUtils.getString("profileMachine.list.batteryReplace"));
        batteryReplace.setInputPrompt(BundleUtils.getString("profileMachine.list.batteryReplace"));

        txtWheelFormula = new TextField();
        txtWheelFormula.setImmediate(true);
        txtWheelFormula.setRequired(true);
        txtWheelFormula.setWidth("100.0%");
        txtWheelFormula.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtWheelFormula.setRequired(true);
        txtWheelFormula.setDescription(BundleUtils.getString("profileMachine.list.wheelFormula"));
        txtWheelFormula.setCaption(BundleUtils.getString("profileMachine.list.wheelFormula"));
        txtWheelFormula.setInputPrompt(BundleUtils.getString("profileMachine.list.wheelFormula"));

        txtSize = new TextField();
        txtSize.setImmediate(true);
        txtSize.setRequired(true);
        txtSize.setWidth("100.0%");
        txtSize.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtSize.setRequired(true);
        txtSize.setDescription(BundleUtils.getString("profileMachine.list.size"));
        txtSize.setCaption(BundleUtils.getString("profileMachine.list.size"));
        txtSize.setInputPrompt(BundleUtils.getString("profileMachine.list.size"));

        txtNumberSeating = new TextField();
        txtNumberSeating.setImmediate(true);
        txtNumberSeating.setRequired(true);
        txtNumberSeating.setWidth("100.0%");
        txtNumberSeating.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtNumberSeating.setRequired(true);
        txtNumberSeating.setDescription(BundleUtils.getString("profileMachine.list.numberSeating"));
        txtNumberSeating.setCaption(BundleUtils.getString("profileMachine.list.numberSeating"));
        txtNumberSeating.setInputPrompt(BundleUtils.getString("profileMachine.list.numberSeating"));

        txtWidth = new TextField();
        txtWidth.setImmediate(true);
        txtWidth.setRequired(true);
        txtWidth.setWidth("100.0%");
        txtWidth.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtWidth.setRequired(true);
        txtWidth.setDescription(BundleUtils.getString("profileMachine.list.width"));
        txtWidth.setCaption(BundleUtils.getString("profileMachine.list.width"));
        txtWidth.setInputPrompt(BundleUtils.getString("profileMachine.list.width"));

        txtWeight = new TextField();
        txtWeight.setImmediate(true);
        txtWeight.setRequired(true);
        txtWeight.setWidth("100.0%");
        txtWeight.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtWeight.setRequired(true);
        txtWeight.setDescription(BundleUtils.getString("profileMachine.list.weight"));
        txtWeight.setCaption(BundleUtils.getString("profileMachine.list.weight"));
        txtWeight.setInputPrompt(BundleUtils.getString("profileMachine.list.weight"));

        txtWeightCurrent = new TextField();
        txtWeightCurrent.setImmediate(true);
        txtWeightCurrent.setRequired(true);
        txtWeightCurrent.setWidth("100.0%");
        txtWeightCurrent.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtWeightCurrent.setRequired(true);
        txtWeightCurrent.setDescription(BundleUtils.getString("profileMachine.list.weightCurrent"));
        txtWeightCurrent.setCaption(BundleUtils.getString("profileMachine.list.weightCurrent"));
        txtWeightCurrent.setInputPrompt(BundleUtils.getString("profileMachine.list.weightCurrent"));

        txtVolume = new TextField();
        txtVolume.setImmediate(true);
        txtVolume.setRequired(true);
        txtVolume.setWidth("100.0%");
        txtVolume.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtVolume.setRequired(true);
        txtVolume.setDescription(BundleUtils.getString("profileMachine.list.volume"));
        txtVolume.setCaption(BundleUtils.getString("profileMachine.list.volume"));
        txtVolume.setInputPrompt(BundleUtils.getString("profileMachine.list.volume"));

        txtMaxPower = new TextField();
        txtMaxPower.setImmediate(true);
        txtMaxPower.setRequired(true);
        txtMaxPower.setWidth("100.0%");
        txtMaxPower.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtMaxPower.setRequired(true);
        txtMaxPower.setDescription(BundleUtils.getString("profileMachine.list.maxPower"));
        txtMaxPower.setCaption(BundleUtils.getString("profileMachine.list.maxPower"));
        txtMaxPower.setInputPrompt(BundleUtils.getString("profileMachine.list.maxPower"));

        txtDriveSystem = new TextField();
        txtDriveSystem.setImmediate(true);
        txtDriveSystem.setRequired(true);
        txtDriveSystem.setWidth("100.0%");
        txtDriveSystem.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtDriveSystem.setRequired(true);
        txtDriveSystem.setDescription(BundleUtils.getString("profileMachine.list.driveSystem"));
        txtDriveSystem.setCaption(BundleUtils.getString("profileMachine.list.driveSystem"));
        txtDriveSystem.setInputPrompt(BundleUtils.getString("profileMachine.list.driveSystem"));

        txtBattery = new TextField();
        txtBattery.setImmediate(true);
        txtBattery.setRequired(true);
        txtBattery.setWidth("100.0%");
        txtBattery.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtBattery.setRequired(true);
        txtBattery.setDescription(BundleUtils.getString("profileMachine.list.battery"));
        txtBattery.setCaption(BundleUtils.getString("profileMachine.list.battery"));
        txtBattery.setInputPrompt(BundleUtils.getString("profileMachine.list.battery"));

        txtWheelUse = new TextField();
        txtWheelUse.setImmediate(true);
        txtWheelUse.setRequired(true);
        txtWheelUse.setWidth("100.0%");
        txtWheelUse.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtWheelUse.setRequired(true);
        txtWheelUse.setDescription(BundleUtils.getString("profileMachine.list.wheelUse"));
        txtWheelUse.setCaption(BundleUtils.getString("profileMachine.list.wheelUse"));
        txtWheelUse.setInputPrompt(BundleUtils.getString("profileMachine.list.wheelUse"));

        txtDriveSystem = new TextField();
        txtDriveSystem.setImmediate(true);
        txtDriveSystem.setRequired(true);
        txtDriveSystem.setWidth("100.0%");
        txtDriveSystem.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        txtDriveSystem.setRequired(true);
        txtDriveSystem.setDescription(BundleUtils.getString("profileMachine.list.driveSystem"));
        txtDriveSystem.setCaption(BundleUtils.getString("profileMachine.list.driveSystem"));
        txtDriveSystem.setInputPrompt(BundleUtils.getString("profileMachine.list.driveSystem"));

        details.addComponent(txtCode);
        details.addComponent(txtName);
        details.addComponent(orgTreeSearchUI);
        details.addComponent(empSearchUI);
        details.addComponent(txtManufactoryName);
        details.addComponent(txtManufactoryCountry);
        details.addComponent(txtManufactoryYear);
        details.addComponent(cmbType);
        details.addComponent(insuranceExp);
        details.addComponent(registryExp);
        details.addComponent(rubberReplace);
        details.addComponent(batteryReplace);
        details.addComponent(txtWheelFormula);
        details.addComponent(txtSize);
        details.addComponent(txtNumberSeating);
        details.addComponent(txtWidth);
        details.addComponent(txtWeightCurrent);
        details.addComponent(txtWeight);
        details.addComponent(txtVolume);
        details.addComponent(txtMaxPower);
        details.addComponent(txtDriveSystem);
        details.addComponent(txtBattery);
        details.addComponent(txtWheelUse);

        Label section = new Label(BundleUtils.getString("profileMachine.list.detail"));
        section.addStyleName(ValoTheme.LABEL_H4);
        section.addStyleName(ValoTheme.LABEL_COLORED);
        details.addComponent(section);
        txaDetail = new TextArea();
        txaDetail.setImmediate(true);
        txaDetail.setRequired(true);
        txaDetail.setWidth("100.0%");
        txaDetail.setHeight("100px");
        txaDetail.setRequired(true);
        txaDetail.setDescription(BundleUtils.getString("profileMachine.list.detail"));
        txaDetail.setInputPrompt(BundleUtils.getString("profileMachine.list.detail"));
        details.addComponent(txaDetail);

        return root;
    }

    private Component buildFooter() {
        HorizontalLayout footer = new HorizontalLayout();
        footer.addStyleName(ValoTheme.WINDOW_BOTTOM_TOOLBAR);
        footer.setWidth(100.0f, Unit.PERCENTAGE);
        footer.setSpacing(false);

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

        footer.addComponent(btnSave);
        footer.setComponentAlignment(btnSave, Alignment.TOP_RIGHT);
        footer.addComponent(btnCancel);
        footer.setComponentAlignment(btnCancel, Alignment.TOP_LEFT);
        return footer;
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

    public CustomGrid getPagedTable() {
        return pagedTable;
    }

    public void setPagedTable(CustomGrid pagedTable) {
        this.pagedTable = pagedTable;
    }

    public TextField getTxtCode() {
        return txtCode;
    }

    public void setTxtCode(TextField txtCode) {
        this.txtCode = txtCode;
    }

    public TextField getTxtName() {
        return txtName;
    }

    public void setTxtName(TextField txtName) {
        this.txtName = txtName;
    }

    public TextField getTxtManufactoryCountry() {
        return txtManufactoryCountry;
    }

    public void setTxtManufactoryCountry(TextField txtManufactoryCountry) {
        this.txtManufactoryCountry = txtManufactoryCountry;
    }

    public TextField getTxtManufactoryYear() {
        return txtManufactoryYear;
    }

    public void setTxtManufactoryYear(TextField txtManufactoryYear) {
        this.txtManufactoryYear = txtManufactoryYear;
    }

    public ComboBox getCmbType() {
        return cmbType;
    }

    public void setCmbType(ComboBox cmbType) {
        this.cmbType = cmbType;
    }

    public TextField getTxtWheelFormula() {
        return txtWheelFormula;
    }

    public void setTxtWheelFormula(TextField txtWheelFormula) {
        this.txtWheelFormula = txtWheelFormula;
    }

    public TextField getTxtSize() {
        return txtSize;
    }

    public void setTxtSize(TextField txtSize) {
        this.txtSize = txtSize;
    }

    public TextField getTxtNumberSeating() {
        return txtNumberSeating;
    }

    public void setTxtNumberSeating(TextField txtNumberSeating) {
        this.txtNumberSeating = txtNumberSeating;
    }

    public TextField getTxtWidth() {
        return txtWidth;
    }

    public void setTxtWidth(TextField txtWidth) {
        this.txtWidth = txtWidth;
    }

    public TextField getTxtWeight() {
        return txtWeight;
    }

    public void setTxtWeight(TextField txtWeight) {
        this.txtWeight = txtWeight;
    }

    public TextField getTxtVolume() {
        return txtVolume;
    }

    public void setTxtVolume(TextField txtVolume) {
        this.txtVolume = txtVolume;
    }

    public TextField getTxtMaxPower() {
        return txtMaxPower;
    }

    public void setTxtMaxPower(TextField txtMaxPower) {
        this.txtMaxPower = txtMaxPower;
    }

    public TextField getTxtDriveSystem() {
        return txtDriveSystem;
    }

    public void setTxtDriveSystem(TextField txtDriveSystem) {
        this.txtDriveSystem = txtDriveSystem;
    }

    public TextField getTxtBattery() {
        return txtBattery;
    }

    public void setTxtBattery(TextField txtBattery) {
        this.txtBattery = txtBattery;
    }

    public TextField getTxtWheelUse() {
        return txtWheelUse;
    }

    public void setTxtWheelUse(TextField txtWheelUse) {
        this.txtWheelUse = txtWheelUse;
    }

    public Image getAvatar() {
        return avatar;
    }

    public void setAvatar(Image avatar) {
        this.avatar = avatar;
    }

    public TextArea getTxaDetail() {
        return txaDetail;
    }

    public void setTxaDetail(TextArea txaDetail) {
        this.txaDetail = txaDetail;
    }

    public Button getBtnUpload() {
        return btnUpload;
    }

    public void setBtnUpload(Button btnUpload) {
        this.btnUpload = btnUpload;
    }

    public String getProfileId() {
        return profileId;
    }

    public void setProfileId(String profileId) {
        this.profileId = profileId;
    }

    public ProfileReferenceView getReferenceUi() {
        return referenceUi;
    }

    public void setReferenceUi(ProfileReferenceView referenceUi) {
        this.referenceUi = referenceUi;
    }

    String extensionAllow = ".jpg,.png,.bmp,.jpeg";
    String path = BundleUtils.getStringCas("path_upload_avatar") + DateUtil.date2String(new Date()) + "/";

    public String buildPath() {
        return RandomStringUtils.randomAlphabetic(15)
                + "/" + RandomStringUtils.randomAlphabetic(15)
                + "/" + RandomStringUtils.randomAlphabetic(15);
    }

    class HandlerUpload implements Upload.Receiver, Upload.SucceededListener {

        public File fileTemp;

        @Override
        public OutputStream receiveUpload(String fileName, String mimeType) {
            // Create upload stream
            FileOutputStream fos = null; // Output stream to write to
            // Open the file for writing.
//                file = new File("/tmp/uploads/" + fileName);
//                fos = new FileOutputStream(file);

            try {
                boolean checkExtend = false;
                if (extensionAllow != null) {
                    String[] extendArr = extensionAllow.split(",");
                    for (String e : extendArr) {
                        if (fileName.toLowerCase().endsWith(e.toLowerCase())) {
                            checkExtend = true;
                            break;
                        }
                    }
                }
                if (checkExtend) {
                    //_ replace ky tu ";","&",... ky tu dac biet cua URL trong ten file
                    fileName = fileName
                            .replaceAll("[~!@#$%^&*()+`=;,\\-\\s+\\[\\]{}']", "_")
                            .replaceAll("(_)+", "_");
                    fileName = DateUtil.date2HHMMssNoSlash(new Date()) + "_" + fileName;
                    final String saltPath = buildPath();
                    File dir = new File(path);
                    if (!dir.exists()) {
                        dir.mkdirs();
                    }

                    fileTemp = new File(path + fileName);
//                    try (FileOutputStream fos = new FileOutputStream(file)) {
//                        fos.write(IOUtils.toByteArray(inputStream));
//                        fos.close();
//                    }
                    fos = new FileOutputStream(fileTemp);
                    Notification.show(fileTemp.getName());
                } else {
                    Notification.show(BundleUtils.getString("fileTypeInvalid") + ": " + fileName);
                }
            } catch (IOException ex) {
                ex.printStackTrace();
                PrintLog.printLog(ex);
            }

            return fos; // Return the output stream to write to
        }

        @Override
        public void uploadSucceeded(Upload.SucceededEvent event) {
            avatar = new Image(null,
                    new ThemeResource(fileTemp.getPath()));
            avatar.setWidth(100.0f, Unit.PIXELS);
            Notification.show("Upload success");
        }
    };

    public TextField getTxtWeightCurrent() {
        return txtWeightCurrent;
    }

    public void setTxtWeightCurrent(TextField txtWeightCurrent) {
        this.txtWeightCurrent = txtWeightCurrent;
    }

    public String getPathAvatar() {
        return pathAvatar;
    }

    public void setPathAvatar(String pathAvatar) {
        this.pathAvatar = pathAvatar;
    }

    public UploaderAvatar getUploadAvatar() {
        return uploadAvatar;
    }

    public void setUploadAvatar(UploaderAvatar uploadAvatar) {
        this.uploadAvatar = uploadAvatar;
    }

    public String getExtensionAllow() {
        return extensionAllow;
    }

    public void setExtensionAllow(String extensionAllow) {
        this.extensionAllow = extensionAllow;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public TreeEmpSearchUI getEmpSearchUI() {
        return empSearchUI;
    }

    public void setEmpSearchUI(TreeEmpSearchUI empSearchUI) {
        this.empSearchUI = empSearchUI;
    }

    public TextField getTxtManufactoryName() {
        return txtManufactoryName;
    }

    public void setTxtManufactoryName(TextField txtManufactoryName) {
        this.txtManufactoryName = txtManufactoryName;
    }

    public OrgTreeSearchUI getOrgTreeSearchUI() {
        return orgTreeSearchUI;
    }

    public void setOrgTreeSearchUI(OrgTreeSearchUI orgTreeSearchUI) {
        this.orgTreeSearchUI = orgTreeSearchUI;
    }

    public PopupDateField getInsuranceExp() {
        return insuranceExp;
    }

    public void setInsuranceExp(PopupDateField insuranceExp) {
        this.insuranceExp = insuranceExp;
    }

    public PopupDateField getRegistryExp() {
        return registryExp;
    }

    public void setRegistryExp(PopupDateField registryExp) {
        this.registryExp = registryExp;
    }

    public PopupDateField getRubberReplace() {
        return rubberReplace;
    }

    public void setRubberReplace(PopupDateField rubberReplace) {
        this.rubberReplace = rubberReplace;
    }

    public PopupDateField getBatteryReplace() {
        return batteryReplace;
    }

    public void setBatteryReplace(PopupDateField batteryReplace) {
        this.batteryReplace = batteryReplace;
    }

}

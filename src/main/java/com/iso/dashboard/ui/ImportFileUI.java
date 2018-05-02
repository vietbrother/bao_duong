/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.ui;

import com.iso.dashboard.utils.BundleUtils;
import com.iso.dashboard.utils.Constants;
import com.iso.dashboard.utils.DataUtil;
import com.iso.dashboard.utils.DateUtil;
import com.iso.dashboard.utils.ISOIcons;
import com.iso.dashboard.utils.Uploader;
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
import com.vaadin.ui.VerticalLayout;
import com.vaadin.ui.themes.ValoTheme;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellValue;
import org.apache.poi.ss.usermodel.FormulaEvaluator;

/**
 *
 * @author VIET_BROTHER
 */
public class ImportFileUI extends CustomComponent {

    private VerticalLayout mainLayout;
    private Uploader uploadImport;

    private Button btnExportFileTemplate;
    private Button btnSave;
    private Button btnCancel;

    private String caption;
    private String widthCustom;

    public ImportFileUI(String caption) {
        setSizeFull();
//        buildMainLayout();
//        setCompositionRoot(mainLayout);
        this.caption = caption;
        addStyleName(ValoTheme.PANEL_BORDERLESS);
        buildMainLayout();
        TabSheet detailsWrapper = new TabSheet();
        detailsWrapper.setWidth("100%");
        detailsWrapper.addStyleName(ValoTheme.TABSHEET_PADDED_TABBAR);
        detailsWrapper.setStyleName(ValoTheme.TABSHEET_ICONS_ON_TOP);
//        detailsWrapper.addStyleName(ValoTheme.TABSHEET_CENTERED_TABS);
        detailsWrapper.addComponent(mainLayout);
        setCompositionRoot(detailsWrapper);
    }

    private void buildMainLayout() {
        mainLayout = new VerticalLayout();
        mainLayout.setCaption(this.caption);
        mainLayout.setIcon(FontAwesome.CALENDAR);
        mainLayout.setWidth("99%");
        mainLayout.setMargin(true);
        mainLayout.setSpacing(true);
        Responsive.makeResponsive(mainLayout);

        Component mainContent = buildFieldsInfo();
        mainLayout.addComponent(mainContent);
        mainLayout.setExpandRatio(mainContent, 1.0f);
        mainLayout.addComponent(buildButton());

    }

    public Component buildContent() {
        CssLayout contenPanel = new CssLayout();
//        contenPanel.addStyleName("dashboard-panels");
        contenPanel.setWidth("100%");
//        Responsive.makeResponsive(contenPanel);

        contenPanel.addComponent(buildFieldsInfo());
//        contenPanel.addComponent(buildButton());
        return contenPanel;
    }

    public Component buildFieldsInfo() {
        // btnSave
        btnExportFileTemplate = new Button();
        btnExportFileTemplate.setCaption(BundleUtils.getString("common.button.exportFileTemplate"));
        btnExportFileTemplate.setImmediate(true);
        btnExportFileTemplate.setWidth(Constants.STYLE_CONF.AUTO_VALUE);
        btnExportFileTemplate.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        btnExportFileTemplate.setIcon(ISOIcons.DOWNLOAD);
        btnExportFileTemplate.setStyleName(ValoTheme.BUTTON_LINK);

        uploadImport = new Uploader(Uploader.TYPE_UPLOAD.TASK, false);
//        uploadImport = new Uploader();
        uploadImport.setCaption(BundleUtils.getString("upload.file.caption"));
        uploadImport.setImmediate(true);
        uploadImport.setWidth("100.0%");
        uploadImport.setHeight(Constants.STYLE_CONF.AUTO_VALUE);

        FormLayout details = new FormLayout();
        details.addStyleName(ValoTheme.FORMLAYOUT_LIGHT);
        details.setWidth(widthCustom == null ? "100%" : widthCustom);

        details.addComponent(btnExportFileTemplate);
        details.addComponent(uploadImport);

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
        btnSave.setWidth(Constants.STYLE_CONF.AUTO_VALUE);
        btnSave.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        btnSave.setIcon(ISOIcons.SAVE);
        btnSave.setStyleName(ValoTheme.BUTTON_PRIMARY);
        // btnCancel
        btnCancel = new Button();
        btnCancel.setCaption(BundleUtils.getString("common.button.cancel"));
        btnCancel.setImmediate(true);
        btnCancel.setWidth(Constants.STYLE_CONF.AUTO_VALUE);
        btnCancel.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        btnCancel.setIcon(ISOIcons.CANCEL);

        HorizontalLayout btnLayout = new HorizontalLayout();
        btnLayout.setSpacing(true);
        btnLayout.addStyleName("fields");
        btnLayout.addComponents(btnSave,
                btnCancel);
        HorizontalLayout footer = new HorizontalLayout();
        footer.addStyleName(ValoTheme.WINDOW_BOTTOM_TOOLBAR);
        footer.setWidth("100%");
        footer.setSpacing(false);
        footer.addComponent(btnLayout);
        footer.setComponentAlignment(btnLayout, Alignment.BOTTOM_RIGHT);

        return footer;
    }

    public VerticalLayout getMainLayout() {
        return mainLayout;
    }

    public void setMainLayout(VerticalLayout mainLayout) {
        this.mainLayout = mainLayout;
    }

    public Uploader getUploadImport() {
        return uploadImport;
    }

    public void setUploadImport(Uploader uploadImport) {
        this.uploadImport = uploadImport;
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

    public String getWidthCustom() {
        return widthCustom;
    }

    public void setWidthCustom(String widthCustom) {
        this.widthCustom = widthCustom;
    }

    public Button getBtnExportFileTemplate() {
        return btnExportFileTemplate;
    }

    public void setBtnExportFileTemplate(Button btnExportFileTemplate) {
        this.btnExportFileTemplate = btnExportFileTemplate;
    }

    public synchronized static List importExcel(File file, int iSheet, int iBeginRow, int iFromCol, int iToCol, int rowBack) throws FileNotFoundException {
        List lst = new ArrayList();
        FileInputStream flieInput = null;
        SimpleDateFormat sp = DateUtil.getDateDdMMyyyy();

        HSSFWorkbook workbook;
        try {
            flieInput = new FileInputStream(file);
            workbook = new HSSFWorkbook(flieInput);
            HSSFSheet worksheet = workbook.getSheetAt(iSheet);
            int irowBack = 0;
            for (int i = iBeginRow; i <= worksheet.getLastRowNum(); i++) {
                Object[] obj = new Object[iToCol - iFromCol + 1];
                HSSFRow row = worksheet.getRow(i);
                //anhmv6_start
                FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
                //anhmv6_end
                if (row != null && true) {
                    int iCount = 0;
                    int check = 0;
                    for (int j = iFromCol; j <= iToCol; j++) {
                        Cell cell = row.getCell(j);
                        //
                        CellValue cellValue = evaluator.evaluate(cell);
                        //
                        if (cell != null && true) {
                            switch (cell.getCellType()) {
                                case Cell.CELL_TYPE_STRING:
                                    obj[iCount] = cell.getStringCellValue().trim();
                                    break;
                                case Cell.CELL_TYPE_NUMERIC:
                                    Double doubleValue = (Double) cell.getNumericCellValue();
                                    if (HSSFDateUtil.isCellDateFormatted(cell)) {
                                        Date date = HSSFDateUtil.getJavaDate(doubleValue);
                                        String dateFmt = cell.getCellStyle().getDataFormatString();
                                        obj[iCount] = sp.format(date);
                                        break;
                                        // takes care of idiosyncrasies of Excel
                                    }

                                    //String.format("%.0f", doubleValue);
//                                    String[] lstValue = String.valueOf(doubleValue).trim().split("\\.");
                                    List<String> lstValue = DataUtil.splitDot(String.valueOf(doubleValue));
                                    if (lstValue.get(1).matches("[0]+")) {
                                        obj[iCount] = lstValue.get(0);
                                    } else {
                                        DecimalFormat df = new DecimalFormat("######.##");
                                        obj[iCount] = df.format(doubleValue);
                                        //obj[iCount] = String.format("%d", doubleValue).trim();
                                    }

                                    break;
                                case Cell.CELL_TYPE_BLANK:
                                    check++;
                                    break;
                                //anhmv6_start
                                case Cell.CELL_TYPE_FORMULA:
                                    if (cellValue.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                        Double doubleCellValue = (Double) cellValue.getNumberValue();
                                        DecimalFormat df = new DecimalFormat("######");
                                        obj[iCount] = df.format(doubleCellValue);
                                    } else {
                                        obj[iCount] = cellValue.getStringValue().trim();
                                    }

                                    break;
                                //anhmv6_end
                                default:
                                    obj[iCount] = cell.getStringCellValue().trim();
                                    break;
                            }
                        } else {
                            obj[iCount] = null;
                        }
                        iCount += 1;
                    }
                    if (check != (iToCol - iFromCol + 1)) {
                        lst.add(obj);
                    }

                } else {
                    irowBack += 1;
                }
                if (irowBack == rowBack) {
                    break;
                }
            }
        } catch (IOException ex) {
            lst = null;
            ex.printStackTrace();
        } finally {
            try {
                if (flieInput != null) {
                    flieInput.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return lst;
    }

}

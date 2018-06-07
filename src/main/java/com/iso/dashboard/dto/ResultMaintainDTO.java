/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.dto;

import java.util.List;

/**
 *
 * @author vantu
 */
public class ResultMaintainDTO {

    private String name;
    private String subInfo;
    private List<String> listHeader;
    private List<String> lstLabel;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSubInfo() {
        return subInfo;
    }

    public void setSubInfo(String subInfo) {
        this.subInfo = subInfo;
    }

    public List<String> getListHeader() {
        return listHeader;
    }

    public void setListHeader(List<String> listHeader) {
        this.listHeader = listHeader;
    }

    public List<String> getLstLabel() {
        return lstLabel;
    }

    public void setLstLabel(List<String> lstLabel) {
        this.lstLabel = lstLabel;
    }

}

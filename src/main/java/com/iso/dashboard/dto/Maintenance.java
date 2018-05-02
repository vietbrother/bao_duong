/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.dto;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author Thuclt-VNPTTech
 */
@Entity
@Table(name = "C_MAINTENANCE")
public class Maintenance implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "C_MAINTENANCE_ID", nullable = false)
    private int id;

    @Column(name = "CODE", nullable = true)
    private String code;
    @Column(name = "NAME", nullable = false)
    private String name;

    @OneToOne
    @JoinColumn(name = "TYPE", nullable = true)
    private MaintenanceType maintenanceType;

    @OneToOne
    @JoinColumn(name = "PARENT_ID", nullable = true)
    private Maintenance parent;

    @OneToOne
    @JoinColumn(name = "C_ASSET_ID", nullable = false)
    private Asset asset;

    @Column(name = "TEXT_A", nullable = true)
    private String textA;
    @Column(name = "TEXT_B", nullable = true)
    private String textB;
    @Column(name = "TEXT_C", nullable = true)
    private String textC;
    @Column(name = "TEXT_D", nullable = true)
    private String textD;
    @Column(name = "TEXT_E", nullable = true)
    private String textE;
    @Column(name = "TEXT_F", nullable = true)
    private String textF;
    @Column(name = "TEXT_G", nullable = true)
    private String textG;
    @Column(name = "TEXT_H", nullable = true)
    private String textH;

    @Column(name = "COST", nullable = true)
    private Long cost;

    @Column(name = "CONTENT", nullable = true)
    private String content;
    @Column(name = "DESCRIPTION", nullable = true)
    private String description;
    @Column(name = "IS_ACTIVE", nullable = true)
    private String isActive;
    @Column(name = "CREATED_BY", nullable = true)
    private String createdBy;
    @Column(name = "UPDATED_BY", nullable = true)
    private String updatedBy;
    @Column(name = "UPDATED", nullable = true)
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date updated;
    @Column(name = "CREATED", nullable = true)
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date created;

    public Maintenance() {
    }

    public Maintenance(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public MaintenanceType getMaintenanceType() {
        return maintenanceType;
    }

    public void setMaintenanceType(MaintenanceType maintenanceType) {
        this.maintenanceType = maintenanceType;
    }

    public Maintenance getParent() {
        return parent;
    }

    public void setParent(Maintenance parent) {
        this.parent = parent;
    }

    public Asset getAsset() {
        return asset;
    }

    public void setAsset(Asset asset) {
        this.asset = asset;
    }

    public String getTextA() {
        return textA;
    }

    public void setTextA(String textA) {
        this.textA = textA;
    }

    public String getTextB() {
        return textB;
    }

    public void setTextB(String textB) {
        this.textB = textB;
    }

    public String getTextC() {
        return textC;
    }

    public void setTextC(String textC) {
        this.textC = textC;
    }

    public String getTextD() {
        return textD;
    }

    public void setTextD(String textD) {
        this.textD = textD;
    }

    public String getTextE() {
        return textE;
    }

    public void setTextE(String textE) {
        this.textE = textE;
    }

    public String getTextF() {
        return textF;
    }

    public void setTextF(String textF) {
        this.textF = textF;
    }

    public String getTextG() {
        return textG;
    }

    public void setTextG(String textG) {
        this.textG = textG;
    }

    public String getTextH() {
        return textH;
    }

    public void setTextH(String textH) {
        this.textH = textH;
    }

    public Long getCost() {
        return cost;
    }

    public void setCost(Long cost) {
        this.cost = cost;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIsActive() {
        return isActive;
    }

    public void setIsActive(String isActive) {
        this.isActive = isActive;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

}

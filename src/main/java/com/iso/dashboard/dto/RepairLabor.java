/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.dto;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Thuclt-VNPTTech
 */
@Entity
@Table(name = "C_REPAIR_LABOR")
public class RepairLabor implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "C_REPAIR_LABOR_ID", nullable = false)
    private int id;

    @Column(name = "CODE", nullable = true)
    private String code;
    @Column(name = "NAME", nullable = true)
    private String name;

    @Column(name = "LEVEL_LABOR", nullable = true)
    private String level;
    @Column(name = "QUOTA", nullable = true)
    private String quota;

    @Column(name = "PARENT_ID", nullable = true)
    private Integer parentId;
    @Column(name = "MAINTAIN_TYPE", nullable = false)
    private int maintainType;
//    @ManyToOne
//    @JoinColumn(name = "PARENT_ID", nullable = true)
//    private RepairLabor parentId;

    @ManyToOne
    @JoinColumn(name = "C_REPAIR_TYPE_ID", nullable = true)
    private RepairType repairType;
    @Column(name = "DECREASE_RATE", nullable = true)
    private String decreaseRate;

    public RepairLabor() {
    }

    public RepairLabor(int id, String name) {
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

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getQuota() {
        return quota;
    }

    public void setQuota(String quota) {
        this.quota = quota;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public RepairType getRepairType() {
        return repairType;
    }

    public void setRepairType(RepairType repairType) {
        this.repairType = repairType;
    }

    public String getDecreaseRate() {
        return decreaseRate;
    }

    public void setDecreaseRate(String decreaseRate) {
        this.decreaseRate = decreaseRate;
    }

    public int getMaintainType() {
        return maintainType;
    }

    public void setMaintainType(int maintainType) {
        this.maintainType = maintainType;
    }

}

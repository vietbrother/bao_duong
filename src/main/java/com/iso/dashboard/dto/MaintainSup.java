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
@Table(name = "C_MAINTAIN_SUP")
public class MaintainSup implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "C_MAINTAIN_SUP_ID", nullable = false)
    private int id;

    @Column(name = "SUP_NAME", nullable = true)
    private String supName;
    @Column(name = "SUP_UNIT", nullable = true)
    private String supUnit;

    @Column(name = "QUANTITY", nullable = true)
    private String quantity;

    @Column(name = "MAINTAIN_TYPE", nullable = false)
    private int maintainType;
//    @ManyToOne
//    @JoinColumn(name = "PARENT_ID", nullable = true)
//    private RepairLabor parentId;

    @ManyToOne
    @JoinColumn(name = "C_REPAIR_TYPE_ID", nullable = true)
    private RepairType repairType;

    public MaintainSup() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public RepairType getRepairType() {
        return repairType;
    }

    public void setRepairType(RepairType repairType) {
        this.repairType = repairType;
    }

    public int getMaintainType() {
        return maintainType;
    }

    public void setMaintainType(int maintainType) {
        this.maintainType = maintainType;
    }

    public String getSupName() {
        return supName;
    }

    public void setSupName(String supName) {
        this.supName = supName;
    }

    public String getSupUnit() {
        return supUnit;
    }

    public void setSupUnit(String supUnit) {
        this.supUnit = supUnit;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

}

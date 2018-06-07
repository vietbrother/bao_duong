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
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "c_profile_machine")
public class CProfileMachine implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "C_PROFILE_MACHINE_ID", nullable = false)
    private int id;

    @Column(name = "CODE", nullable = true)
    private String code;
    @Column(name = "NAME", nullable = true)
    private String name;

    @Column(name = "MANUFACTORY_COUNTRY", nullable = true)
    private String manufactureCountry;
    @Column(name = "MANUFACTORY_YEAR", nullable = true)
    private String manufactureYear;
    @Column(name = "WHEEL_FORMULA", nullable = true)
    private String wheelFormula;

    @ManyToOne
    @JoinColumn(name = "C_REPAIR_TYPE_ID", nullable = true)
    private RepairType repairType;

    @ManyToOne
    @JoinColumn(name = "C_EMPLOYEE_ID", nullable = true)
    private Employee employee;

    @Column(name = "SIZE_TOTAL", nullable = true)
    private String sizeTotal;
    @Column(name = "NUMBER_SEATING", nullable = true)
    private String numberSeating;
    @Column(name = "WIDTH", nullable = true)
    private String width;
    @Column(name = "WEIGHT", nullable = true)
    private String weight;
    @Column(name = "WEIGHT_CURRENT", nullable = true)
    private String weightCurrent;
    @Column(name = "VOLUME", nullable = true)
    private String volume;
    @Column(name = "MAX_POWER", nullable = true)
    private String maxPower;
    @Column(name = "DRIVE_SYSTEM", nullable = true)
    private String driveSystem;
    @Column(name = "BATTERY", nullable = true)
    private String battery;
    @Column(name = "WHEEL_USE", nullable = true)
    private String wheelUse;
    @Column(name = "DETAIL", nullable = true)
    private String detail;
    @Column(name = "AVATAR", nullable = true)
    private String avatar;
    @Column(name = "MANUFACTORY_NAME", nullable = true)
    private String manufactoryName;
    @ManyToOne
    @JoinColumn(name = "organization_id", nullable = true)
    private Organization organization;
    
    @Temporal(TemporalType.DATE)
    @Column(name = "insurance_exp")
    private Date insuranceExp;
    
    @Temporal(TemporalType.DATE)
    @Column(name = "registry_exp")
    private Date registryExp;
    
    @Temporal(TemporalType.DATE)
    @Column(name = "rubber_replace")
    private Date rubberReplace;
    
    @Temporal(TemporalType.DATE)
    @Column(name = "battery_replace")
    private Date batteryReplace;

    public CProfileMachine() {
    }

    public CProfileMachine(int id, String name) {
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

    public String getManufactureCountry() {
        return manufactureCountry;
    }

    public void setManufactureCountry(String manufactureCountry) {
        this.manufactureCountry = manufactureCountry;
    }

    public String getWheelFormula() {
        return wheelFormula;
    }

    public void setWheelFormula(String wheelFormula) {
        this.wheelFormula = wheelFormula;
    }

    public RepairType getRepairType() {
        return repairType;
    }

    public void setRepairType(RepairType repairType) {
        this.repairType = repairType;
    }

    public String getSizeTotal() {
        return sizeTotal;
    }

    public void setSizeTotal(String sizeTotal) {
        this.sizeTotal = sizeTotal;
    }

    public String getNumberSeating() {
        return numberSeating;
    }

    public void setNumberSeating(String numberSeating) {
        this.numberSeating = numberSeating;
    }

    public String getWidth() {
        return width;
    }

    public void setWidth(String width) {
        this.width = width;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getVolume() {
        return volume;
    }

    public void setVolume(String volume) {
        this.volume = volume;
    }

    public String getMaxPower() {
        return maxPower;
    }

    public void setMaxPower(String maxPower) {
        this.maxPower = maxPower;
    }

    public String getDriveSystem() {
        return driveSystem;
    }

    public void setDriveSystem(String driveSystem) {
        this.driveSystem = driveSystem;
    }

    public String getBattery() {
        return battery;
    }

    public void setBattery(String battery) {
        this.battery = battery;
    }

    public String getWheelUse() {
        return wheelUse;
    }

    public void setWheelUse(String wheelUse) {
        this.wheelUse = wheelUse;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getManufactureYear() {
        return manufactureYear;
    }

    public void setManufactureYear(String manufactureYear) {
        this.manufactureYear = manufactureYear;
    }

    public String getWeightCurrent() {
        return weightCurrent;
    }

    public void setWeightCurrent(String weightCurrent) {
        this.weightCurrent = weightCurrent;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public String getManufactoryName() {
        return manufactoryName;
    }

    public void setManufactoryName(String manufactoryName) {
        this.manufactoryName = manufactoryName;
    }

    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public Date getInsuranceExp() {
        return insuranceExp;
    }

    public void setInsuranceExp(Date insuranceExp) {
        this.insuranceExp = insuranceExp;
    }

    public Date getRegistryExp() {
        return registryExp;
    }

    public void setRegistryExp(Date registryExp) {
        this.registryExp = registryExp;
    }

    public Date getRubberReplace() {
        return rubberReplace;
    }

    public void setRubberReplace(Date rubberReplace) {
        this.rubberReplace = rubberReplace;
    }

    public Date getBatteryReplace() {
        return batteryReplace;
    }

    public void setBatteryReplace(Date batteryReplace) {
        this.batteryReplace = batteryReplace;
    }

}

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


@Entity
@Table(name = "m_profile_employee")
public class MProfileEmployee implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "M_PROFILE_EMPLOYEE_ID", nullable = false)
    private int id;

    @ManyToOne
    @JoinColumn(name = "C_PROFILE_MACHINE_ID", nullable = false)
    private CProfileMachine profile;

    @ManyToOne
    @JoinColumn(name = "C_EMPLOYEE_ID", nullable = false)
    private Employee employee;


    public MProfileEmployee() {
    }

    public MProfileEmployee(int id, String name) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public CProfileMachine getProfile() {
        return profile;
    }

    public void setProfile(CProfileMachine profile) {
        this.profile = profile;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }


}

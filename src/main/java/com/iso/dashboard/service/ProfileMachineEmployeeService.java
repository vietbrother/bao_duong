/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.service;

import com.iso.dashboard.dao.ProfileMachineEmployeeDAO;
import com.iso.dashboard.dto.MProfileEmployee;
import com.iso.dashboard.dto.ResultDTO;
import java.util.List;

public class ProfileMachineEmployeeService {

    private static ProfileMachineEmployeeService service;

    public static ProfileMachineEmployeeService getInstance() {
        if (service == null) {
            service = new ProfileMachineEmployeeService();
        }
        return service;
    }

    public ResultDTO addMProfileEmployee(MProfileEmployee et) {
        return ProfileMachineEmployeeDAO.getInstance().addMProfileEmployee(et);
    }

    public ResultDTO updateMProfileEmployee(MProfileEmployee et) {
        return ProfileMachineEmployeeDAO.getInstance().updateMProfileEmployee(et);
    }

    public List<MProfileEmployee> listMProfileEmployee(String key) {
        return ProfileMachineEmployeeDAO.getInstance().listMProfileEmployee(key);
    }

    public MProfileEmployee getMProfileEmployeeById(String id) {
        return ProfileMachineEmployeeDAO.getInstance().getMProfileEmployeeById(String.valueOf(id));
    }

    public ResultDTO removeMProfileEmployee(String id) {
        return ProfileMachineEmployeeDAO.getInstance().removeMProfileEmployee(id);
    }
    public void removeMProfileEmployeeByProfileId(String profileId, String employeeId) {
        ProfileMachineEmployeeDAO.getInstance().removeMProfileEmployeeByProfileId(profileId, employeeId);
    }

    public List<MProfileEmployee> getMProfileEmployeeByProfileId(int profileId) {
        return ProfileMachineEmployeeDAO.getInstance().getMProfileEmployeeByProfileId(profileId);
    }

    public MProfileEmployee getMProfileEmployeeByEmployeeId(int id) {
        return ProfileMachineEmployeeDAO.getInstance().getMProfileEmployeeByEmployeeId(id);
    }
}

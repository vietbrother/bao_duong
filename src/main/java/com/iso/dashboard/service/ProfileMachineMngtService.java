/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.service;

import com.iso.dashboard.dao.ProfileMachineDAO;
import com.iso.dashboard.dto.CProfileMachine;
import com.iso.dashboard.dto.ResultDTO;
import java.util.List;


public class ProfileMachineMngtService {
    
    private static ProfileMachineMngtService service;

    public static ProfileMachineMngtService getInstance() {
        if (service == null) {
            service = new ProfileMachineMngtService();
        }
        return service;
    }

    public ResultDTO addCProfileMachine(CProfileMachine et) {
        return ProfileMachineDAO.getInstance().addCProfileMachine(et);
    }

    public ResultDTO updateCProfileMachine(CProfileMachine et) {
        return ProfileMachineDAO.getInstance().updateCProfileMachine(et);
    }

    public List<CProfileMachine> listCProfileMachines(String parentId) {
        return ProfileMachineDAO.getInstance().listCProfileMachines(parentId);
    }

    public CProfileMachine getCProfileMachineById(String id) {
        return ProfileMachineDAO.getInstance().getCProfileMachineById(String.valueOf(id));
    }

    public ResultDTO removeCProfileMachine(String id) {
        return ProfileMachineDAO.getInstance().removeCProfileMachine(id);
    }
}

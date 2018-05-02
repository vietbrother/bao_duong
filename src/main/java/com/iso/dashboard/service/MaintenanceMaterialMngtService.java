/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.service;

import com.iso.dashboard.dao.MaintenanceMaterialDAO;
import com.iso.dashboard.dto.MMaintenanceMaterial;
import com.iso.dashboard.dto.ResultDTO;
import java.util.List;

/**
 *
 * @author Thuclt-VNPTTech
 */
public class MaintenanceMaterialMngtService {
    
    private static MaintenanceMaterialMngtService service;

    public static MaintenanceMaterialMngtService getInstance() {
        if (service == null) {
            service = new MaintenanceMaterialMngtService();
        }
        return service;
    }

    public ResultDTO addMaintenanceMaterial(MMaintenanceMaterial et) {
        return MaintenanceMaterialDAO.getInstance().addMaintenanceMaterial(et);
    }

    public ResultDTO updateMaintenanceMaterial(MMaintenanceMaterial et) {
        return MaintenanceMaterialDAO.getInstance().updateMaintenanceMaterial(et);
    }

    public List<MMaintenanceMaterial> listMaintenanceMaterial(String key) {
        return MaintenanceMaterialDAO.getInstance().listMaintenanceMaterial(key);
    }

    public MMaintenanceMaterial getMaintenanceMaterialById(String id) {
        return MaintenanceMaterialDAO.getInstance().getMaintenanceMaterialById(String.valueOf(id));
    }

    public ResultDTO removeMaintenanceMaterial(String id) {
        return MaintenanceMaterialDAO.getInstance().removeMaintenanceMaterial(id);
    }

    public List<MMaintenanceMaterial> getMaintenanceMaterialByEmployeeId(int maintenanceId) {
        return MaintenanceMaterialDAO.getInstance().getMaintenanceMaterialByMaintenanceId(maintenanceId);
    }
}

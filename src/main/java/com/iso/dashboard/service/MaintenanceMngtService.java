/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.service;

import com.iso.dashboard.dao.MaintenanceDAO;
import com.iso.dashboard.dto.Maintenance;
import com.iso.dashboard.dto.ResultDTO;
import java.util.List;

/**
 *
 * @author Thuclt-VNPTTech
 */
public class MaintenanceMngtService {
    
    private static MaintenanceMngtService service;

    public static MaintenanceMngtService getInstance() {
        if (service == null) {
            service = new MaintenanceMngtService();
        }
        return service;
    }

    public ResultDTO addMaintenance(Maintenance et) {
        return MaintenanceDAO.getInstance().addMaintenance(et);
    }

    public ResultDTO updateMaintenance(Maintenance et) {
        return MaintenanceDAO.getInstance().updateMaintenance(et);
    }

    public List<Maintenance> listMaintenances(String key) {
        return MaintenanceDAO.getInstance().listMaintenances(key);
    }

    public Maintenance getMaintenanceById(String id) {
        return MaintenanceDAO.getInstance().getMaintenanceById(String.valueOf(id));
    }

    public ResultDTO removeMaintenance(String id) {
        return MaintenanceDAO.getInstance().removeMaintenance(id);
    }
    
    public List<Maintenance> listMaintenancesByType(String type) {
        return MaintenanceDAO.getInstance().listMaintenancesByType(type);
    }
}

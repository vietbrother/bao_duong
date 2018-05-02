/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.service;

import com.iso.dashboard.dao.MaintenanceWorkDAO;
import com.iso.dashboard.dto.MMaintenanceWork;
import com.iso.dashboard.dto.ResultDTO;
import java.util.List;

/**
 *
 * @author Thuclt-VNPTTech
 */
public class MaintenanceWorkMngtService {

    private static MaintenanceWorkMngtService service;

    public static MaintenanceWorkMngtService getInstance() {
        if (service == null) {
            service = new MaintenanceWorkMngtService();
        }
        return service;
    }

    public ResultDTO addMaintenanceWork(MMaintenanceWork et) {
        return MaintenanceWorkDAO.getInstance().addMaintenanceWork(et);
    }

    public ResultDTO updateMaintenanceWork(MMaintenanceWork et) {
        return MaintenanceWorkDAO.getInstance().updateMaintenanceWork(et);
    }

    public List<MMaintenanceWork> listMaintenanceWork(String key) {
        return MaintenanceWorkDAO.getInstance().listMaintenanceWork(key);
    }

    public MMaintenanceWork getMaintenanceWorkById(String id) {
        return MaintenanceWorkDAO.getInstance().getMaintenanceWorkById(String.valueOf(id));
    }

    public ResultDTO removeMaintenanceWork(String id) {
        return MaintenanceWorkDAO.getInstance().removeMaintenanceWork(id);
    }

    public List<MMaintenanceWork> getMaintenanceWorkByEmployeeId(int maintenanceId) {
        return MaintenanceWorkDAO.getInstance().getMaintenanceWorkByMaintenanceId(maintenanceId);
    }
}

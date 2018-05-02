/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.service;

import com.iso.dashboard.dao.RepairLaborDAO;
import com.iso.dashboard.dto.RepairLabor;
import com.iso.dashboard.dto.ResultDTO;
import java.util.List;

/**
 *
 * @author Thuclt-VNPTTech
 */
public class RepairLaborMngtService {
    
    private static RepairLaborMngtService service;

    public static RepairLaborMngtService getInstance() {
        if (service == null) {
            service = new RepairLaborMngtService();
        }
        return service;
    }

    public ResultDTO addRepairLabor(RepairLabor et) {
        return RepairLaborDAO.getInstance().addRepairLabor(et);
    }

    public ResultDTO updateRepairLabor(RepairLabor et) {
        return RepairLaborDAO.getInstance().updateRepairLabor(et);
    }

    public List<RepairLabor> listRepairLaborsAll(String key, String maintainType) {
        return RepairLaborDAO.getInstance().listRepairLaborsAll(key, maintainType);
    }
    public List<RepairLabor> listRepairLabors(String parentId, String maintainType) {
        return RepairLaborDAO.getInstance().listRepairLabors(parentId, maintainType);
    }

    public RepairLabor getRepairLaborById(String id) {
        return RepairLaborDAO.getInstance().getRepairLaborById(String.valueOf(id));
    }

    public ResultDTO removeRepairLabor(String id) {
        return RepairLaborDAO.getInstance().removeRepairLabor(id);
    }
    
    public void removeRepairLaborByType(String maitainType) {
        RepairLaborDAO.getInstance().deleteRepairLabor(maitainType);
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.service;

import com.iso.dashboard.dao.RepairTypeDAO;
import com.iso.dashboard.dto.RepairType;
import com.iso.dashboard.dto.ResultDTO;
import java.util.List;

/**
 *
 * @author Thuclt-VNPTTech
 */
public class RepairTypeMngtService {
    
    private static RepairTypeMngtService service;

    public static RepairTypeMngtService getInstance() {
        if (service == null) {
            service = new RepairTypeMngtService();
        }
        return service;
    }

    public ResultDTO addRepairType(RepairType et) {
        return RepairTypeDAO.getInstance().addRepairType(et);
    }

    public ResultDTO updateRepairType(RepairType et) {
        return RepairTypeDAO.getInstance().updateRepairType(et);
    }

    public List<RepairType> listRepairTypes(String key) {
        return RepairTypeDAO.getInstance().listRepairTypes(key);
    }

    public RepairType getRepairTypeById(String id) {
        return RepairTypeDAO.getInstance().getRepairTypeById(String.valueOf(id));
    }

    public ResultDTO removeRepairType(String id) {
        return RepairTypeDAO.getInstance().removeRepairType(id);
    }
}

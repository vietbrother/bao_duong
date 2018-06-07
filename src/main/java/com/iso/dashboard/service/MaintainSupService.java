/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.service;

import com.iso.dashboard.dao.MaintainSupplyDAO;
import com.iso.dashboard.dto.MaintainSup;
import com.iso.dashboard.dto.ResultDTO;
import com.iso.dashboard.dto.ResultMaintainDTO;
import java.util.List;

/**
 *
 * @author Thuclt-VNPTTech
 */
public class MaintainSupService {

    private static MaintainSupService service;

    public static MaintainSupService getInstance() {
        if (service == null) {
            service = new MaintainSupService();
        }
        return service;
    }

    public ResultDTO addRepairLabor(MaintainSup et) {
        return MaintainSupplyDAO.getInstance().addRepairLabor(et);
    }

    public ResultDTO updateRepairLabor(MaintainSup et) {
        return MaintainSupplyDAO.getInstance().updateRepairLabor(et);
    }

    public List<MaintainSup> listRepairLaborsAll(String key, String maintainType) {
        return MaintainSupplyDAO.getInstance().listRepairLaborsAll(key, maintainType);
    }

    public List<MaintainSup> listRepairLabors(String parentId, String maintainType) {
        return MaintainSupplyDAO.getInstance().listRepairLabors(maintainType);
    }

    public MaintainSup getRepairLaborById(String id) {
        return MaintainSupplyDAO.getInstance().getRepairLaborById(String.valueOf(id));
    }

    public ResultDTO removeRepairLabor(String id) {
        return MaintainSupplyDAO.getInstance().removeRepairLabor(id);
    }

    public List<ResultMaintainDTO> getListResultSupply(int maintainType, String supName) {
        return MaintainSupplyDAO.getInstance().getListResultMaintain(maintainType, supName);
    }

    public void removeRepairLaborByType(String maitainType) {
        MaintainSupplyDAO.getInstance().deleteRepairLabor(maitainType);
    }
}

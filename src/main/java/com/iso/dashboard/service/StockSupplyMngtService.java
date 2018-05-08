/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.service;

import com.iso.dashboard.dao.StockSupplyDAO;
import com.iso.dashboard.dto.ResultDTO;
import com.iso.dashboard.dto.StockSupply;
import java.util.List;

/**
 *
 * @author Thuclt-VNPTTech
 */
public class StockSupplyMngtService {
    
    private static StockSupplyMngtService service;

    public static StockSupplyMngtService getInstance() {
        if (service == null) {
            service = new StockSupplyMngtService();
        }
        return service;
    }

    public ResultDTO addRepairLabor(StockSupply et) {
        return StockSupplyDAO.getInstance().addRepairLabor(et);
    }

    public ResultDTO updateRepairLabor(StockSupply et) {
        return StockSupplyDAO.getInstance().updateRepairLabor(et);
    }

    public List<StockSupply> listRepairLaborsAll(String key) {
        return StockSupplyDAO.getInstance().listRepairLaborsAll(key);
    }


    public StockSupply getRepairLaborById(String id) {
        return StockSupplyDAO.getInstance().getRepairLaborById(String.valueOf(id));
    }

    public ResultDTO removeRepairLabor(String id) {
        return StockSupplyDAO.getInstance().removeRepairLabor(id);
    }

}

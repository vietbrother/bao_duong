/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.service;

import com.iso.dashboard.dao.MaterialGroupDAO;
import com.iso.dashboard.dto.MaterialGroup;
import com.iso.dashboard.dto.ResultDTO;
import java.util.List;

/**
 *
 * @author Thuclt-VNPTTech
 */
public class MaterialGroupMngtService {
    
    private static MaterialGroupMngtService service;

    public static MaterialGroupMngtService getInstance() {
        if (service == null) {
            service = new MaterialGroupMngtService();
        }
        return service;
    }

    public ResultDTO addMaterialGroup(MaterialGroup et) {
        return MaterialGroupDAO.getInstance().addMaterialGroup(et);
    }

    public ResultDTO updateMaterialGroup(MaterialGroup et) {
        return MaterialGroupDAO.getInstance().updateMaterialGroup(et);
    }

    public List<MaterialGroup> listMaterialGroups(String key) {
        return MaterialGroupDAO.getInstance().listMaterialGroups(key);
    }

    public MaterialGroup getMaterialGroupById(String id) {
        return MaterialGroupDAO.getInstance().getMaterialGroupById(String.valueOf(id));
    }

    public ResultDTO removeMaterialGroup(String id) {
        return MaterialGroupDAO.getInstance().removeMaterialGroup(id);
    }
}

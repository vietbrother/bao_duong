/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.service;

import com.iso.dashboard.dao.MaterialTypeDAO;
import com.iso.dashboard.dto.MaterialType;
import com.iso.dashboard.dto.ResultDTO;
import java.util.List;

/**
 *
 * @author Thuclt-VNPTTech
 */
public class MaterialTypeMngtService {
    
    private static MaterialTypeMngtService service;

    public static MaterialTypeMngtService getInstance() {
        if (service == null) {
            service = new MaterialTypeMngtService();
        }
        return service;
    }

    public ResultDTO addMaterialType(MaterialType et) {
        return MaterialTypeDAO.getInstance().addMaterialType(et);
    }

    public ResultDTO updateMaterialType(MaterialType et) {
        return MaterialTypeDAO.getInstance().updateMaterialType(et);
    }

    public List<MaterialType> listMaterialTypes(String key) {
        return MaterialTypeDAO.getInstance().listMaterialTypes(key);
    }

    public MaterialType getMaterialTypeById(String id) {
        return MaterialTypeDAO.getInstance().getMaterialTypeById(String.valueOf(id));
    }

    public ResultDTO removeMaterialType(String id) {
        return MaterialTypeDAO.getInstance().removeMaterialType(id);
    }
}

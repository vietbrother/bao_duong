/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.service;

import com.iso.dashboard.dao.MaterialDAO;
import com.iso.dashboard.dto.Material;
import com.iso.dashboard.dto.ResultDTO;
import java.util.List;

/**
 *
 * @author Thuclt-VNPTTech
 */
public class MaterialMngtService {
    
    private static MaterialMngtService service;

    public static MaterialMngtService getInstance() {
        if (service == null) {
            service = new MaterialMngtService();
        }
        return service;
    }

    public ResultDTO addMaterial(Material et) {
        return MaterialDAO.getInstance().addMaterial(et);
    }

    public ResultDTO updateMaterial(Material et) {
        return MaterialDAO.getInstance().updateMaterial(et);
    }

    public List<Material> listMaterials(String key) {
        return MaterialDAO.getInstance().listMaterials(key);
    }

    public Material getMaterialById(String id) {
        return MaterialDAO.getInstance().getMaterialById(String.valueOf(id));
    }

    public ResultDTO removeMaterial(String id) {
        return MaterialDAO.getInstance().removeMaterial(id);
    }
}

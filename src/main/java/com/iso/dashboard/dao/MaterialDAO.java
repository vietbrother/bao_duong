/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.dao;

import com.iso.dashboard.dto.Material;
import com.iso.dashboard.dto.ResultDTO;
import com.iso.dashboard.utils.Constants;
import com.iso.dashboard.utils.DataUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Thuclt-VNPTTech
 */
public class MaterialDAO extends BaseDAO{
    
    private static MaterialDAO dao;

    public static MaterialDAO getInstance() {
        if (dao == null) {
            dao = new MaterialDAO();
        }
        return dao;
    }

    public List<Material> listMaterials(String key) {
        List<Material> listMaterials = new ArrayList<>();
        Session session = null;
        try {
            session = getSession();
            String sql = "FROM Material mat "
                    + (DataUtil.isNullOrEmpty(key) ? "" : ("where LOWER(mat.name) like ? "))
                    + "ORDER BY mat.name ASC";
            Query query = session.createQuery(sql);
            if (!DataUtil.isNullOrEmpty(key)) {
                query.setParameter(0, "%" + key.toLowerCase() + "%");
            }
            listMaterials = (List<Material>) query.list();
            session.getTransaction().commit();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listMaterials;
    }

    public ResultDTO addMaterial(Material mat) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            int id = (Integer) session.save(mat);
            //session.flush();
//            getTransaction().commit();
            session.getTransaction().commit();
            session.close();
            res.setId(String.valueOf(id));
            res.setKey(Constants.SUCCESS);
        } catch (Exception ex) {
            ex.printStackTrace();
            res.setMessage(ex.getMessage());
        }
        return res;
    }

    public ResultDTO updateMaterial(Material newData) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            Material mat = (Material) session.get(Material.class, newData.getId());
            mat.setName(newData.getName());
            session.update(mat);
            //session.flush();
//            getTransaction().commit();
            session.getTransaction().commit();
            res.setKey(Constants.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            res.setMessage(e.getMessage());
        }
        return res;
    }

    public ResultDTO removeMaterial(String id) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            Material mat = (Material) session.get(Material.class, Integer.valueOf(id));
            session.delete(mat);
            //session.flush();
//            getTransaction().commit();
            session.getTransaction().commit();
            res.setKey(Constants.SUCCESS);
        } catch (Exception e) {
            res.setMessage(e.getMessage());
            e.printStackTrace();
        }
        return res;
    }

    public Material getMaterialById(String id) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        Material mat = null;
        try {
            session = getSession();
            mat = (Material) session.get(Material.class, Integer.valueOf(id));
            session.getTransaction().commit();
            session.close();
            res.setKey(Constants.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            res.setMessage(e.getMessage());
        }
        return mat;
    }
}

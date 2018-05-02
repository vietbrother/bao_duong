/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.dao;

import com.iso.dashboard.dto.MaterialGroup;
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
public class MaterialGroupDAO extends BaseDAO{
    
    private static MaterialGroupDAO dao;

    public static MaterialGroupDAO getInstance() {
        if (dao == null) {
            dao = new MaterialGroupDAO();
        }
        return dao;
    }

    public List<MaterialGroup> listMaterialGroups(String key) {
        List<MaterialGroup> listMaterialGroups = new ArrayList<>();
        Session session = null;
        try {
            session = getSession();
            String sql = "FROM MaterialGroup eg "
                    + (DataUtil.isNullOrEmpty(key) ? "" : ("where LOWER(eg.name) like ? "))
                    + "ORDER BY eg.name ASC";
            Query query = session.createQuery(sql);
            if (!DataUtil.isNullOrEmpty(key)) {
                query.setParameter(0, "%" + key.toLowerCase() + "%");
            }
            listMaterialGroups = (List<MaterialGroup>) query.list();
            session.getTransaction().commit();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listMaterialGroups;
    }

    public ResultDTO addMaterialGroup(MaterialGroup eg) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            int id = (Integer) session.save(eg);
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

    public ResultDTO updateMaterialGroup(MaterialGroup newData) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            MaterialGroup eg = (MaterialGroup) session.get(MaterialGroup.class, newData.getId());
            eg.setName(newData.getName());
            session.update(eg);
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

    public ResultDTO removeMaterialGroup(String id) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            MaterialGroup et = (MaterialGroup) session.get(MaterialGroup.class, Integer.valueOf(id));
            session.delete(et);
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

    public MaterialGroup getMaterialGroupById(String id) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        MaterialGroup assetGroup = null;
        try {
            session = getSession();
            assetGroup = (MaterialGroup) session.get(MaterialGroup.class, Integer.valueOf(id));
            session.getTransaction().commit();
            session.close();
            res.setKey(Constants.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            res.setMessage(e.getMessage());
        }
        return assetGroup;
    }
}

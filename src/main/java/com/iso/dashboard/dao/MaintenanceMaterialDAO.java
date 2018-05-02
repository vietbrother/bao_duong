/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.dao;

import com.iso.dashboard.dto.MMaintenanceMaterial;
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
public class MaintenanceMaterialDAO extends BaseDAO {

    private static MaintenanceMaterialDAO dao;

    public static MaintenanceMaterialDAO getInstance() {
        if (dao == null) {
            dao = new MaintenanceMaterialDAO();
        }
        return dao;
    }

    public List<MMaintenanceMaterial> listMaintenanceMaterial(String key) {
        List<MMaintenanceMaterial> listMaintenanceMaterials = new ArrayList<>();
        Session session = null;
        try {
            session = getSession();
            String sql = "FROM MaintenanceMaterial ep "
                    + (DataUtil.isNullOrEmpty(key) ? "" : ("where LOWER(ep.code) like ? "))
                    + "ORDER BY ep.code ASC";
            Query query = session.createQuery(sql);
            if (!DataUtil.isNullOrEmpty(key)) {
                query.setParameter(0, "%" + key.toLowerCase() + "%");
            }
            listMaintenanceMaterials = (List<MMaintenanceMaterial>) query.list();
            session.getTransaction().commit();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listMaintenanceMaterials;
    }

    public ResultDTO addMaintenanceMaterial(MMaintenanceMaterial ep) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            int id = (Integer) session.save(ep);
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

    public ResultDTO updateMaintenanceMaterial(MMaintenanceMaterial newData) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            MMaintenanceMaterial ep = (MMaintenanceMaterial) session.get(MMaintenanceMaterial.class, newData.getId());
            ep.setCode(newData.getCode());
            session.update(ep);
            //session.flush();
//            getTransaction().commit();
            session.getTransaction().commit();
            session.close();
            res.setKey(Constants.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            res.setMessage(e.getMessage());
        }
        return res;
    }

    public ResultDTO removeMaintenanceMaterial(String id) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            MMaintenanceMaterial ep = (MMaintenanceMaterial) session.get(MMaintenanceMaterial.class, Integer.valueOf(id));
            session.delete(ep);
            //session.flush();
//            getTransaction().commit();
            session.getTransaction().commit();
            session.close();
            res.setKey(Constants.SUCCESS);
        } catch (Exception e) {
            res.setMessage(e.getMessage());
            e.printStackTrace();
        }
        return res;
    }

    public MMaintenanceMaterial getMaintenanceMaterialById(String id) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        MMaintenanceMaterial employeeProcess = null;
        try {
            session = getSession();
            employeeProcess = (MMaintenanceMaterial) session.get(MMaintenanceMaterial.class, Integer.valueOf(id));
            session.getTransaction().commit();
            session.close();
            res.setKey(Constants.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            res.setMessage(e.getMessage());
        }
        return employeeProcess;
    }

    public List<MMaintenanceMaterial> getMaintenanceMaterialByMaintenanceId(int maintenanceId) {
        List<MMaintenanceMaterial> listMaintenanceMaterial = new ArrayList<>();
        Session session = null;
        try {
            session = getSession();
            String sql = "FROM MaintenanceMaterial ep "
                    + (DataUtil.isNullOrEmpty(maintenanceId) ? "" : ("where LOWER(ep.maintenance.id) = ? "))
                    + "ORDER BY ep.code ASC";
            Query query = session.createQuery(sql);
            if (!DataUtil.isNullOrEmpty(maintenanceId)) {
                query.setParameter(0, maintenanceId);
            }
            listMaintenanceMaterial = (List<MMaintenanceMaterial>) query.list();
            session.getTransaction().commit();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listMaintenanceMaterial;
    }

}

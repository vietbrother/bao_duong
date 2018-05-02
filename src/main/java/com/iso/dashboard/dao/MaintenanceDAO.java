/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.dao;

import com.iso.dashboard.dto.Maintenance;
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
public class MaintenanceDAO extends BaseDAO {

    private static MaintenanceDAO dao;

    public static MaintenanceDAO getInstance() {
        if (dao == null) {
            dao = new MaintenanceDAO();
        }
        return dao;
    }

    public List<Maintenance> listMaintenances(String key) {
        List<Maintenance> listMaintenances = new ArrayList<>();
        Session session = null;
        try {
            session = getSession();
            String sql = "FROM Maintenance mnt "
                    + (DataUtil.isNullOrEmpty(key) ? "" : ("where LOWER(mnt.name) like ? "))
                    + "ORDER BY mnt.name ASC";
            Query query = session.createQuery(sql);
            if (!DataUtil.isNullOrEmpty(key)) {
                query.setParameter(0, "%" + key.toLowerCase() + "%");
            }
            listMaintenances = (List<Maintenance>) query.list();
            session.getTransaction().commit();

//            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listMaintenances;
    }

    public ResultDTO addMaintenance(Maintenance mnt) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            int id = (Integer) session.save(mnt);
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

    public ResultDTO updateMaintenance(Maintenance newData) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            Maintenance mnt = (Maintenance) session.get(Maintenance.class, newData.getId());
            mnt.setName(newData.getName());
            session.update(mnt);
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

    public ResultDTO removeMaintenance(String id) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            Maintenance mnt = (Maintenance) session.get(Maintenance.class, Integer.valueOf(id));
            session.delete(mnt);
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

    public Maintenance getMaintenanceById(String id) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        Maintenance mnt = null;
        try {
            session = getSession();
            mnt = (Maintenance) session.get(Maintenance.class, Integer.valueOf(id));
            session.getTransaction().commit();
            session.close();
            res.setKey(Constants.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            res.setMessage(e.getMessage());
        }
        return mnt;
    }

    public List<Maintenance> listMaintenancesByType(String type) {
        List<Maintenance> listMaintenances = new ArrayList<>();
        Session session = null;
        try {
            session = getSession();
            String sql = "FROM Maintenance mnt "
                    + (DataUtil.isNullOrEmpty(type) ? "" : ("where mnt.maintenanceType.id = ? "))
                    + "ORDER BY mnt.name ASC";
            Query query = session.createQuery(sql);
            if (!DataUtil.isNullOrEmpty(type)) {
                query.setParameter(0, Integer.valueOf(type));
            }
            listMaintenances = (List<Maintenance>) query.list();
            session.getTransaction().commit();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listMaintenances;
    }
}

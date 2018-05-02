/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.dao;

import com.iso.dashboard.dto.MMaintenanceWork;
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
public class MaintenanceWorkDAO extends BaseDAO {

    private static MaintenanceWorkDAO dao;

    public static MaintenanceWorkDAO getInstance() {
        if (dao == null) {
            dao = new MaintenanceWorkDAO();
        }
        return dao;
    }

    public List<MMaintenanceWork> listMaintenanceWork(String key) {
        List<MMaintenanceWork> listMaintenanceWorks = new ArrayList<>();
        Session session = null;
        try {
            session = getSession();
            String sql = "FROM MaintenanceWork ep "
                    + (DataUtil.isNullOrEmpty(key) ? "" : ("where LOWER(ep.name) like ? "))
                    + "ORDER BY ep.name ASC";
            Query query = session.createQuery(sql);
            if (!DataUtil.isNullOrEmpty(key)) {
                query.setParameter(0, "%" + key.toLowerCase() + "%");
            }
            listMaintenanceWorks = (List<MMaintenanceWork>) query.list();
            session.getTransaction().commit();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listMaintenanceWorks;
    }

    public ResultDTO addMaintenanceWork(MMaintenanceWork ep) {
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

    public ResultDTO updateMaintenanceWork(MMaintenanceWork newData) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            MMaintenanceWork ep = (MMaintenanceWork) session.get(MMaintenanceWork.class, newData.getId());
            ep.setName(newData.getName());
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

    public ResultDTO removeMaintenanceWork(String id) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            MMaintenanceWork ep = (MMaintenanceWork) session.get(MMaintenanceWork.class, Integer.valueOf(id));
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

    public MMaintenanceWork getMaintenanceWorkById(String id) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        MMaintenanceWork employeeProcess = null;
        try {
            session = getSession();
            employeeProcess = (MMaintenanceWork) session.get(MMaintenanceWork.class, Integer.valueOf(id));
            session.getTransaction().commit();
            session.close();
            res.setKey(Constants.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            res.setMessage(e.getMessage());
        }
        return employeeProcess;
    }

    public List<MMaintenanceWork> getMaintenanceWorkByMaintenanceId(int maintenanceId) {
        List<MMaintenanceWork> listMaintenanceWork = new ArrayList<>();
        Session session = null;
        try {
            session = getSession();
            String sql = "FROM MaintenanceWork ep "
                    + (DataUtil.isNullOrEmpty(maintenanceId) ? "" : ("where LOWER(ep.maintenance.id) = ? "))
                    + "ORDER BY ep.code ASC";
            Query query = session.createQuery(sql);
            if (!DataUtil.isNullOrEmpty(maintenanceId)) {
                query.setParameter(0, maintenanceId);
            }
            listMaintenanceWork = (List<MMaintenanceWork>) query.list();
            session.getTransaction().commit();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listMaintenanceWork;
    }

}

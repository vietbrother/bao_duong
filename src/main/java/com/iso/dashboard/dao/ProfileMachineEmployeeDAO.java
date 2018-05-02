/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.dao;

import com.iso.dashboard.dto.MProfileEmployee;
import com.iso.dashboard.dto.MProfileEmployee;
import com.iso.dashboard.dto.ResultDTO;
import com.iso.dashboard.utils.Constants;
import com.iso.dashboard.utils.DataUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;


public class ProfileMachineEmployeeDAO extends BaseDAO {

    private static ProfileMachineEmployeeDAO dao;

    public static ProfileMachineEmployeeDAO getInstance() {
        if (dao == null) {
            dao = new ProfileMachineEmployeeDAO();
        }
        return dao;
    }

    public List<MProfileEmployee> listMProfileEmployee(String key) {
        List<MProfileEmployee> listMProfileEmployees = new ArrayList<>();
        Session session = null;
        try {
            session = getSession();
            String sql = "FROM MProfileEmployee ep "
                    + (DataUtil.isNullOrEmpty(key) ? "" : ("where LOWER(ep.profile.name) like ? "))
                    + "ORDER BY id DESC";
            Query query = session.createQuery(sql);
            if (!DataUtil.isNullOrEmpty(key)) {
                query.setParameter(0, "%" + key.toLowerCase() + "%");
            }
            listMProfileEmployees = (List<MProfileEmployee>) query.list();
            session.getTransaction().commit();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listMProfileEmployees;
    }

    public ResultDTO addMProfileEmployee(MProfileEmployee ep) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            int id = (Integer) session.save(ep);
            //session.flush();
//            getTransaction().commit();
            session.getTransaction().commit();
            res.setId(String.valueOf(id));
            res.setKey(Constants.SUCCESS);
        } catch (Exception ex) {
            ex.printStackTrace();
            res.setMessage(ex.getMessage());
        }
        return res;
    }

    public ResultDTO updateMProfileEmployee(MProfileEmployee newData) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            MProfileEmployee ep = (MProfileEmployee) session.get(MProfileEmployee.class, newData.getId());
            session.update(ep);
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

    public ResultDTO removeMProfileEmployee(String id) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            MProfileEmployee ep = (MProfileEmployee) session.get(MProfileEmployee.class, Integer.valueOf(id));
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
    
    public void removeMProfileEmployeeByProfileId(String profileId, String employeeId){
        Session session = null;
        try {
            session = getSession();
            List params = new ArrayList();
            String sql = "delete from MProfileEmployee where 1=1";
            if (!DataUtil.isNullOrEmpty(profileId)) {
                sql += "and profile.id = ? ";
                params.add(profileId);
            }
            if (!DataUtil.isNullOrEmpty(employeeId)) {
                sql += "and employee.id = ? ";
                params.add(employeeId);
            }

            Query query = session.createQuery(sql);
            for (int i = 0; i < params.size(); i++) {
                query.setParameter(i, Integer.parseInt(params.get(i).toString()));
            }
            query.executeUpdate();
            session.getTransaction().commit();
        } catch (Exception e) {
            if (session != null && session.isOpen()) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        }
    }

    public MProfileEmployee getMProfileEmployeeById(String id) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        MProfileEmployee employeeProcess = null;
        try {
            session = getSession();
            employeeProcess = (MProfileEmployee) session.get(MProfileEmployee.class, Integer.valueOf(id));
            session.getTransaction().commit();
            session.close();
            res.setKey(Constants.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            res.setMessage(e.getMessage());
        }
        return employeeProcess;
    }

    public List<MProfileEmployee> getMProfileEmployeeByProfileId(int profileId) {
        List<MProfileEmployee> listMProfileEmployee = new ArrayList<>();
        Session session = null;
        try {
            session = getSession();
            String sql = "FROM MProfileEmployee ep "
                    + (DataUtil.isNullOrEmpty(profileId) ? "" : ("where LOWER(ep.profile.id) = ? "))
                    + "ORDER BY id DESC";
            Query query = session.createQuery(sql);
            if (!DataUtil.isNullOrEmpty(profileId)) {
                query.setParameter(0, profileId);
            }
            listMProfileEmployee = (List<MProfileEmployee>) query.list();
            session.getTransaction().commit();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listMProfileEmployee;
    }

    public MProfileEmployee getMProfileEmployeeByEmployeeId(int employeeId) {
        List<MProfileEmployee> listMProfileEmployee = new ArrayList<>();
        Session session = null;
        try {
            session = getSession();
            String sql = "FROM MProfileEmployee ep "
                    + (DataUtil.isNullOrEmpty(employeeId) ? "" : ("where LOWER(ep.employee.id) = ? "))
                    + "ORDER BY ep.employee.name ASC";
            Query query = session.createQuery(sql);
            if (!DataUtil.isNullOrEmpty(employeeId)) {
                query.setParameter(0, employeeId);
            }
            listMProfileEmployee = (List<MProfileEmployee>) query.list();
            session.getTransaction().commit();
            return listMProfileEmployee.get(0);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

}

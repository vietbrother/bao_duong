/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.dao;

import com.iso.dashboard.dto.CProfileMachine;
import com.iso.dashboard.dto.ResultDTO;
import com.iso.dashboard.utils.Constants;
import com.iso.dashboard.utils.DataUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class ProfileMachineDAO extends BaseDAO {

    private static ProfileMachineDAO dao;

    public static ProfileMachineDAO getInstance() {
        if (dao == null) {
            dao = new ProfileMachineDAO();
        }
        return dao;
    }

    public List<CProfileMachine> listCProfileMachines(String key) {
        List<CProfileMachine> listCProfileMachines = new ArrayList<>();
        Session session = null;
        try {
            session = getSession();
            String sql = "FROM CProfileMachine et "
                    + (DataUtil.isNullOrEmpty(key) ? "" : ("where LOWER(et.name) like ? "))
                    + "ORDER BY et.name ASC";
            Query query = session.createQuery(sql);
            if (!DataUtil.isNullOrEmpty(key)) {
                query.setParameter(0, "%" + key.toLowerCase() + "%");
            }
            listCProfileMachines = (List<CProfileMachine>) query.list();
            session.getTransaction().commit();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listCProfileMachines;
    }

    public ResultDTO addCProfileMachine(CProfileMachine et) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            int id = (Integer) session.save(et);
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

    public ResultDTO updateCProfileMachine(CProfileMachine newData) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            CProfileMachine et = (CProfileMachine) session.get(CProfileMachine.class, newData.getId());
            et.setCode(newData.getCode());
            et.setName(newData.getName());
            et.setManufactureCountry(newData.getManufactureCountry());
            et.setWheelFormula(newData.getWheelFormula());
            et.setRepairType(newData.getRepairType());
            et.setSizeTotal(newData.getSizeTotal());
            et.setNumberSeating(newData.getNumberSeating());
            et.setWidth(newData.getWidth());
            et.setWeight(newData.getWeight());
            et.setVolume(newData.getVolume());
            et.setMaxPower(newData.getMaxPower());
            et.setDriveSystem(newData.getDriveSystem());
            et.setBattery(newData.getBattery());
            et.setWheelUse(newData.getWheelUse());
            et.setDetail(newData.getDetail());
            et.setAvatar(newData.getAvatar());
            et.setManufactureYear(newData.getManufactureYear());
            et.setWeightCurrent(newData.getWeightCurrent());
            et.setEmployee(newData.getEmployee());
            session.update(et);
            session.getTransaction().commit();
            res.setKey(Constants.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            res.setMessage(e.getMessage());
        }
        return res;
    }

    public ResultDTO removeCProfileMachine(String id) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            CProfileMachine et = (CProfileMachine) session.get(CProfileMachine.class, Integer.valueOf(id));
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

    public CProfileMachine getCProfileMachineById(String id) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        CProfileMachine assetTypes = null;
        try {
            session = getSession();
            assetTypes = (CProfileMachine) session.get(CProfileMachine.class, Integer.valueOf(id));
            session.getTransaction().commit();
            res.setKey(Constants.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            res.setMessage(e.getMessage());
        }
        return assetTypes;
    }
}

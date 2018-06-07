/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.dao;

import com.iso.dashboard.dto.ResultDTO;
import com.iso.dashboard.dto.ResultMaintainDTO;
import com.iso.dashboard.dto.StockSupply;
import com.iso.dashboard.utils.Constants;
import com.iso.dashboard.utils.DataUtil;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Thuclt-VNPTTech
 */
public class StockSupplyDAO extends BaseDAO {

    private static StockSupplyDAO dao;

    public static StockSupplyDAO getInstance() {
        if (dao == null) {
            dao = new StockSupplyDAO();
        }
        return dao;
    }

    public List<StockSupply> listRepairLaborsAll(String key) {
        List<StockSupply> listRepairLabors = new ArrayList<>();
        List<Object> params = new ArrayList<>();
        Session session = null;
        try {
            session = getSession();
            String sql = "FROM StockSupply et where 1=1 ";
            if (!DataUtil.isNullOrEmpty(key)) {
                sql += " and LOWER(et.name) like ? ";
                params.add("%" + key.toLowerCase() + "%");
            }
            sql += " ORDER BY et.name ASC";
            Query query = session.createQuery(sql);
            for (int i = 0; i < params.size(); i++) {
                query.setParameter(i, params.get(i));
            }
            listRepairLabors = (List<StockSupply>) query.list();
            session.getTransaction().commit();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listRepairLabors;
    }

    public ResultDTO addRepairLabor(StockSupply et) {
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

    public ResultDTO updateRepairLabor(StockSupply newData) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            StockSupply et = (StockSupply) session.get(StockSupply.class, newData.getId());
            et.setCode(newData.getCode());
            et.setContractCode(newData.getContractCode());
            et.setName(newData.getName());
            et.setPrice(newData.getPrice());
            et.setQuantity(newData.getQuantity());
            et.setUnit(newData.getUnit());
            session.update(et);
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

    public ResultDTO removeRepairLabor(String id) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            StockSupply et = (StockSupply) session.get(StockSupply.class, Integer.valueOf(id));
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

    public StockSupply getRepairLaborById(String id) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        StockSupply assetTypes = null;
        try {
            session = getSession();
            assetTypes = (StockSupply) session.get(StockSupply.class, Integer.valueOf(id));
            session.getTransaction().commit();
            res.setKey(Constants.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            res.setMessage(e.getMessage());
        }
        return assetTypes;
    }
    

}

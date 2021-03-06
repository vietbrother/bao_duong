/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.dao;

import com.iso.dashboard.dto.MaintainSup;
import com.iso.dashboard.dto.ResultDTO;
import com.iso.dashboard.dto.ResultMaintainDTO;
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
public class MaintainSupplyDAO extends BaseDAO {

    private static MaintainSupplyDAO dao;

    public static MaintainSupplyDAO getInstance() {
        if (dao == null) {
            dao = new MaintainSupplyDAO();
        }
        return dao;
    }

    public List<MaintainSup> listRepairLaborsAll(String key, String maintainType) {
        List<MaintainSup> listRepairLabors = new ArrayList<>();
        List<Object> params = new ArrayList<>();
        Session session = null;
        try {
            session = getSession();
            String sql = "FROM MaintainSup et where 1=1 ";
            if (!DataUtil.isNullOrEmpty(key)) {
                sql += " and LOWER(et.supName) like ? ";
                params.add("%" + key.toLowerCase() + "%");
            }
            if (!DataUtil.isNullOrEmpty(maintainType)) {
                sql += " and et.maintainType = ? ";
                params.add(Integer.parseInt(maintainType));
            }
            sql += " ORDER BY et.supName ASC";
            Query query = session.createQuery(sql);
            for (int i = 0; i < params.size(); i++) {
                query.setParameter(i, params.get(i));
            }
            listRepairLabors = (List<MaintainSup>) query.list();
            session.getTransaction().commit();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listRepairLabors;
    }

    public List<MaintainSup> listRepairLabors(String maintainType) {
        List<MaintainSup> listRepairLabors = new ArrayList<>();
        List<Object> params = new ArrayList<>();
        Session session = null;
        try {
            session = getSession();
            String sql = "FROM MaintainSup et where 1=1 ";
            if (!DataUtil.isNullOrEmpty(maintainType)) {
                sql += " and et.maintainType = ? ";
                params.add(Integer.parseInt(maintainType));
            }
            sql += "ORDER BY et.supName ASC";
            Query query = session.createQuery(sql);
            for (int i = 0; i < params.size(); i++) {
                query.setParameter(i, params.get(i));
            }
            listRepairLabors = (List<MaintainSup>) query.list();
            session.getTransaction().commit();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listRepairLabors;
    }

    public ResultDTO addRepairLabor(MaintainSup et) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            int id = (Integer) session.save(et);
            session.getTransaction().commit();
            res.setId(String.valueOf(id));
            res.setKey(Constants.SUCCESS);
        } catch (Exception ex) {
            ex.printStackTrace();
            res.setMessage(ex.getMessage());
        }
        return res;
    }

    public ResultDTO updateRepairLabor(MaintainSup newData) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        try {
            session = getSession();
            MaintainSup et = (MaintainSup) session.get(MaintainSup.class, newData.getId());
            et.setSupName(newData.getSupName());
            et.setSupUnit(newData.getSupUnit());
            et.setQuantity(newData.getQuantity());
            et.setMaintainType(newData.getMaintainType());
            et.setRepairType(newData.getRepairType());
            session.update(et);
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
            MaintainSup et = (MaintainSup) session.get(MaintainSup.class, Integer.valueOf(id));
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

    public MaintainSup getRepairLaborById(String id) {
        ResultDTO res = new ResultDTO(Constants.FAIL, "");
        Session session = null;
        MaintainSup assetTypes = null;
        try {
            session = getSession();
            assetTypes = (MaintainSup) session.get(MaintainSup.class, Integer.valueOf(id));
            session.getTransaction().commit();
            res.setKey(Constants.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            res.setMessage(e.getMessage());
        }
        return assetTypes;
    }
    
    public List<ResultMaintainDTO> getListResultMaintain(int maintainType, String repairName) {
        Session session = null;
        List<ResultMaintainDTO> result = new ArrayList<>();
        try {
            session = getSession();
            result = session.doReturningWork((Connection cnctn) -> {
                List<ResultMaintainDTO> resultMaintainDTOs = new ArrayList<>();
                CallableStatement cStmt = cnctn.prepareCall("{CALL getMaintainSup(?,?)}");
                cStmt.setInt(1, maintainType);
                String rpn = repairName;
                if(rpn == null){
                    rpn = "";
                }
                cStmt.setString(2, rpn.trim());
                cStmt.execute();
                ResultSet rs1 = cStmt.getResultSet();
                ResultSetMetaData rsmd = rs1.getMetaData();
                int columnsNumber = rsmd.getColumnCount();
                while (rs1.next()) {
                    ResultMaintainDTO maintainDTO = new ResultMaintainDTO();
                    maintainDTO.setName(rs1.getString(1));
                    maintainDTO.setSubInfo(rs1.getString(2));
                    List<String> lstData = new ArrayList<>();
                    List<String> lstLael = new ArrayList<>();
                    for (int i = 3; i <= columnsNumber; i++) {
                        lstData.add(rs1.getString(i));
                        lstLael.add(rsmd.getColumnLabel(i));
                    }
                    maintainDTO.setListHeader(lstData);
                    maintainDTO.setLstLabel(lstLael);
                    resultMaintainDTOs.add(maintainDTO);
                }
                rs1.close();
                cStmt.close();
                return resultMaintainDTOs;
            });
            session.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
    }
    
    public void deleteRepairLabor(String maintainType) {
        List<Object> params = new ArrayList<>();
        Session session = null;
        try {
            session = getSession();
            String sql = "DELETE FROM MaintainSup et where 1=1";
            if (!DataUtil.isNullOrEmpty(maintainType)) {
                sql += " and et.maintainType = ? ";
                params.add(Integer.parseInt(maintainType));
            }
            Query query = session.createQuery(sql);
            for (int i = 0; i < params.size(); i++) {
                query.setParameter(i, params.get(i));
            }
            query.executeUpdate();
            session.getTransaction().commit();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}

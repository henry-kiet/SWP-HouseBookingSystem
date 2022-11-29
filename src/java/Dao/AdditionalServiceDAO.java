/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Connect.DBContext;
import Model.AdditionalService;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class AdditionalServiceDAO {
    
    Connection con;

    public AdditionalServiceDAO() {
        DBContext dbcontext = new DBContext();
        try {
            con = dbcontext.getConnection();
            System.out.println("Successful");
        } catch (Exception e) {
            System.out.println("error: " + e);
        }
    }
    
    
    public List<AdditionalService> getAdditionalService() {
        String sql = "select * from Additional_service";
        List<AdditionalService> list = new ArrayList<>();
        try {
            //tạo khay chứa câu lệnh
            PreparedStatement pre = con.prepareStatement(sql);
            //chạy câu lệnh và tạo khay chứa kết quả câu lệnh
            ResultSet resultSet = pre.executeQuery();
            while (resultSet.next()) {
                int serviceid = resultSet.getInt(1);
                String servicename = resultSet.getString(2);
                String servicedesc = resultSet.getString(3);
                int servicestatus = resultSet.getInt(4);
                float serviceprice = resultSet.getFloat(5);
                AdditionalService as = new AdditionalService(serviceid, servicename, servicedesc, servicestatus, serviceprice);
                list.add(as);
            }
        } catch (Exception e) {
            System.out.println("error: " + e);
        }

        return list;
    }
    
    public void editAdditionalService(AdditionalService as) {
        String sql = "UPDATE [dbo].[Additional_service]\n" +
                        "   SET [add_serviceName] = ?\n" +
                        "      ,[add_serviceDesc] = ?\n" +
                        "      ,[add_service_status] = ?\n" +
                        "      ,[add_service_price] = ?\n" +
                        " WHERE add_service_id = ?";
        try {
            //tạo khay chứa câu lệnh
            PreparedStatement pre = con.prepareStatement(sql);
            //set gia tri cho dau ? 
            pre.setString(1, as.getServicename());
            pre.setString(2, as.getServicedesc());
            pre.setInt(3,as.getServicestatus());
            pre.setFloat(4,as.getServiceprice());
            pre.setInt(5, as.getServiceid());
            pre.executeUpdate();

        } catch (Exception e) {
            System.out.println("error :  " + e);
        }
    }
    
    public void addAdditionalService(AdditionalService as) {
        String sql = "INSERT INTO [dbo].[Additional_service]\n" +
                        "           ([add_serviceName]\n" +
                        "           ,[add_serviceDesc]\n" +
                        "           ,[add_service_status]\n" +
                        "           ,[add_service_price])\n" +
                        "     VALUES\n" +
                        "           (?\n" +
                        "           ,?\n" +
                        "           ,?\n" +
                        "           ,?)";
        try {
            //tạo khay chứa câu lệnh
            PreparedStatement pre = con.prepareStatement(sql);
            //set gia tri cho dau ? 
            pre.setString(1, as.getServicename());
            pre.setString(2, as.getServicedesc());
            pre.setInt(3, as.getServicestatus());
            pre.setFloat(4, as.getServiceprice());
            pre.executeUpdate();

        } catch (Exception e) {
            System.out.println("error :  " + e);
        }
    }
    
    public void deleteHouseAdditionalService(int id) {
        String sql = "DELETE FROM [dbo].[Additional_service]\n" +
                        "      WHERE add_service_id = ?";
        try {
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();

        } catch (Exception e) {
            System.out.println("error :  " + e);
        }
    }
    
    public AdditionalService getAdditionalServicebyID(int id){
        String sql = "select * from Additional_service where add_service_id = ?";
        AdditionalService as = new AdditionalService();
        try {
            //tạo khay chứa câu lệnh
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, id);
            //chạy câu lệnh và tạo khay chứa kết quả câu lệnh
            ResultSet resultSet = pre.executeQuery();
            while(resultSet.next()){
                int serviceid = resultSet.getInt(1);
                String servicename = resultSet.getString(2);
                String servicedesc = resultSet.getString(3);
                int servicestatus = resultSet.getInt(4);
                float serviceprice = resultSet.getFloat(5);
                as = new AdditionalService(serviceid, servicename, servicedesc, servicestatus, serviceprice);
            }
        } catch (Exception e) {
            System.out.println("error: "+e);
        }
        
        return as;
    }
    public List<AdditionalService> getAdditionalServicebyName(String name){
        String sql = "select * from Additional_service where add_serviceName like '%"+name+"%'";
        List<AdditionalService> list = new ArrayList<>();
        try {
            //tạo khay chứa câu lệnh
            PreparedStatement pre = con.prepareStatement(sql);
            //chạy câu lệnh và tạo khay chứa kết quả câu lệnh
            ResultSet resultSet = pre.executeQuery();
            while(resultSet.next()){
                int serviceid = resultSet.getInt(1);
                String servicename = resultSet.getString(2);
                String servicedesc = resultSet.getString(3);
                int servicestatus = resultSet.getInt(4);
                float serviceprice = resultSet.getFloat(5);
                AdditionalService as = new AdditionalService(serviceid, servicename, servicedesc, servicestatus, serviceprice);
                list.add(as);
            }
        } catch (Exception e) {
            System.out.println("error: "+e);
        }
        
        return list;
    }
    
    public List<AdditionalService> getHouseAdditionalServicebyID(int id){
        String sql = "select * from Additional_service where add_service_id = ?";
        List<AdditionalService> list = new ArrayList<>();
        try {
            //tạo khay chứa câu lệnh
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, id);
            //chạy câu lệnh và tạo khay chứa kết quả câu lệnh
            ResultSet resultSet = pre.executeQuery();
            while(resultSet.next()){
                int serviceid = resultSet.getInt(1);
                String servicename = resultSet.getString(2);
                String servicedesc = resultSet.getString(3);
                int servicestatus = resultSet.getInt(4);
                float serviceprice = resultSet.getFloat(5);
                AdditionalService hs = new AdditionalService(serviceid, servicename, servicedesc,servicestatus,serviceprice);
                list.add(hs);
            }
        } catch (Exception e) {
            System.out.println("error: "+e);
        }
        
        return list;
    }
    
}

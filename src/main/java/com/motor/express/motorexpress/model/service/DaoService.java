package com.motor.express.motorexpress.model.service;

import com.motor.express.motorexpress.utils.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DaoService {
    public List<BeanService> getServices() {
        List<BeanService> services = new ArrayList<>();

        try (
                Connection con = MySQLConnection.getConnection();
                PreparedStatement pstm = con.prepareStatement("SELECT * FROM servicios;");
        ){
            ResultSet rs = pstm.executeQuery();
            while (rs.next()){
                BeanService service = new BeanService();
                service.setId(rs.getInt("id"));
                service.setName(rs.getString("nombre"));
                service.setDescription(rs.getString("descripcion"));
                service.setPrice(rs.getInt("precio"));

                services.add(service);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return services;
    }
}

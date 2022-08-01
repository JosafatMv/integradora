package com.motor.express.motorexpress.model.client;

import com.motor.express.motorexpress.model.vehicle.BeanVehicle;
import com.motor.express.motorexpress.utils.MySQLConnection;
import com.motor.express.motorexpress.utils.StatusName;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DaoClient {


    public List<BeanVehicle> getClientVehicles(String rfc) {
        List<BeanVehicle> vehicles = new ArrayList<>();

        try (
                Connection con = MySQLConnection.getConnection();
                PreparedStatement pstm = con.prepareStatement("SELECT * FROM VistaHistorialServicios WHERE rfc = ?");
                PreparedStatement pstm2 = con.prepareStatement("SELECT * FROM UltimoStatus WHERE historiales_id = ?")
        ){

            StatusName statusName = new StatusName();

            pstm.setString(1, rfc);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()){
                BeanVehicle vehicle = new BeanVehicle();
                vehicle.setPlates(rs.getString("placas"));
                vehicle.setModel(rs.getString("modelo"));
                vehicle.setBrand(rs.getString("marca"));
                vehicle.setYear(rs.getInt("anio"));
                vehicle.setColor(rs.getString("color"));
                vehicle.setType(rs.getString("tipo"));
                int historyId = rs.getInt("idHistorial");

                pstm2.setInt(1, historyId);
                ResultSet rs2 = pstm2.executeQuery();
                int idStatus = 0;
                while(rs2.next()){
                    idStatus=rs2.getInt("statusId");
                }
                vehicle.setLastStatus(statusName.getStatusName(idStatus));

                vehicles.add(vehicle);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return vehicles;
    }
}

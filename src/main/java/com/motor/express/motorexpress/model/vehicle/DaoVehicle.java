package com.motor.express.motorexpress.model.vehicle;

import com.motor.express.motorexpress.utils.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DaoVehicle {

    public List<BeanVehicle> getClientVehicles(String rfc, String rol) {
        List<BeanVehicle> vehicles = new ArrayList<>();

        if (rol != "cliente"){
            return vehicles;
        }

        try (
                Connection con = MySQLConnection.getConnection();
                PreparedStatement pstm = con.prepareStatement("SELECT * FROM VistaClientesCarros WHERE rfc = ?");
        ){

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
                vehicle.setEngineNumber(rs.getString("numero_motor"));
                vehicle.setSerialNumber(rs.getString("numero_serie"));

                vehicles.add(vehicle);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return vehicles;
    }

    public boolean saveVehicle(BeanVehicle vehicle) {
        boolean result = false;

        try
                (Connection con = MySQLConnection.getConnection();
                 PreparedStatement pstm = con.prepareStatement("Call PaRegistrarVehiculo(?,?,?,?,?,?,?,?,?);");

                ) {
//            PaPlacas, PaModelo, PaMarca, PaAnio, PaColor, PaTipo, PaNumeroMotor, PaNumeroSerie, PaClienteRfc
            pstm.setString(1, vehicle.getPlates());
            pstm.setString(2, vehicle.getModel());
            pstm.setString(3, vehicle.getBrand());
            pstm.setInt(4, vehicle.getYear());
            pstm.setString(5, vehicle.getColor());
            pstm.setString(6, vehicle.getType());
            pstm.setString(7, vehicle.getEngineNumber());
            pstm.setString(8, vehicle.getSerialNumber());
            pstm.setString(9, vehicle.getOwnerRfc());

            result = pstm.executeUpdate() == 1;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}

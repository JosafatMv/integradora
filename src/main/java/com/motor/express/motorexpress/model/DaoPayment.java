package com.motor.express.motorexpress.model;

import com.motor.express.motorexpress.utils.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DaoPayment {
    public List<BeanPayment> getClientPayments(String rfc, String rol) {
        List<BeanPayment> payments = new ArrayList<>();

        if (!"cliente".equals(rol)){
            return payments;
        }

        try (
                Connection con = MySQLConnection.getConnection();
                PreparedStatement pstm = con.prepareStatement("SELECT * FROM VistaHistorialServicios WHERE rfc = ?")
        ){

            pstm.setString(1, rfc);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()){
                BeanPayment payment = new BeanPayment();
                BeanVehicle vehicle = new BeanVehicle();
                BeanService service = new BeanService();
                payment.setRfc(rs.getString("rfc"));
                vehicle.setPlates(rs.getString("placas"));
                vehicle.setModel(rs.getString("modelo"));
                vehicle.setBrand(rs.getString("marca"));
                vehicle.setYear(rs.getInt("anio"));
                vehicle.setColor(rs.getString("color"));
                vehicle.setType(rs.getString("tipo"));

                service.setName(rs.getString("ServicioDado"));

                payment.setVehicle(vehicle);
                payment.setService(service);

                payment.setHistoryId(rs.getString("idHistorial"));
                payment.setTotalAmount(rs.getInt("monto_total"));
                payment.setProductsUsed(rs.getInt("ProductosUtilizados"));
                payment.setMechanic(rs.getString("NombreMecanico"));
                payment.setStartDate(rs.getDate("fecha_inicio"));
                payment.setEndDate(rs.getDate("fecha_fin"));
                payment.setStatus(rs.getString("status"));

                payments.add(payment);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return payments;
    }

    public BeanPayment getPayment(String rol, int historyId) {
        BeanPayment payment = new BeanPayment();
        List<BeanProduct> products = new ArrayList<>();

        if (!"cliente".equals(rol)){
            return payment;
        }

        try (
                Connection con = MySQLConnection.getConnection();
                PreparedStatement pstm = con.prepareStatement("SELECT * FROM productosUsados WHERE idHistorial = ?");
                PreparedStatement pstm2 = con.prepareStatement("SELECT * FROM ServicioDado WHERE idHistorial = ?");
                PreparedStatement pstm3 = con.prepareStatement("SELECT * FROM VistaHistorialServicios WHERE idHistorial = ?")
        ){

            pstm.setInt(1, historyId);
            pstm2.setInt(1, historyId);
            pstm3.setInt(1, historyId);
            ResultSet rs = pstm.executeQuery();

            while (rs.next()){
                BeanProduct product = new BeanProduct();

                product.setId(rs.getInt("idProducto"));
                product.setName(rs.getString("nombre"));
                product.setDescription(rs.getString("descripcion"));
                product.setPrice(rs.getFloat("precio"));
                product.setImgUrl(rs.getString("img_url"));
                product.setStock(rs.getInt("stock"));
                product.setUsed(rs.getInt("cantidad"));
                product.setTotalAmout(rs.getFloat("monto_total"));

                products.add(product);
            }
            payment.setProducts(products);

            ResultSet rs2 = pstm2.executeQuery();
            while (rs2.next()){
                BeanService service = new BeanService();
                service.setId(rs2.getLong("idServicio"));
                service.setName(rs2.getString("nombre"));
                service.setDescription(rs2.getString("descripcion"));
                service.setPrice(rs2.getFloat("precio"));

                payment.setService(service);
            }

            ResultSet rs3 = pstm3.executeQuery();
            while (rs3.next()){
                BeanVehicle vehicle = new BeanVehicle();
                vehicle.setPlates(rs3.getString("placas"));
                vehicle.setType(rs3.getString("tipo"));
                vehicle.setBrand(rs3.getString("marca"));
                vehicle.setModel(rs3.getString("modelo"));
                vehicle.setYear(rs3.getInt("anio"));
                vehicle.setColor(rs3.getString("color"));

                payment.setVehicle(vehicle);
                payment.setTotalAmount(rs3.getFloat("monto_total"));
                payment.setProductsUsed(rs3.getInt("ProductosUtilizados"));
                payment.setRfc(rs3.getString("rfc"));
                payment.setMechanic(rs.getString("NombreMecanico"));
                payment.setStartDate(rs.getDate("fecha_inicio"));
                payment.setEndDate(rs.getDate("fecha_fin"));
                payment.setStatus(rs.getString("status"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return payment;

    }
}

package com.motor.express.motorexpress.model;

import com.motor.express.motorexpress.utils.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DaoUser {


    public BeanUser getUser(String rfc, String rol) {
        BeanUser user = new BeanUser();

        String query = "";

        switch (rol) {
            case "caja":
                query = "SELECT * FROM cajas WHERE rfc = ? AND status = '1';";
            case "gerente":
                query = "SELECT * FROM gerentes WHERE rfc = ? AND status = '1';";
            case "asistente":
                query = "SELECT * FROM asistentes WHERE rfc = ? AND status = '1';";
            case "mecanico":
                query = "SELECT * FROM mecanicos WHERE rfc = ? AND status = '1';";
                break;
            default:
                query = "SELECT * FROM clientes WHERE rfc = ? AND status = '1';";
        }

        try (
                Connection con = MySQLConnection.getConnection();
                PreparedStatement pstm = con.prepareStatement(query);
        ){

            pstm.setString(1, rfc);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()){
                user.setRfc(rs.getString("rfc"));
                user.setNombre(rs.getString("nombre"));
                user.setApellidoPaterno(rs.getString("apellido_paterno"));
                user.setApellidoMaterno(rs.getString("apellido_materno"));
                user.setCorreo(rs.getString("correo"));
                user.setTelefono(rs.getString("telefono"));
                user.setEstado(rs.getString("estado"));
                user.setMunicipio(rs.getString("municipio"));
                user.setCodigoPostal(rs.getInt("codigo_postal"));
                user.setColonia(rs.getString("colonia"));
                user.setCalle(rs.getString("calle"));
                user.setNumero(rs.getInt("numero"));

                String statusStr =(rs.getString("status"));
                char status = statusStr.charAt(0);
                user.setStatus(status);

                user.setFechaRegistro(rs.getDate("fecha_registro"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}

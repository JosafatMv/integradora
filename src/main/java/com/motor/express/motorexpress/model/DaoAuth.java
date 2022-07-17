package com.motor.express.motorexpress.model;

import com.motor.express.motorexpress.utils.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DaoAuth {

    public BeanAuth loginAuth(BeanAuth userCredentials) {

        String role = userCredentials.getRol();
        String query = "";

        switch (role) {
            case "caja":
                query = "SELECT * FROM cajas WHERE correo = ? AND status = '1';";
            case "gerente":
                query = "SELECT * FROM gerentes WHERE correo = ? AND status = '1';";
            case "asistente":
                query = "SELECT * FROM asistentes WHERE correo = ? AND status = '1';";
            case "mecanico":
                query = "SELECT * FROM mecanicos WHERE correo = ? AND status = '1';";
                break;
            default:
                query = "SELECT * FROM clientes WHERE correo = ? AND status = '1';";
        }

        try
                (Connection con  = MySQLConnection.getConnection();
                    PreparedStatement pstm = con.prepareStatement(query);
                )
        {
            pstm.setString(1, userCredentials.getEmail());
            ResultSet rs = pstm.executeQuery();
            while (rs.next()){
                userCredentials.setName(rs.getString("nombre"));
                userCredentials.setApellidoPaterno(rs.getString("apellido_paterno"));
                userCredentials.setApellidoMaterno(rs.getString("apellido_materno"));
                userCredentials.setStoredPassword(rs.getString("contrasenia"));
                userCredentials.setRfc(rs.getString("rfc"));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return userCredentials;
    }

}

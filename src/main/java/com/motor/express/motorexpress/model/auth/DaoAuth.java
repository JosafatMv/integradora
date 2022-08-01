package com.motor.express.motorexpress.model.auth;

import com.motor.express.motorexpress.utils.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DaoAuth {

    public BeanAuth loginAuth(BeanAuth userCredentials) {

        String role = userCredentials.getRol();
        String query = "";

        String[] roles = new String[]{"cliente","asistente","caja","mecanico","gerente"};

        try
                (Connection con  = MySQLConnection.getConnection();
                    PreparedStatement pstm = con.prepareStatement("Call PaVerificarLogin(?,?,?);");
                )
        {
            pstm.setString(1, userCredentials.getPassword());
            pstm.setString(2, userCredentials.getEmail());

            for (int i=0;i<roles.length; i++){
                pstm.setString(3, roles[i]);
                ResultSet rs = pstm.executeQuery();
                while (rs.next()){
                    userCredentials.setName(rs.getString("nombre"));
                    userCredentials.setRfc(rs.getString("rfc"));
                    userCredentials.setRol(roles[i]);
                }

                if (userCredentials.getRfc() != null) break;
            }



        } catch(Exception e) {
            e.printStackTrace();
        }

        return userCredentials;
    }

}

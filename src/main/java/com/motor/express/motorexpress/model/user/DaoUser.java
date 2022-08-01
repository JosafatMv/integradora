package com.motor.express.motorexpress.model.user;

import com.motor.express.motorexpress.utils.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DaoUser {

    public List<BeanUser> getUsers(String rol) {
        List<BeanUser> users = new ArrayList<>();

        String query = "";

        switch (rol) {
            case "client":
                query = "SELECT * FROM VistaClientes WHERE status = '1';";
                break;
            case "cashier":
                query = "SELECT * FROM cajas WHERE status = '1';";
                break;
            case "manager":
                query = "SELECT * FROM gerentes WHERE status = '1';";
                break;
            case "attende":
                query = "SELECT * FROM asistentes WHERE status = '1';";
                break;
            case "mechanic":
                query = "SELECT * FROM mecanicos WHERE status = '1';";
                break;
            default:
                query = "SELECT * FROM clientes WHERE status = '1';";
                break;
        }

        try (
                Connection con = MySQLConnection.getConnection();
                PreparedStatement pstm = con.prepareStatement(query);
        ) {

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                BeanUser user = new BeanUser();
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

                String statusStr = (rs.getString("status"));
                char status = statusStr.charAt(0);
                user.setStatus(status);

                user.setNumCars(rs.getInt("numeroCarros"));

                users.add(user);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    public BeanUser getUser(String rfc, String rol) {
        BeanUser user = new BeanUser();

        String query = "";

        switch (rol) {
            case "cliente":
                query = "SELECT * FROM VistaClientes WHERE rfc = ? AND status = '1';";
                break;
            case "caja":
                query = "SELECT * FROM cajas WHERE rfc = ? AND  status = '1';";
                break;
            case "gerente":
                query = "SELECT * FROM gerentes WHERE rfc = ? AND  status = '1';";
                break;
            case "asistente":
                query = "SELECT * FROM asistentes WHERE rfc = ? AND  status = '1';";
                break;
            case "mecanico":
                query = "SELECT * FROM mecanicos WHERE rfc = ? AND  status = '1';";
                break;
            default:
                query = "SELECT * FROM clientes WHERE rfc = ? AND  status = '1';";
                break;
        }

        try (
                Connection con = MySQLConnection.getConnection();
                PreparedStatement pstm = con.prepareStatement(query);
        ) {

            pstm.setString(1, rfc);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
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

                String statusStr = (rs.getString("status"));
                char status = statusStr.charAt(0);
                user.setStatus(status);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean savePerson(BeanUser user, String role, String rfc) {
        boolean result = false;

        String query;

        switch (role) {
            case "cliente":
                query = "INSERT INTO clientes (name,age) VALUES(?,?)";
                break;
            case "caja":
                query = "INSERT INTO cajas (name,age) VALUES(?,?)";
                break;
            case "gerente":
                query = "INSERT INTO gerentes (name,age) VALUES(?,?)";
                break;
            case "asistente":
                query = "INSERT INTO asistentes (name,age) VALUES(?,?)";
                break;
            case "mecanico":
                query = "INSERT INTO mecanicos (name,age) VALUES(?,?);";
                break;
            default:
                query = "INSERT INTO clientes (name,age) VALUES(?,?);";
                break;
        }

        try
                (Connection con = MySQLConnection.getConnection();
                 PreparedStatement pstm = con.prepareStatement("CALL PaInsertarClientes(?,?,?,?,?,?,?,?,?,?,?,?,?,?);");

                ) {
            pstm.setString(1, user.getRfc());
            pstm.setString(2, user.getNombre());
            pstm.setString(3, user.getApellidoPaterno());
            pstm.setString(4, user.getApellidoMaterno());
            pstm.setString(5, user.getCorreo());
            pstm.setString(6, user.getContrasenia());
            pstm.setString(7, user.getTelefono());
            pstm.setString(8, user.getEstado());
            pstm.setString(9, user.getMunicipio());
            pstm.setInt(10, user.getCodigoPostal());
            pstm.setString(11, user.getColonia());
            pstm.setString(12, user.getCalle());
            pstm.setInt(13, user.getNumero());
            pstm.setString(14, rfc);
            result = pstm.executeUpdate() == 1;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}

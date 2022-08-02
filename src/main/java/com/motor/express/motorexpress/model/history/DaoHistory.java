package com.motor.express.motorexpress.model.history;

import com.motor.express.motorexpress.model.history.BeanHistory;
import com.motor.express.motorexpress.model.service.BeanService;
import com.motor.express.motorexpress.model.tracking.BeanTracking;
import com.motor.express.motorexpress.model.vehicle.BeanVehicle;
import com.motor.express.motorexpress.utils.MySQLConnection;
import com.motor.express.motorexpress.utils.StatusName;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class DaoHistory {
    public List<BeanHistory> getClientHistories(String rol, String rfc) {
        List<BeanHistory> histories = new ArrayList<>();

        if (!"cliente".equals(rol)) {
            return histories;
        }

        try (
                Connection con = MySQLConnection.getConnection();
                PreparedStatement pstm = con.prepareStatement("SELECT * FROM VistaHistoriales WHERE rfc = ?");
                PreparedStatement pstm2 = con.prepareStatement("SELECT * FROM UltimoStatus WHERE historiales_id = ?")

        ) {

            StatusName statusName = new StatusName();

            pstm.setString(1, rfc);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                BeanHistory history = new BeanHistory();
                BeanVehicle vehicle = new BeanVehicle();
                BeanService service = new BeanService();
                history.setRfc(rs.getString("rfc"));
                vehicle.setPlates(rs.getString("placas"));
                vehicle.setModel(rs.getString("modelo"));
                vehicle.setBrand(rs.getString("marca"));
                vehicle.setYear(rs.getInt("anio"));
                vehicle.setColor(rs.getString("color"));
                vehicle.setType(rs.getString("tipo"));

                service.setName(rs.getString("ServicioDado"));

                history.setVehicle(vehicle);
                history.setService(service);

                history.setHistoryId(rs.getInt("idHistorial"));


                pstm2.setInt(1, history.getHistoryId());
                ResultSet rs2 = pstm2.executeQuery();
                int idStatus = 0;
                while (rs2.next()) {
                    idStatus = rs2.getInt("statusId");
                    history.setLastUpdateDate(rs2.getDate("fechaActualizacion"));
                    history.setLastUpdateTime(rs2.getTime("fechaActualizacion"));
                }
                history.setStatus(statusName.getStatusName(idStatus));

                histories.add(history);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return histories;
    }

    public BeanHistory getHistory(String rol, int historyId) {
        BeanHistory history = new BeanHistory();

        if (!"cliente".equals(rol)) {
            return history;
        }

        try (
                Connection con = MySQLConnection.getConnection();
                PreparedStatement pstm = con.prepareStatement("SELECT * FROM VistaHistoriales WHERE idHistorial = ?");
                PreparedStatement pstm2 = con.prepareStatement("SELECT * FROM VistaSeguimientoHistorial WHERE historiales_id = ? order by status_id desc");
                PreparedStatement pstm3 = con.prepareStatement("SELECT * FROM UltimoStatus WHERE historiales_id = ?");


        ) {

            StatusName statusName = new StatusName();

            pstm.setInt(1, historyId);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                BeanVehicle vehicle = new BeanVehicle();
                BeanService service = new BeanService();
                history.setRfc(rs.getString("rfc"));
                vehicle.setPlates(rs.getString("placas"));
                vehicle.setModel(rs.getString("modelo"));
                vehicle.setBrand(rs.getString("marca"));
                vehicle.setYear(rs.getInt("anio"));
                vehicle.setColor(rs.getString("color"));
                vehicle.setType(rs.getString("tipo"));

                service.setName(rs.getString("ServicioDado"));

                history.setVehicle(vehicle);
                history.setService(service);

                history.setHistoryId(rs.getInt("idHistorial"));

                List<BeanTracking> trackings = new ArrayList<>();
                pstm2.setInt(1, history.getHistoryId());
                ResultSet rs2 = pstm2.executeQuery();

                while (rs2.next()) {
                    BeanTracking tracking = new BeanTracking();
                    int idStatus = 0;
                    idStatus = rs2.getInt("status_id");
                    tracking.setLastUpdateDate(rs2.getDate("fecha_actualizacion"));
                    tracking.setLastUpdateTime(rs2.getTime("fecha_actualizacion"));
                    tracking.setStatusName(statusName.getStatusName(idStatus));

                    trackings.add(tracking);
                }
                history.setTrackings(trackings);

                pstm3.setInt(1, history.getHistoryId());
                ResultSet rs3 = pstm3.executeQuery();
                int idStatus = 0;
                while (rs3.next()) {
                    idStatus = rs3.getInt("statusId");
                }
                history.setStatus(statusName.getStatusName(idStatus));


            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return history;
    }

    public List<BeanHistory> getHistories() {
        List<BeanHistory> histories = new ArrayList<>();

        try (
                Connection con = MySQLConnection.getConnection();
                PreparedStatement pstm = con.prepareStatement("SELECT * FROM VistaCarrosHistoriales");
                PreparedStatement pstm2 = con.prepareStatement("SELECT * FROM UltimoStatus WHERE historiales_id = ?");
        ) {

            StatusName statusName = new StatusName();

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                BeanHistory history = new BeanHistory();
                BeanVehicle vehicle = new BeanVehicle();
                history.setRfc(rs.getString("rfc"));
                vehicle.setPlates(rs.getString("placas"));
                vehicle.setModel(rs.getString("modelo"));
                vehicle.setBrand(rs.getString("marca"));
                vehicle.setYear(rs.getInt("anio"));
                vehicle.setColor(rs.getString("color"));
                vehicle.setType(rs.getString("tipo"));

                history.setVehicle(vehicle);
                history.setHistoryId(rs.getInt("idHistorial"));

                if (history.getHistoryId() != 0) {
                    pstm2.setInt(1, history.getHistoryId());
                    ResultSet rs2 = pstm2.executeQuery();
                    int idStatus = 0;
                    while (rs2.next()) {
                        idStatus = rs2.getInt("statusId");
                    }
                    history.setStatus(statusName.getStatusName(idStatus));
                }

                if (!Objects.equals(history.getStatus(), "Finalizado")) {
                    histories.add(history);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return histories;
    }

    public boolean startService(String rfcMechanic, String plates) {
        boolean result = false;

        try
                (Connection con = MySQLConnection.getConnection();
                 PreparedStatement pstm = con.prepareStatement("Call PAInsertarHistorial(?,?);");
                ) {
            pstm.setString(1, plates);
            pstm.setString(2, rfcMechanic);

            result = pstm.executeUpdate() == 1;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public boolean endService(int historyId) {
        boolean result = false;

        try
                (Connection con = MySQLConnection.getConnection();
                 PreparedStatement pstm = con.prepareStatement("Call PaCambiarStatus('Finalizado', ?);");
                ) {
            pstm.setInt(1, historyId);

            result = pstm.executeUpdate() == 1;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}

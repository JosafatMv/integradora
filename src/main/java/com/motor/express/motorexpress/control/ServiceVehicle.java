package com.motor.express.motorexpress.control;

import com.motor.express.motorexpress.model.BeanVehicle;
import com.motor.express.motorexpress.model.DaoVehicle;

import java.util.List;

public class ServiceVehicle {
    public List<BeanVehicle> getClientVehicles(String rfc, String rol) {
        DaoVehicle vehicleDao = new DaoVehicle();
        List<BeanVehicle> vehicles = vehicleDao.getClientVehicles(rfc,rol);

        return vehicles;
    }
}

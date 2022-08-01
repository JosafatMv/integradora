package com.motor.express.motorexpress.control.vehicle;

import com.motor.express.motorexpress.model.vehicle.BeanVehicle;
import com.motor.express.motorexpress.model.vehicle.DaoVehicle;

import java.util.List;

public class ServiceVehicle {
    public List<BeanVehicle> getClientVehicles(String rfc, String rol) {
        DaoVehicle vehicleDao = new DaoVehicle();
        List<BeanVehicle> vehicles = vehicleDao.getClientVehicles(rfc,rol);

        return vehicles;
    }

    public boolean saveVehicle(BeanVehicle vehicle) {
        return new DaoVehicle().saveVehicle(vehicle);
    }
}

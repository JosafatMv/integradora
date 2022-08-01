package com.motor.express.motorexpress.control.client;

import com.motor.express.motorexpress.model.client.DaoClient;
import com.motor.express.motorexpress.model.vehicle.BeanVehicle;

import java.util.List;

public class ServiceClient {

    public List<BeanVehicle> getClientVehicles(String rfc) {
        DaoClient daoClient = new DaoClient();
        List<BeanVehicle> vehicles = daoClient.getClientVehicles(rfc);

        return vehicles;
    }
}

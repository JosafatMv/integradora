package com.motor.express.motorexpress.control.service;

import com.motor.express.motorexpress.model.service.BeanService;
import com.motor.express.motorexpress.model.service.DaoService;

import java.util.List;

public class ServiceService {
    public static List<BeanService> getServices() {
        DaoService daoService = new DaoService();
        List<BeanService> services = daoService.getServices();

        return services;
    }
}

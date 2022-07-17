package com.motor.express.motorexpress.control;

import com.motor.express.motorexpress.model.BeanUser;
import com.motor.express.motorexpress.model.DaoUser;

public class ServiceUser {

    public BeanUser getUser(String rfc, String rol) {

        DaoUser userDao = new DaoUser();
        BeanUser user = userDao.getUser(rfc,rol);
        return user;
    }
}

package com.motor.express.motorexpress.control.user;

import com.motor.express.motorexpress.model.user.BeanUser;
import com.motor.express.motorexpress.model.user.DaoUser;

import java.util.List;

public class ServiceUser {

    public List<BeanUser> getUsers(String role) {

        DaoUser userDao = new DaoUser();
        List<BeanUser>  users = userDao.getUsers(role);
        return users;
    }

    public BeanUser getUser(String rfc, String role) {

        DaoUser userDao = new DaoUser();
        BeanUser user = userDao.getUser(rfc,role);
        return user;
    }


    public boolean saveUser(BeanUser user, String role, String rfc) {

        return new DaoUser().savePerson(user,role,rfc);
    }
}

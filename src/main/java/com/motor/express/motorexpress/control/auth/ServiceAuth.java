package com.motor.express.motorexpress.control.auth;

import com.motor.express.motorexpress.model.auth.BeanAuth;
import com.motor.express.motorexpress.model.auth.DaoAuth;

public class ServiceAuth {

    public BeanAuth loginAuth(BeanAuth userCredentials) {
        DaoAuth auth = new DaoAuth();

        return auth.loginAuth(userCredentials);
    }

}

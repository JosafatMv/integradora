package com.motor.express.motorexpress.control;

import com.motor.express.motorexpress.model.BeanAuth;
import com.motor.express.motorexpress.model.DaoAuth;

public class ServiceAuth {

    public BeanAuth loginAuth(BeanAuth userCredentials) {
        DaoAuth auth = new DaoAuth();

        return auth.loginAuth(userCredentials);
    }

}

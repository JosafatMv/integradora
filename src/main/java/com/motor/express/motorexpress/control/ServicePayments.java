package com.motor.express.motorexpress.control;

import com.motor.express.motorexpress.model.BeanPayment;
import com.motor.express.motorexpress.model.DaoPayment;

import java.util.List;

public class ServicePayments {
    public List<BeanPayment> getClientPayments(String rfc, String rol){
        DaoPayment paymentsDao = new DaoPayment();
        List<BeanPayment> payments = paymentsDao.getClientPayments(rfc,rol);
        return payments;
    }

    public BeanPayment getPayment(String rol, int historyId) {
        DaoPayment paymentsDao = new DaoPayment();
        BeanPayment payment = paymentsDao.getPayment(rol,historyId);
        return payment;
    }
}

package com.motor.express.motorexpress.control.payment;

import com.motor.express.motorexpress.model.payment.BeanPayment;
import com.motor.express.motorexpress.model.payment.DaoPayment;

import java.util.List;

public class ServicePayments {
    public List<BeanPayment> getClientPayments(String rfc, String rol){
        DaoPayment paymentsDao = new DaoPayment();
        return paymentsDao.getClientPayments(rfc,rol);
    }

    public BeanPayment getPayment(String rol, int historyId) {
        DaoPayment paymentsDao = new DaoPayment();
        return paymentsDao.getPayment(rol,historyId);
    }

    public List<BeanPayment> getPayments() {
        DaoPayment paymentsDao = new DaoPayment();
        return paymentsDao.getPayments();
    }
}

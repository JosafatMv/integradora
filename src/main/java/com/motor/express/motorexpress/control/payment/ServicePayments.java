package com.motor.express.motorexpress.control.payment;

import com.motor.express.motorexpress.model.payment.BeanPayment;
import com.motor.express.motorexpress.model.payment.DaoPayment;

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

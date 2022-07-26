package com.motor.express.motorexpress.control;

import com.motor.express.motorexpress.model.BeanHistory;
import com.motor.express.motorexpress.model.DaoHistory;

import java.util.ArrayList;
import java.util.List;

public class ServiceHistory {
    public List<BeanHistory> getClientHistories(String rol, String rfc) {
        List<BeanHistory> histories = new ArrayList<>();

        DaoHistory historyDao = new DaoHistory();
        histories = historyDao.getClientHistories(rol, rfc);

        return  histories;

    }
}

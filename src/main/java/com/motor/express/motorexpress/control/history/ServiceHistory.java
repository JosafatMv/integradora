package com.motor.express.motorexpress.control.history;

import com.motor.express.motorexpress.model.history.BeanHistory;
import com.motor.express.motorexpress.model.history.DaoHistory;

import java.util.ArrayList;
import java.util.List;

public class ServiceHistory {
    public List<BeanHistory> getClientHistories(String rol, String rfc) {
        List<BeanHistory> histories = new ArrayList<>();

        DaoHistory historyDao = new DaoHistory();
        histories = historyDao.getClientHistories(rol, rfc);

        return  histories;

    }

    public BeanHistory getHistory(String rol, int historyId) {
        DaoHistory daoHistory = new DaoHistory();
        return daoHistory.getHistory(rol,historyId);
    }

    public List<BeanHistory> getHistories() {
        DaoHistory daoHistory = new DaoHistory();
        return daoHistory.getHistories();
    }
}

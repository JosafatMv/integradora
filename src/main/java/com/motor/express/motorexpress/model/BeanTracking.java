package com.motor.express.motorexpress.model;

import java.util.Date;

public class BeanTracking {
    private int statusId;
    private Date lastUpdate;
    private String statusName;

    public BeanTracking() {
    }

    public BeanTracking(int statusId, Date lastUpdate, String statusName) {
        this.statusId = statusId;
        this.lastUpdate = lastUpdate;
        this.statusName = statusName;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public Date getLastUpdate() {
        return lastUpdate;
    }

    public void setLastUpdate(Date lastUpdate) {
        this.lastUpdate = lastUpdate;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }
}

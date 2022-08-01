package com.motor.express.motorexpress.model.tracking;

import java.sql.Time;
import java.util.Date;

public class BeanTracking {
    private int statusId;
    private Date lastUpdateDate;
    private Time lastUpdateTime;
    private String statusName;

    public BeanTracking() {
    }

    public BeanTracking(int statusId, Date lastUpdateDate, Time lastUpdateTime, String statusName) {
        this.statusId = statusId;
        this.lastUpdateDate = lastUpdateDate;
        this.lastUpdateTime = lastUpdateTime;
        this.statusName = statusName;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public Date getLastUpdateDate() {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(Date lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }

    public Time getLastUpdateTime() {
        return lastUpdateTime;
    }

    public void setLastUpdateTime(Time lastUpdateTime) {
        this.lastUpdateTime = lastUpdateTime;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }
}

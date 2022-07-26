package com.motor.express.motorexpress.model;

import java.sql.Time;
import java.util.Date;
import java.util.List;

public class BeanHistory {
    private String rfc;
    private BeanVehicle vehicle;
    private BeanService service;
    private String historyId;
    private Date lastUpdateDate;
    private Time lastUpdateTime;
    private String status;
    private List<BeanTracking> trackings;

    public BeanHistory() {
    }

    public BeanHistory(String rfc, BeanVehicle vehicle, BeanService service, String historyId, Date lastUpdateDate, Time lastUpdateTime, String status, List<BeanTracking> trackings) {
        this.rfc = rfc;
        this.vehicle = vehicle;
        this.service = service;
        this.historyId = historyId;
        this.lastUpdateDate = lastUpdateDate;
        this.lastUpdateTime = lastUpdateTime;
        this.status = status;
        this.trackings = trackings;
    }

    public String getRfc() {
        return rfc;
    }

    public void setRfc(String rfc) {
        this.rfc = rfc;
    }

    public BeanVehicle getVehicle() {
        return vehicle;
    }

    public void setVehicle(BeanVehicle vehicle) {
        this.vehicle = vehicle;
    }

    public BeanService getService() {
        return service;
    }

    public void setService(BeanService service) {
        this.service = service;
    }

    public String getHistoryId() {
        return historyId;
    }

    public void setHistoryId(String historyId) {
        this.historyId = historyId;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<BeanTracking> getTrackings() {
        return trackings;
    }

    public void setTrackings(List<BeanTracking> trackings) {
        this.trackings = trackings;
    }
}

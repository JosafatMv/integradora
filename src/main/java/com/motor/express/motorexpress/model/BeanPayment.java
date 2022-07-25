package com.motor.express.motorexpress.model;

import java.util.Date;
import java.util.List;

public class BeanPayment {

    private String rfc;
    private BeanVehicle vehicle;
    private float totalAmount;
    private int productsUsed;
    private List<BeanProduct> products;
    private BeanService service;
    private String mechanic;
    private Date startDate;
    private Date endDate;
    private String status;
    private String historyId;

    public BeanPayment() {
    }

    public BeanPayment(String rfc, BeanVehicle vehicle, float totalAmount, int productsUsed, List<BeanProduct> products, BeanService service, String mechanic, Date startDate, Date endDate, String status, String historyId) {
        this.rfc = rfc;
        this.vehicle = vehicle;
        this.totalAmount = totalAmount;
        this.productsUsed = productsUsed;
        this.products = products;
        this.service = service;
        this.mechanic = mechanic;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
        this.historyId = historyId;
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

    public float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(float totalAmount) {
        this.totalAmount = totalAmount;
    }

    public int getProductsUsed() {
        return productsUsed;
    }

    public void setProductsUsed(int productsUsed) {
        this.productsUsed = productsUsed;
    }

    public List<BeanProduct> getProducts() {
        return products;
    }

    public void setProducts(List<BeanProduct> products) {
        this.products = products;
    }

    public BeanService getService() {
        return service;
    }

    public void setService(BeanService service) {
        this.service = service;
    }

    public String getMechanic() {
        return mechanic;
    }

    public void setMechanic(String mechanic) {
        this.mechanic = mechanic;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getHistoryId() {
        return historyId;
    }

    public void setHistoryId(String historyId) {
        this.historyId = historyId;
    }
}

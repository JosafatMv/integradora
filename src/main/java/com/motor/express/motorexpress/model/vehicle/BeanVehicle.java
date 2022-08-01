package com.motor.express.motorexpress.model.vehicle;

public class BeanVehicle {
    private String plates;
    private String model;
    private String brand;
    private int year;
    private String color;
    private String type;
    private String engineNumber;
    private String serialNumber;
    private String ownerRfc;
    private String lastStatus;

    public BeanVehicle() {
    }

    public BeanVehicle(String plates, String model, String brand, int year, String color, String type, String engineNumber, String serialNumber, String ownerRfc, String lastStatus) {
        this.plates = plates;
        this.model = model;
        this.brand = brand;
        this.year = year;
        this.color = color;
        this.type = type;
        this.engineNumber = engineNumber;
        this.serialNumber = serialNumber;
        this.ownerRfc = ownerRfc;
        this.lastStatus = lastStatus;
    }

    public String getPlates() {
        return plates;
    }

    public void setPlates(String plates) {
        this.plates = plates;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getEngineNumber() {
        return engineNumber;
    }

    public void setEngineNumber(String engineNumber) {
        this.engineNumber = engineNumber;
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public String getOwnerRfc() {
        return ownerRfc;
    }

    public void setOwnerRfc(String ownerRfc) {
        this.ownerRfc = ownerRfc;
    }

    public String getLastStatus() {
        return lastStatus;
    }

    public void setLastStatus(String lastStatus) {
        this.lastStatus = lastStatus;
    }
}

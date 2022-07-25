package com.motor.express.motorexpress.model;

public class BeanProduct {
    private long id;
    private String name;
    private float price;
    private String description;
    private String imgUrl;
    private int stock;
    private int used;
    private float totalAmout;


    public BeanProduct() {
    }

    public BeanProduct(long id, String name, float price, String description, String imgUrl, int stock, int used, float totalAmout) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.imgUrl = imgUrl;
        this.stock = stock;
        this.used = used;
        this.totalAmout = totalAmout;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getUsed() {
        return used;
    }

    public void setUsed(int used) {
        this.used = used;
    }

    public float getTotalAmout() {
        return totalAmout;
    }

    public void setTotalAmout(float montoTotal) {
        this.totalAmout = montoTotal;
    }
}

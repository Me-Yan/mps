package com.me.mps.dto;

import java.io.Serializable;

/**
 * Created by Me on 2017/12/15.
 */
public class OrderItemDTO implements Serializable {

    private static final long serialVersionUID = 689526139468340488L;

    private Integer orderItemId;
    private Integer orderId;
    private Integer productId;
    private Double totalN;
    private Integer countN;
    private Double priceN;
    private String activeC;

    // for view
    private String imagePath;
    private String productName;

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Integer getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(Integer orderItemId) {
        this.orderItemId = orderItemId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Double getTotalN() {
        return totalN;
    }

    public void setTotalN(Double totalN) {
        this.totalN = totalN;
    }

    public Integer getCountN() {
        return countN;
    }

    public void setCountN(Integer countN) {
        this.countN = countN;
    }

    public Double getPriceN() {
        return priceN;
    }

    public void setPriceN(Double priceN) {
        this.priceN = priceN;
    }

    public String getActiveC() {
        return activeC;
    }

    public void setActiveC(String activeC) {
        this.activeC = activeC;
    }
}

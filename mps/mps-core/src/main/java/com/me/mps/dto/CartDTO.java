package com.me.mps.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Me on 2017/12/14.
 */
public class CartDTO implements Serializable{

    private static final long serialVersionUID = 2047004355419365600L;

    private Integer cartId;
    private Integer userId;
    private Integer productId;
    private Double totalN;
    private Integer countN;
    private String activeC;
    private String crtByM;
    private Date crtOnDt;

    // for view
    private String productName;
    private Double price;
    private String imagePath;
    private Integer leftCount;

    public Integer getLeftCount() {
        return leftCount;
    }

    public void setLeftCount(Integer leftCount) {
        this.leftCount = leftCount;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getActiveC() {
        return activeC;
    }

    public void setActiveC(String activeC) {
        this.activeC = activeC;
    }

    public String getCrtByM() {
        return crtByM;
    }

    public void setCrtByM(String crtByM) {
        this.crtByM = crtByM;
    }

    public Date getCrtOnDt() {
        return crtOnDt;
    }

    public void setCrtOnDt(Date crtOnDt) {
        this.crtOnDt = crtOnDt;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
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
}

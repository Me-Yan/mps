package com.me.mps.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by Me on 2017/12/15.
 */
public class OrderDTO implements Serializable {

    private static final long serialVersionUID = -3657680438741985242L;

    private Integer orderId;
    private Integer userId;
    private Double totalN;
    private String numberX;
    private String statusX;
    private String crtByM;
    private Date crtOnDt;

    private List<OrderItemDTO> orderItemDTOList;

    // for view
    private String companyName;
    private String username;
    private String createDate;

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public List<OrderItemDTO> getOrderItemDTOList() {
        return orderItemDTOList;
    }

    public void setOrderItemDTOList(List<OrderItemDTO> orderItemDTOList) {
        this.orderItemDTOList = orderItemDTOList;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Double getTotalN() {
        return totalN;
    }

    public void setTotalN(Double totalN) {
        this.totalN = totalN;
    }

    public String getNumberX() {
        return numberX;
    }

    public void setNumberX(String numberX) {
        this.numberX = numberX;
    }

    public String getStatusX() {
        return statusX;
    }

    public void setStatusX(String statusX) {
        this.statusX = statusX;
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
}

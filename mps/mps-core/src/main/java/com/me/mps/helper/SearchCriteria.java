package com.me.mps.helper;

import java.io.Serializable;

/**
 * Created by Me on 2017/12/10.
 */
public class SearchCriteria implements Serializable {

    private static final long serialVersionUID = -8952367503407664282L;

    private Integer categoryId;
    private Integer categorySecondId;
    private PageNation pageNation;

    public PageNation getPageNation() {
        return pageNation;
    }

    public void setPageNation(PageNation pageNation) {
        this.pageNation = pageNation;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getCategorySecondId() {
        return categorySecondId;
    }

    public void setCategorySecondId(Integer categorySecondId) {
        this.categorySecondId = categorySecondId;
    }
}

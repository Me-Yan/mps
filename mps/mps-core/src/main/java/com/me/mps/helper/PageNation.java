package com.me.mps.helper;

import java.io.Serializable;

/**
 * Created by Me on 2017/12/13.
 */
public class PageNation implements Serializable {

    private static final long serialVersionUID = -311734828506547488L;

    private int total;
    private int limit;
    private int begin;
    private int curPage;
    private int totalPage;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getBegin() {
        return begin;
    }

    public void setBegin(int begin) {
        this.begin = begin;
    }

    public int getCurPage() {
        return curPage;
    }

    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
}

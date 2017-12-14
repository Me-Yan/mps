package com.me.mps.controller;

import com.me.mps.dto.UserDTO;
import com.me.mps.helper.Constants;
import com.me.mps.helper.PageNation;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * Created by Me on 2017/12/4.
 */
public class BaseController {

    private Logger logger = Logger.getLogger(BaseController.class);

    public UserDTO getUserInfo() {
        logger.debug("Execute Method getUserInfo...");

        HttpSession session = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest().getSession();

        UserDTO user = (UserDTO) session.getAttribute(Constants.USER.SESSION_USER);

        UserDTO tempUser = new UserDTO();
        tempUser.setUserId(1);
        tempUser.setUsernameM("Me");
        tempUser.setRealNameM("严杨鸿");
        tempUser.setPasswordX("123456");
        tempUser.setSexX("男");
        tempUser.setAgeN(23);
        tempUser.setEmailX("875649210@qq.com");
        tempUser.setPhoneX("18380448173");
        tempUser.setCompanyId(1);
        tempUser.setAmountN(0d);
        tempUser.setAuthorityX(Constants.AUTHORITY.INTERNET);
        tempUser.setCrtByM("Admin");
        tempUser.setCrtOnDt(new Date());

        return tempUser;
    }

    public PageNation getPageNationInfo(int total, HttpServletRequest request) {
        logger.debug("Execute Method getPageNationInfo...");
        PageNation pageNation = new PageNation();

        int begin = 0;
        int limit = 12;
        int pageIndex = 0;
        int totalPage = 0;

        if (StringUtils.isNotBlank(request.getParameter("curPage"))) {
            pageIndex = Integer.parseInt(request.getParameter("curPage")) - 1;
        }
        begin = pageIndex * limit;
        totalPage = total%limit!=0?((total/limit)+1):(total/limit);
        totalPage = totalPage==0?1:totalPage;

        pageNation.setTotal(total);
        pageNation.setBegin(begin);
        pageNation.setLimit(limit);
        pageNation.setCurPage(pageIndex+1);
        pageNation.setTotalPage(totalPage);

        return pageNation;
    }
}

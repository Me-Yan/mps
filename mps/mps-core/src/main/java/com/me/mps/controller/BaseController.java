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

        return user;
    }

    public PageNation getPageNationInfo(int total, HttpServletRequest request, int limit) {
        logger.debug("Execute Method getPageNationInfo...");
        PageNation pageNation = new PageNation();

        int begin = 0;
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

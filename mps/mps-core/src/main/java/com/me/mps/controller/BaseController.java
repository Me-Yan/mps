package com.me.mps.controller;

import com.me.mps.dto.UserDTO;
import com.me.mps.helper.Constants;
import org.apache.log4j.Logger;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;

/**
 * Created by Me on 2017/12/4.
 */
public class BaseController {

    private Logger logger = Logger.getLogger(BaseController.class);

    public UserDTO getUserInfo() {
        logger.debug("Execute Method getUserInfo...");

        HttpSession session = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest().getSession();

        UserDTO user = (UserDTO) session.getAttribute(Constants.USER.USER_INFO);

        return user;
    }
}

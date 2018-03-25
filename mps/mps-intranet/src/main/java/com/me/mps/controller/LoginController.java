package com.me.mps.controller;

import com.me.mps.dto.UserDTO;
import com.me.mps.helper.Constants;
import com.me.mps.service.UserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 登录管理
 */
@Controller
public class LoginController extends BaseController {

    private Logger logger= Logger.getLogger(LoginController.class);

    @Autowired
    private UserService userService;

    /**
     * 用户登录时，输入信息错误回到登录页面，正确则进入主页
     * @param userDTO
     * @param session
     * @return
     */
    @RequestMapping("/login")
    public ModelAndView login(UserDTO userDTO, HttpSession session) {
        logger.debug("Execute Method login...");
        ModelAndView model = new ModelAndView("login");

        if (StringUtils.isNotBlank(userDTO.getUsernameM())&&StringUtils.isNotBlank(userDTO.getPasswordX())) {
            userDTO.setPasswordX(DigestUtils.md5Hex(userDTO.getPasswordX()));

            UserDTO matchUser = userService.matchUserForIntranetLogin(userDTO);

            if (matchUser!=null) {
                session.setAttribute(Constants.USER.SESSION_USER, matchUser);

                return new ModelAndView("redirect:/home");
            } else {
                model.addObject("msg", "fail");
            }
        }

        return model;
    }

    /**
     * 退出登录，并清空session中的用户信息
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession session) {
        logger.debug("Execute Method login...");

        session.removeAttribute(Constants.USER.SESSION_USER);

        return new ModelAndView("login");
    }
}

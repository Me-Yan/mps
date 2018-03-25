package com.me.mps.controller;

import com.me.mps.dto.UserDTO;
import com.me.mps.helper.Constants;
import com.me.mps.service.UserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * 管理用户登录
 */
@Controller
public class LoginController extends BaseController {

    private Logger logger = Logger.getLogger(ProductController.class);

    @Autowired
    private UserService userService;

    /**
     * 访问登录页面
     * 如果直接请求登录，则直接进入页面；如果输入登录信息，验证失败重新登录，验证成功则直接进入商品列表页面
     * 用户信息放入session中
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

            UserDTO matchUser = userService.matchUserForInternetLogin(userDTO);

            if (matchUser!=null) {
                session.setAttribute(Constants.USER.SESSION_USER, matchUser);

                return new ModelAndView("redirect:/product/listProduct");
            } else {
                model.addObject("msg", "fail");
            }
        }

        return model;
    }

    /**
     * 退出登录
     * 用户请求退出，则清空session中的用户信息
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

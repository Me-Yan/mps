package com.me.mps.controller;

import com.me.mps.dto.UserDTO;
import com.me.mps.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Me on 2017/12/4.
 */
@Controller
@RequestMapping("user")
public class UserController extends BaseController {

    private Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @RequestMapping("/listUser")
    public ModelAndView listUser() {
        logger.debug("Execute Method listUser...");

        return new ModelAndView("user");
    }

    @RequestMapping("/listUserData")
    @ResponseBody
    public List<UserDTO> listUserData() {
        logger.debug("Execute Method listUserData...");

        return userService.listUser();
    }
}

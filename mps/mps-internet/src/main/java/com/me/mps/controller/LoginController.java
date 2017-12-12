package com.me.mps.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Me on 2017/12/12.
 */
@Controller
@RequestMapping("login")
public class LoginController extends BaseController {

    private Logger logger = Logger.getLogger(ProductController.class);

    @RequestMapping("/login")
    public ModelAndView loginPage() {
        logger.debug("Execute Method loginPage...");

        return new ModelAndView("login");
    }
}

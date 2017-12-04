package com.me.mps.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Me on 2017/12/4.
 */
@Controller
public class HomeController extends BaseController {

    private Logger logger = Logger.getLogger(HomeController.class);

    @RequestMapping("/home")
    public ModelAndView adminHome() {
        logger.debug("Execute Method adminHome...");

        return new ModelAndView("index");
    }
}

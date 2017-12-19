package com.me.mps.controller;

import com.me.mps.dto.OrderDTO;
import com.me.mps.service.OrderService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Me on 2017/12/20.
 */
@Controller
@RequestMapping("main")
public class MainController extends BaseController {

    private Logger logger = Logger.getLogger(MainController.class);

    @Autowired
    private OrderService orderService;

    @RequestMapping("/page")
    public ModelAndView mainPage() {
        logger.debug("Execute Method mainPage...");
        ModelAndView model = new ModelAndView("mainPage");

        int dayCount = orderService.countOrderOneDay();
        Double amountCount = orderService.countAmountOneDay();
        amountCount = amountCount==null?0:amountCount;
        int allCount = orderService.countAllOrder();
        Double allAmount = orderService.countAllAmountOneDay();
        allAmount = allAmount==null?0:allAmount;
        List<OrderDTO> orderDTOList = orderService.listRecentOrder();

        model.addObject("dayCount", dayCount);
        model.addObject("amountCount", amountCount);
        model.addObject("allCount", allCount);
        model.addObject("allAmount", allAmount);
        model.addObject("orderDTOList", orderDTOList);

        return model;
    }
}

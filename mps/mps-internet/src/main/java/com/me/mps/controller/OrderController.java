package com.me.mps.controller;

import com.me.mps.dto.OrderDTO;
import com.me.mps.helper.Constants;
import com.me.mps.helper.Helper;
import com.me.mps.service.OrderService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;

/**
 * Created by Me on 2017/12/15.
 */
@Controller
@RequestMapping("order")
public class OrderController extends BaseController {

    private Logger logger = Logger.getLogger(OrderController.class);

    @Autowired
    private OrderService orderService;

    @RequestMapping("/add")
    public ModelAndView add(@ModelAttribute("orderForm") OrderDTO orderDTO, RedirectAttributes redirectAttributes) {
        logger.debug("Execute Method add");
        ModelAndView model = new ModelAndView("redirect:/order/pay");

        orderDTO.setUserId(getUserInfo().getUserId());
        orderDTO.setNumberX(Helper.generateOrderNumber());
        orderDTO.setStatusX(Constants.ORDER_STATUS.PENDING);
        orderDTO.setCrtByM(getUserInfo().getUsernameM());
        orderDTO.setCrtOnDt(new Date());

        orderService.saveOrder(orderDTO);

        redirectAttributes.addFlashAttribute("orderId", orderDTO.getOrderId());

        return model;
    }

    @RequestMapping("/pay")
    public ModelAndView pay(@ModelAttribute("orderId") Integer orderId) {
        logger.debug("Execute Method pay");
        ModelAndView model = new ModelAndView("payOrder");

        if (orderId==null) {
            return new ModelAndView("redirect:/product/listProduct");
        }

        OrderDTO orderDTO = orderService.getOrderByOrderId(orderId);

        model.addObject("orderDTO", orderDTO);

        return model;
    }
}

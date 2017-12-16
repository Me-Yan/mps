package com.me.mps.controller;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.me.mps.dto.OrderDTO;
import com.me.mps.dto.OrderItemDTO;
import com.me.mps.dto.UserDTO;
import com.me.mps.helper.Constants;
import com.me.mps.helper.Helper;
import com.me.mps.helper.PageNation;
import com.me.mps.helper.SearchCriteria;
import com.me.mps.service.OrderService;
import com.me.mps.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Me on 2017/12/15.
 */
@Controller
@RequestMapping("order")
public class OrderController extends BaseController {

    private Logger logger = Logger.getLogger(OrderController.class);

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;

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

    @RequestMapping("/confirmPay")
    @ResponseBody
    public Map<String, Object> confirmPay(Double totalN, Integer orderId) {
        logger.debug("Execute Method confirmPay");
        Map<String, Object> model = Maps.newHashMap();

        if (totalN==null) {
            model.put("msg", "fail");
        }

        UserDTO userDTO = userService.getUserByUserId(getUserInfo().getUserId());

        if (totalN>userDTO.getAmountN()) {
            model.put("msg", "fail");
        } else {
            userDTO.setAmountN(userDTO.getAmountN()-totalN);

            OrderDTO orderDTO = new OrderDTO();
            orderDTO.setOrderId(orderId);
            orderDTO.setStatusX(Constants.ORDER_STATUS.PAYED);

            orderService.confirmPay(orderDTO, userDTO);

            model.put("msg", "success");
        }

        return model;
    }

    @RequestMapping("/paySuccess")
    public ModelAndView paySuccess() {
        logger.debug("Execute Method paySuccess");

        return new ModelAndView("paySuccess");
    }

    @RequestMapping("/listOrder")
    public ModelAndView listOrder(SearchCriteria searchCriteria, HttpServletRequest request) {
        logger.debug("Execute Method listOrder...");
        ModelAndView model = new ModelAndView("listOrder");

        searchCriteria.setUserId(getUserInfo().getUserId());
        int total = orderService.countOrderByCriteria(searchCriteria);

        PageNation pageNation = getPageNationInfo(total, request, 5);
        searchCriteria.setPageNation(pageNation);

        List<OrderDTO> orderDTOList = Lists.newArrayList();
        if (total!=0) {
            orderDTOList = orderService.listOrderByCriteria(searchCriteria);
        }

        model.addObject("orderDTOList", orderDTOList);
        model.addObject("pageNation", pageNation);
        model.addObject("position", "order");

        return model;
    }

    @RequestMapping("/cancelOrderItem")
    @ResponseBody
    public Map<String, Object> cancelOrderItem(Integer orderId,  Integer orderItemId) {
        logger.debug("Execute Method cancelOrderItem...");
        Map<String, Object> model = Maps.newHashMap();

        if (orderId==null || orderItemId==null) {
            model.put("msg", "fail");
        } else {
            OrderDTO orderDTO = orderService.getOrderByOrderId(orderId);
            OrderItemDTO orderItemDTO = orderService.getOrderItemByOrderItemId(orderItemId);
            UserDTO userDTO = userService.getUserByUserId(getUserInfo().getUserId());
            userDTO.setAmountN(userDTO.getAmountN()+orderItemDTO.getTotalN());
            orderDTO.setTotalN(orderDTO.getTotalN()-orderItemDTO.getTotalN());

            orderService.cancelOrderItem(orderDTO, orderItemDTO, userDTO);

            model.put("msg", "success");
        }

        return model;
    }
}

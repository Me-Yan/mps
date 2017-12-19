package com.me.mps.controller;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.me.mps.dto.OrderDTO;
import com.me.mps.helper.Constants;
import com.me.mps.helper.PageNation;
import com.me.mps.helper.SearchCriteria;
import com.me.mps.service.OrderService;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by Me on 2017/12/19.
 */
@Controller
@RequestMapping("order")
public class OrderController extends BaseController {

    private Logger logger = Logger.getLogger(OrderController.class);

    @Autowired
    private OrderService orderService;

    @RequestMapping("/listOrder")
    public ModelAndView listOrder(SearchCriteria searchCriteria, HttpServletRequest request) {
        logger.debug("Execute Method listOrder...");
        ModelAndView model = new ModelAndView("listOrder");

        int total = orderService.countOrderByCriteriaInIntranet(searchCriteria);
        PageNation pageNation = this.getPageNationInfo(total, request, 10);
        searchCriteria.setPageNation(pageNation);

        List<OrderDTO> orderDTOList = orderService.listOrderByCriteriaInIntranet(searchCriteria);

        model.addObject("orderDTOList", orderDTOList);
        model.addObject("orderStatusList", listOrderStatus());
        model.addObject("pageNation", pageNation);
        model.addObject("searchCriteria", searchCriteria);

        return model;
    }

    @RequestMapping("/updateOrderStatus")
    public ModelAndView updateOrderStatus(String outcome, Integer orderId) {
        logger.debug("Execute Method updateOrderStatus...");
        ModelAndView model = new ModelAndView("redirect:/order/listOrder");

        if (StringUtils.isNotBlank(outcome)&&orderId!=null) {
            OrderDTO orderDTO = new OrderDTO();
            orderDTO.setOrderId(orderId);
            orderDTO.setStatusX(outcome);

            orderService.updateOrderStatusByOrderId(orderDTO);
        }

        return model;
    }

    private List<String> listOrderStatus() {
        logger.debug("Execute Method listOrderStatus...");

        List<String> statusList = Lists.newArrayList();
        statusList.add(Constants.ORDER_STATUS.PAYED);
        statusList.add(Constants.ORDER_STATUS.CONFIRMED);
        statusList.add(Constants.ORDER_STATUS.GETTED);
        statusList.add(Constants.ORDER_STATUS.OVER);

        return statusList;
    }
}

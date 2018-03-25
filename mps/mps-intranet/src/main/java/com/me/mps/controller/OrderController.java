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
 * 订单管理
 */
@Controller
@RequestMapping("order")
public class OrderController extends BaseController {

    private Logger logger = Logger.getLogger(OrderController.class);

    @Autowired
    private OrderService orderService;

    /**
     * 访问订单列表页面
     * 查询所有订单的数据，并进行分页计算
     * @param searchCriteria
     * @param request
     * @return
     */
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

    /**
     * 更新订单状态
     * 当用户确认订单或采购完成时，需要更新订单的状态
     * @param outcome
     * @param orderId
     * @return
     */
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

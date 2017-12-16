package com.me.mps.service;

import com.me.mps.dto.OrderDTO;
import com.me.mps.dto.OrderItemDTO;
import com.me.mps.dto.UserDTO;
import com.me.mps.helper.SearchCriteria;

import java.util.List;

/**
 * Created by Me on 2017/12/15.
 */
public interface OrderService {

    void saveOrder(OrderDTO orderDTO);

    OrderDTO getOrderByOrderId(Integer orderId);

    void confirmPay(OrderDTO orderDTO, UserDTO userDTO);

    int countOrderByCriteria(SearchCriteria searchCriteria);

    List<OrderDTO> listOrderByCriteria(SearchCriteria searchCriteria);

    OrderItemDTO getOrderItemByOrderItemId(Integer orderItemId);

    void cancelOrderItem(OrderDTO orderDTO, OrderItemDTO orderItemDTO, UserDTO userDTO);
}

package com.me.mps.service;

import com.me.mps.dto.OrderDTO;

/**
 * Created by Me on 2017/12/15.
 */
public interface OrderService {

    void saveOrder(OrderDTO orderDTO);

    OrderDTO getOrderByOrderId(Integer orderId);
}

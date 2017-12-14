package com.me.mps.mapper;

import com.me.mps.dto.OrderDTO;

/**
 * Created by Me on 2017/12/15.
 */
public interface OrderMapper {

    void saveOrder(OrderDTO orderDTO);

    OrderDTO getOrderByOrderId(Integer orderId);
}

package com.me.mps.mapper;

import com.me.mps.dto.OrderDTO;
import com.me.mps.helper.SearchCriteria;

import java.util.List;

/**
 * Created by Me on 2017/12/15.
 */
public interface OrderMapper {

    void saveOrder(OrderDTO orderDTO);

    OrderDTO getOrderByOrderId(Integer orderId);

    void confirmPay(OrderDTO orderDTO);

    int countOrderByCriteria(SearchCriteria searchCriteria);

    List<OrderDTO> listOrderByCriteria(SearchCriteria searchCriteria);

    void updateOrderStatusOrTotalByOrderId(OrderDTO orderDTO);
}

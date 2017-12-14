package com.me.mps.service.impl;

import com.me.mps.dto.OrderDTO;
import com.me.mps.dto.OrderItemDTO;
import com.me.mps.mapper.CartMapper;
import com.me.mps.mapper.OrderItemMapper;
import com.me.mps.mapper.OrderMapper;
import com.me.mps.service.OrderService;
import org.apache.log4j.Logger;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * Created by Me on 2017/12/15.
 */
@Service
public class OrderServiceImpl extends BaseServiceImpl implements OrderService {

    private Logger logger = Logger.getLogger(OrderServiceImpl.class);

    public void saveOrder(OrderDTO orderDTO) {
        logger.debug("Execute Method saveOrder...");

        sqlSessionTemplate.getMapper(OrderMapper.class).saveOrder(orderDTO);
        if (!CollectionUtils.isEmpty(orderDTO.getOrderItemDTOList())) {
            sqlSessionTemplate.getMapper(OrderItemMapper.class).saveOrderItem(orderDTO.getOrderItemDTOList(), orderDTO.getOrderId());
        }

        sqlSessionTemplate.getMapper(CartMapper.class).deleteCartByUserId(orderDTO.getUserId());
    }

    public OrderDTO getOrderByOrderId(Integer orderId) {
        logger.debug("Execute Method getOrderByOrderId...");

        OrderDTO orderDTO = sqlSessionTemplate.getMapper(OrderMapper.class).getOrderByOrderId(orderId);
        List<OrderItemDTO> orderItemDTOList = sqlSessionTemplate.getMapper(OrderItemMapper.class).getOrderItemByOrderId(orderId);
        orderDTO.setOrderItemDTOList(orderItemDTOList);

        return orderDTO;
    }
}

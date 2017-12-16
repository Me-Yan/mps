package com.me.mps.service.impl;

import com.me.mps.dto.OrderDTO;
import com.me.mps.dto.OrderItemDTO;
import com.me.mps.dto.UserDTO;
import com.me.mps.helper.Constants;
import com.me.mps.helper.SearchCriteria;
import com.me.mps.mapper.CartMapper;
import com.me.mps.mapper.OrderItemMapper;
import com.me.mps.mapper.OrderMapper;
import com.me.mps.mapper.UserMapper;
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

    public void confirmPay(OrderDTO orderDTO, UserDTO userDTO) {
        logger.debug("Execute Method confirmPay...");

        sqlSessionTemplate.getMapper(UserMapper.class).updateAmount(userDTO);
        sqlSessionTemplate.getMapper(OrderMapper.class).confirmPay(orderDTO);
    }

    public int countOrderByCriteria(SearchCriteria searchCriteria) {
        logger.debug("Execute Method countOrderByCriteria...");

        return sqlSessionTemplate.getMapper(OrderMapper.class).countOrderByCriteria(searchCriteria);
    }

    public List<OrderDTO> listOrderByCriteria(SearchCriteria searchCriteria) {
        logger.debug("Execute Method listOrderByCriteria...");

        return sqlSessionTemplate.getMapper(OrderMapper.class).listOrderByCriteria(searchCriteria);
    }

    public OrderItemDTO getOrderItemByOrderItemId(Integer orderItemId) {
        logger.debug("Execute Method getOrderItemByOrderItemId...");

        return sqlSessionTemplate.getMapper(OrderItemMapper.class).getOrderItemByOrderItemId(orderItemId);
    }

    public void cancelOrderItem(OrderDTO orderDTO, OrderItemDTO orderItemDTO, UserDTO userDTO) {
        logger.debug("Execute Method cancelOrderItem...");

        sqlSessionTemplate.getMapper(OrderMapper.class).updateOrderStatusOrTotalByOrderId(orderDTO);
        sqlSessionTemplate.getMapper(OrderItemMapper.class).updateOrderItemStatusByOrderItemId(orderItemDTO.getOrderItemId());
        sqlSessionTemplate.getMapper(UserMapper.class).updateAmount(userDTO);
    }
}

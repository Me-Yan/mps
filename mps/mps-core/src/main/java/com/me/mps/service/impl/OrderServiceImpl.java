package com.me.mps.service.impl;

import com.google.common.collect.Lists;
import com.me.mps.dto.*;
import com.me.mps.helper.Constants;
import com.me.mps.helper.SearchCriteria;
import com.me.mps.mapper.*;
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

        List<CartDTO> cartDTOList = sqlSessionTemplate.getMapper(CartMapper.class).listCartByUserId(orderDTO.getUserId());
        if (!CollectionUtils.isEmpty(cartDTOList)) {
            for (CartDTO cartDTO : cartDTOList) {
                ProductDTO productDTO = sqlSessionTemplate.getMapper(ProductMapper.class).getProductByProductId(cartDTO.getProductId());
                productDTO.setCountN(productDTO.getCountN()-cartDTO.getCountN());

                sqlSessionTemplate.getMapper(ProductMapper.class).updateCountByProductId(productDTO);
            }
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

    public int countOrderByCriteriaInIntranet(SearchCriteria searchCriteria) {
        logger.debug("Execute Method countOrderByCriteriaInIntranet...");

        return sqlSessionTemplate.getMapper(OrderMapper.class).countOrderByCriteriaInIntranet(searchCriteria);
    }

    public List<OrderDTO> listOrderByCriteriaInIntranet(SearchCriteria searchCriteria) {
        logger.debug("Execute Method listOrderByCriteriaInIntranet...");

        return sqlSessionTemplate.getMapper(OrderMapper.class).listOrderByCriteriaInIntranet(searchCriteria);
    }

    public void updateOrderStatusByOrderId(OrderDTO orderDTO) {
        logger.debug("Execute Method updateOrderStatusByOrderId...");

        sqlSessionTemplate.getMapper(OrderMapper.class).updateOrderStatusByOrderId(orderDTO);
    }

    public int countOrderOneDay() {
        logger.debug("Execute Method countOrderOneDay...");

        return sqlSessionTemplate.getMapper(OrderMapper.class).countOrderOneDay();
    }

    public Double countAmountOneDay() {
        logger.debug("Execute Method countAmountOneDay...");

        return sqlSessionTemplate.getMapper(OrderMapper.class).countAmountOneDay();
    }

    public int countAllOrder() {
        logger.debug("Execute Method countAllOrder...");

        return sqlSessionTemplate.getMapper(OrderMapper.class).countAllOrder();
    }

    public Double countAllAmountOneDay() {
        logger.debug("Execute Method countAllAmountOneDay...");

        return sqlSessionTemplate.getMapper(OrderMapper.class).countAllAmountOneDay();
    }

    public List<OrderDTO> listRecentOrder() {
        logger.debug("Execute Method listRecentOrder...");

        return sqlSessionTemplate.getMapper(OrderMapper.class).listRecentOrder();
    }
}

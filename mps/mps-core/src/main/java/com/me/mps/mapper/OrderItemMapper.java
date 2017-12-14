package com.me.mps.mapper;

import com.me.mps.dto.OrderItemDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Me on 2017/12/15.
 */
public interface OrderItemMapper {

    void saveOrderItem(@Param("orderItemDTOList") List<OrderItemDTO> orderItemDTOList, @Param("orderId") Integer orderId);

    List<OrderItemDTO> getOrderItemByOrderId(Integer orderId);
}

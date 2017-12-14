package com.me.mps.mapper;

import com.me.mps.dto.CartDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Me on 2017/12/14.
 */
public interface CartMapper {

    void saveCart(CartDTO cartDTO);

    void updateCartByCartId(CartDTO cartDTO);

    CartDTO getCartByUserIdAndProductId(@Param("userId") Integer userId, @Param("productId") Integer productId);

    List<CartDTO> listCartByUserId(Integer userId);

    Double countTotalMoney(Integer userId);

    void deleteCartByCartId(Integer cartId);

    void deleteCartByUserId(Integer userId);
}

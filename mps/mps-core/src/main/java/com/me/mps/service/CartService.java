package com.me.mps.service;

import com.me.mps.dto.CartDTO;

import java.util.List;

/**
 * Created by Me on 2017/12/14.
 */
public interface CartService {

    void saveCart(CartDTO cartDTO);

    void updateCartByCartId(CartDTO cartDTO);

    CartDTO getCartByUserIdAndProductId(Integer userId, Integer productId);

    List<CartDTO> listCartByUserId(Integer userId);

    Double countTotalMoney(Integer userId);

    void deleteCartByCartId(Integer cartId);
}

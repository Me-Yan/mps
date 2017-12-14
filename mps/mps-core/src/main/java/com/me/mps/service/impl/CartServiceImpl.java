package com.me.mps.service.impl;

import com.me.mps.dto.CartDTO;
import com.me.mps.mapper.CartMapper;
import com.me.mps.service.CartService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Me on 2017/12/14.
 */
@Service
public class CartServiceImpl extends BaseServiceImpl implements CartService {

    private Logger logger = Logger.getLogger(CartServiceImpl.class);

    public void saveCart(CartDTO cartDTO) {
        logger.debug("Execute Method saveCart...");

        sqlSessionTemplate.getMapper(CartMapper.class).saveCart(cartDTO);
    }

    public void updateCartByCartId(CartDTO cartDTO) {
        logger.debug("Execute Method updateCartByCartId...");

        sqlSessionTemplate.getMapper(CartMapper.class).updateCartByCartId(cartDTO);
    }

    public CartDTO getCartByUserIdAndProductId(Integer userId, Integer productId) {
        logger.debug("Execute Method getCartByUserIdAndProductId...");

        return sqlSessionTemplate.getMapper(CartMapper.class).getCartByUserIdAndProductId(userId, productId);
    }

    public List<CartDTO> listCartByUserId(Integer userId) {
        logger.debug("Execute Method listCartByUserId...");

        return sqlSessionTemplate.getMapper(CartMapper.class).listCartByUserId(userId);
    }

    public Double countTotalMoney(Integer userId) {
        logger.debug("Execute Method countTotalMoney...");

        return sqlSessionTemplate.getMapper(CartMapper.class).countTotalMoney(userId);
    }

    public void deleteCartByCartId(Integer cartId) {
        logger.debug("Execute Method deleteCartByCartId...");

        sqlSessionTemplate.getMapper(CartMapper.class).deleteCartByCartId(cartId);
    }
}

package com.me.mps.controller;

import com.google.common.collect.Maps;
import com.me.mps.dto.CartDTO;
import com.me.mps.dto.OrderDTO;
import com.me.mps.dto.ProductDTO;
import com.me.mps.helper.Constants;
import com.me.mps.service.CartService;
import com.me.mps.service.ProductService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 负责管理基层用户对购物车进行操作的请求
 */
@Controller
@RequestMapping("cart")
public class CartController extends BaseController {

    private Logger logger = Logger.getLogger(CartController.class);

    @Autowired
    private ProductService productService;

    @Autowired
    private CartService cartService;

    /**
     * 将商品添加进购物车
     * 获取商品id，如果购物车中已经存在该商品，则增加相应的商品数量；如果不存在，则添加该商品。
     * 并重新计算对应商品的总金额，最终将购物车信息更新进数据库
     * @param cartDTO
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public Map<String, Object> add(CartDTO cartDTO) {
        logger.debug("Execute Method add...");
        Map<String, Object> model = Maps.newHashMap();

        if (cartDTO.getProductId()==null&&cartDTO.getCountN()==null) {
            model.put("msg", "fail");

            return model;
        } else {
            CartDTO existCart = cartService.getCartByUserIdAndProductId(getUserInfo().getUserId(), cartDTO.getProductId());
            if (existCart!=null) {
                Integer count = existCart.getCountN() + cartDTO.getCountN();
                Double total = existCart.getPrice() * count;

                existCart.setCountN(count);
                existCart.setTotalN(total);

                cartService.updateCartByCartId(existCart);
            } else {
                ProductDTO productDTO = productService.getProductByProductId(cartDTO.getProductId());
                cartDTO.setUserId(getUserInfo().getUserId());
                cartDTO.setTotalN(productDTO.getPriceN()*cartDTO.getCountN());
                cartDTO.setActiveC(Constants.IN_ACTIVE.ACTIVE);
                cartDTO.setCrtByM(getUserInfo().getUsernameM());
                cartDTO.setCrtOnDt(new Date());

                cartService.saveCart(cartDTO);
            }

            model.put("msg", "success");
        }

        return model;
    }

    /**
     * 查看购物车列表
     * 根据用户id，获取相应用户的购物车列表
     * @return
     */
    @RequestMapping("/listCart")
    public ModelAndView listCart() {
        logger.debug("Execute Method listCart...");
        ModelAndView model = new ModelAndView("cart");

        List<CartDTO> cartDTOList = cartService.listCartByUserId(getUserInfo().getUserId());
        Double totalMoney = cartService.countTotalMoney(getUserInfo().getUserId());

        model.addObject("cartDTOList", cartDTOList);
        model.addObject("totalMoney", totalMoney);
        model.addObject("orderForm", new OrderDTO());

        return model;
    }

    /**
     * 根据商品id删除购物车中相应的商品
     * @param cartId
     * @return
     */
    @RequestMapping("/delete")
    public ModelAndView deleteCart(Integer cartId) {
        logger.debug("Execute Method deleteCart...");
        ModelAndView model = new ModelAndView("redirect:/cart/listCart");

        if (cartId==null) {
            return model;
        }

        cartService.deleteCartByCartId(cartId);

        return model;
    }
}

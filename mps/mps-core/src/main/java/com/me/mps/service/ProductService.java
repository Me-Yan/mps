package com.me.mps.service;

import com.me.mps.dto.ProductDTO;
import com.me.mps.helper.SearchCriteria;

import java.util.List;

/**
 * Created by Me on 2017/12/9.
 */
public interface ProductService {

    void saveProduct(ProductDTO productDTO);

    void updateProduct(ProductDTO productDTO);

    ProductDTO getProductByProductId(Integer productId);

    List<ProductDTO> listProductByCriteria(SearchCriteria searchCriteria);

    void downProduct(Integer productId);

    Integer getCountByProductId(Integer productId);

    void updateCountByProductId(ProductDTO productDTO);
}

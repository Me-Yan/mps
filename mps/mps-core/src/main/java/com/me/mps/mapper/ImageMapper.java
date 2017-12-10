package com.me.mps.mapper;

import com.me.mps.dto.ImageDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Me on 2017/12/10.
 */
public interface ImageMapper {

    void saveImage(@Param("imageDTOList") List<ImageDTO> imageDTOList, @Param("productId") Integer productId);

    List<ImageDTO> listImageByProductId(Integer productId);

    void deleteImageByProductId(Integer productId);
}

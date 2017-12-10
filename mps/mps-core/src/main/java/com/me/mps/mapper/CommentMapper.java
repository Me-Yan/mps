package com.me.mps.mapper;

import com.me.mps.dto.CommentDTO;
import com.me.mps.helper.SearchCriteria;

import java.util.List;

/**
 * Created by Me on 2017/12/10.
 */
public interface CommentMapper {

    List<CommentDTO> listCommentByProductId(Integer productId);

    List<CommentDTO> listCommentByCriteria(SearchCriteria searchCriteria);
}

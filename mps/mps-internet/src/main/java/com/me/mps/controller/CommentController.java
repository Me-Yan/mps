package com.me.mps.controller;

import com.google.common.collect.Maps;
import com.me.mps.dto.CommentDTO;
import com.me.mps.helper.Constants;
import com.me.mps.helper.SearchCriteria;
import com.me.mps.service.CommentService;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 管理用户的留言
 */
@Controller
@RequestMapping("comment")
public class CommentController extends BaseController {

    private Logger logger = Logger.getLogger(CommentController.class);

    @Autowired
    private CommentService commentService;

    /**
     * 添加留言
     * 获取用户的留言信息，并将相应信息封装成Comment对象存储进数据库
     * @param commentDTO
     * @return
     */
    @RequestMapping("/addComment")
    @ResponseBody
    public Map<String, Object> addComment(CommentDTO commentDTO) {
        logger.debug("Execute Method addComment...");
        Map<String, Object> model = Maps.newHashMap();

        if (StringUtils.isNotBlank(commentDTO.getCommentX())) {
            commentDTO.setUserId(getUserInfo().getUserId());
            commentDTO.setStatusX(Constants.COMMENT_STATUS.PENDING);
            commentDTO.setCrtOnDt(new Date());
            commentDTO.setCrtByM(getUserInfo().getUsernameM());

            commentService.saveComment(commentDTO);

            model.put("msg", "success");
        } else {
            model.put("msg", "fail");
        }

        return model;
    }

    /**
     * 访问留言列表页面
     * @param searchCriteria
     * @param request
     * @return
     */
    @RequestMapping("/listComment")
    public ModelAndView listComment(SearchCriteria searchCriteria, HttpServletRequest request) {
        logger.debug("Execute Method listComment...");
        ModelAndView model = new ModelAndView("listComment");

        model.addObject("position", "comment");

        return model;
    }

    /**
     * 异步请求获取用户留言数据
     * 根据用户id获取所有留言
     * @return
     */
    @RequestMapping("/listCommentData")
    @ResponseBody
    public List<CommentDTO> listCommentData() {
        logger.debug("Execute Method listCommentData...");

        SearchCriteria searchCriteria = new SearchCriteria();
        searchCriteria.setUserId(getUserInfo().getUserId());

        return commentService.listCommentByUserId(searchCriteria);
    }
}

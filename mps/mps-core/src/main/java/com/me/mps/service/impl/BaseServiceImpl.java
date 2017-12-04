package com.me.mps.service.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Me on 2017/12/5.
 */
public class BaseServiceImpl {

    @Autowired
    protected SqlSessionTemplate sqlSessionTemplate;
}

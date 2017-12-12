package com.me.mps.service.impl;

import com.me.mps.dto.UserDTO;
import com.me.mps.mapper.UserMapper;
import com.me.mps.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Me on 2017/12/5.
 */
@Service
public class UserServiceImpl extends BaseServiceImpl implements UserService {

    private Logger logger = Logger.getLogger(UserServiceImpl.class);

    public void saveUser(UserDTO userDTO) {
        logger.debug("Execute Method saveUser...");

        sqlSessionTemplate.getMapper(UserMapper.class).saveUser(userDTO);
    }

    public List<UserDTO> listUser() {
        logger.debug("Execute Method listUser...");

        return sqlSessionTemplate.getMapper(UserMapper.class).listUser();
    }

    public String getPasswordByUserId(Integer userId) {
        logger.debug("Execute Method getPasswordByUserId...");

        return sqlSessionTemplate.getMapper(UserMapper.class).getPasswordByUserId(userId);
    }

    public void updatePassword(UserDTO userDTO) {
        logger.debug("Execute Method updatePasswordByUserId...");

        sqlSessionTemplate.getMapper(UserMapper.class).updatePassword(userDTO);
    }

    public List<String> listEmailOfAllUser() {
        logger.debug("Execute Method listEmailOfAllUser...");

        return sqlSessionTemplate.getMapper(UserMapper.class).listEmailOfAllUser();
    }

    public void updateAmount(UserDTO userDTO) {
        logger.debug("Execute Method updateAmount...");

        sqlSessionTemplate.getMapper(UserMapper.class).updateAmount(userDTO);
    }

    public UserDTO getUserByUserId(Integer userId) {
        logger.debug("Execute Method getUserByUserId...");

        return sqlSessionTemplate.getMapper(UserMapper.class).getUserByUserId(userId);
    }
}

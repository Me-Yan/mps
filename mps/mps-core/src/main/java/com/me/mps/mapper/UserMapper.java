package com.me.mps.mapper;

import com.me.mps.dto.UserDTO;

import java.util.List;

/**
 * Created by Me on 2017/12/5.
 */
public interface UserMapper {

    void saveUser(UserDTO userDTO);

    List<UserDTO> listUser();

    void deleteUserByCompanyId(Integer companyId);

    String getPasswordByUserId(Integer userId);

    void updatePassword(UserDTO userDTO);
}
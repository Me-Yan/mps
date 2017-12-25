package com.me.mps.service;

import com.me.mps.dto.UserDTO;

import java.util.List;

/**
 * Created by Me on 2017/12/5.
 */
public interface UserService {

    void saveUser(UserDTO userDTO);

    List<UserDTO> listUser();

    String getPasswordByUserId(Integer userId);

    void updatePassword(UserDTO userDTO);

    List<String> listEmailOfAllUser();

    void updateAmount(UserDTO userDTO);

    UserDTO getUserByUserId(Integer userId);

    UserDTO matchUserForIntranetLogin(UserDTO userDTO);

    UserDTO matchUserForInternetLogin(UserDTO userDTO);
}

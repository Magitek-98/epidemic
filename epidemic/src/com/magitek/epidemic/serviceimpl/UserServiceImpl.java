package com.magitek.epidemic.serviceimpl;

import com.magitek.epidemic.beans.UserInfo;
import com.magitek.epidemic.mapper.UserMapper;
import com.magitek.epidemic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public UserInfo loginByAccount(String account) {
        return userMapper.findByAccount(account);
    }
}

package com.lr.bridge.service.impl;

import javax.annotation.Resource;

import com.lr.bridge.dao.UserMapper;
import com.lr.bridge.pojo.User;
import com.lr.bridge.util.MD5Util;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import com.lr.bridge.service.UserService;
import java.util.HashMap;
import java.util.Map;



@Service
public class UserServiceImpl implements UserService{

	@Resource
	private UserMapper userMapper;

    @Override
    public User getUser(String userName) {
        return userMapper.selectByUserName(userName);
    }

    @Override
    public Map<String,String> register(String userName,String fullName,String password,String repassword) {
        Map<String, String> map = new HashMap<>();

        if (StringUtils.isBlank(userName)) {
            map.put("msg", "用户名不能为空");
            return map;
        }

        if (StringUtils.isBlank(password)) {
            map.put("msg", "密码不能不空");
            return map;
        }


        if (StringUtils.isBlank(repassword)) {
            map.put("msg", "确认密码不能不空");
            return map;
        }


        if (StringUtils.isBlank(fullName)) {
            map.put("msg", "姓名不能不空");
            return map;
        }



        if (userMapper.selectByUserName(userName) != null) {
            map.put("msg", "用户名已经存在，请重新输入！");
            return map;
        }

        if (!password.contentEquals(repassword)) {
            map.put("msg", "两次密码输入不一致");
            return map;
        }

        User user = new User();
        user.setUserName(userName);

        user.setPassword(MD5Util.getMD5(password) );
        user.setFullName(fullName);

        //0为普通用户，1为管理员用户
        user.setPermission(0);

        userMapper.insert(user);


        return map;

    }

    @Override
    public Map<String, String> login(String userName, String password) {
        Map<String, String> map = new HashMap<String, String>();
        if (StringUtils.isBlank(userName)) {
            map.put("msg", " 请输入用户名");
            return map;
        }

        if (StringUtils.isBlank(password)) {
            map.put("msg", "请输入密码");
            return map;
        }

        User user = userMapper.selectByUserName(userName);

        if (user == null) {
            map.put("msg", "用户名不存在");
            return map;
        }

        if (!MD5Util.getMD5(password).equals(user.getPassword())) {
            map.put("msg", "密码输入错误");

            return map;
        }


        return map;
    }
}

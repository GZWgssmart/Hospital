package com.gs.service;

import com.gs.bean.User;
import com.gs.common.bean.Pager;

import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
public interface UserService extends BaseService<User, String> {

    public int updatePassword(User user);

    public List<User> queryByPagerAndCriteria(Pager pager, User user);

    public int countByCriteria(User user);

}

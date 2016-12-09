package com.gs.service;

import com.gs.bean.User;
import com.gs.common.bean.Pager;
import com.gs.dao.UserDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDAO userDAO;

    @Override
    public List<User> queryAll() {
        return userDAO.queryAll();
    }

    @Override
    public List<User> queryAll(String status) {
        return userDAO.queryAll(status);
    }

    @Override
    public User queryById(String id) {
        return userDAO.queryById(id);
    }

    @Override
    public User query(User user) {
        return userDAO.query(user);
    }

    @Override
    public int insert(User user) {
        return userDAO.insert(user);
    }

    @Override
    public int update(User user) {
        return userDAO.update(user);
    }

    @Override
    public int batchInsert(List<User> users) {
        return userDAO.batchInsert(users);
    }

    @Override
    public List<User> queryByPager(Pager pager) {
        return userDAO.queryByPager(pager);
    }

    @Override
    public int count() {
        return userDAO.count();
    }

    @Override
    public int updateLoginTime(String id) {
        return userDAO.updateLoginTime(id);
    }

    @Override
    public int updatePassword(User user) {
        return userDAO.updatePassword(user);
    }

    public List<User> queryByPagerAndCriteria(Pager pager, User user) {
        return userDAO.queryByPagerAndCriteria(pager, user);
    }

    public int countByCriteria(User user) {
        return userDAO.countByCriteria(user);
    }

    @Override
    public int inactive(String id) {
        return userDAO.inactive(id);
    }

    @Override
    public int active(String id) {
        return userDAO.active(id);
    }
}

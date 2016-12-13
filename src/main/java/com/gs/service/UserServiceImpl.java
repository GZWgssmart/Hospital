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
    public int delete(User user) {
        return userDAO.delete(user);
    }

    @Override
    public int deleteById(String id) {
        return userDAO.deleteById(id);
    }

    @Override
    public int update(User user) {
        return userDAO.update(user);
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
    public int updatePassword(User user) {
        return userDAO.updatePassword(user);
    }

    @Override
    public List<User> queryByPagerAndCriteria(Pager pager, User user) {
        return userDAO.queryByPagerAndCriteria(pager, user);
    }

    @Override
    public int countByCriteria(User user) {
        return userDAO.countByCriteria(user);
    }

}

package com.gs.service;

import com.gs.bean.Admin;
import com.gs.common.bean.Pager;
import com.gs.dao.AdminDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminDAO adminDAO;

    @Override
    public List<Admin> queryAll() {
        return adminDAO.queryAll();
    }

    @Override
    public Admin queryById(String id) {
        return adminDAO.queryById(id);
    }

    @Override
    public Admin query(Admin admin) {
        return adminDAO.query(admin);
    }

    @Override
    public int insert(Admin admin) {
        return adminDAO.insert(admin);
    }

    @Override
    public int delete(Admin admin) {
        return adminDAO.delete(admin);
    }

    @Override
    public int deleteById(String id) {
        return adminDAO.deleteById(id);
    }

    @Override
    public int update(Admin admin) {
        return adminDAO.update(admin);
    }

    @Override
    public List<Admin> queryByPager(Pager pager) {
        return adminDAO.queryByPager(pager);
    }

    @Override
    public int count() {
        return adminDAO.count();
    }

    @Override
    public int updatePassword(Admin admin) {
        return adminDAO.updatePassword(admin);
    }

    @Override
    public List<Admin> queryByPagerAndCriteria(Pager pager, Admin admin) {
        return adminDAO.queryByPagerAndCriteria(pager, admin);
    }

    @Override
    public int countByCriteria(Admin admin) {
        return adminDAO.countByCriteria(admin);
    }
}

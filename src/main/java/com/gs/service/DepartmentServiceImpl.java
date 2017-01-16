package com.gs.service;

import com.gs.bean.Department;
import com.gs.common.bean.Pager;
import com.gs.dao.DepartmentDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Resource
    private DepartmentDAO departmentDAO;

    @Override
    public List<Department> queryAll() {
        return departmentDAO.queryAll();
    }

    @Override
    public Department queryById(String id) {
        return departmentDAO.queryById(id);
    }

    @Override
    public Department query(Department department) {
        return departmentDAO.query(department);
    }

    @Override
    public int insert(Department department) {
        return departmentDAO.insert(department);
    }

    @Override
    public int delete(Department department) {
        return departmentDAO.delete(department);
    }

    @Override
    public int deleteById(String id) {
        return departmentDAO.deleteById(id);
    }

    @Override
    public int update(Department department) {
        return departmentDAO.update(department);
    }

    @Override
    public List<Department> queryByPager(Pager pager) {
        return departmentDAO.queryByPager(pager);
    }

    @Override
    public int count() {
        return departmentDAO.count();
    }

    @Override
    public List<Department> queryByPagerAndCriteria(Pager pager, Department department) {
        return departmentDAO.queryByPagerAndCriteria(pager, department);
    }

    @Override
    public int countByCriteria(Department department) {
        return departmentDAO.countByCriteria(department);
    }
}

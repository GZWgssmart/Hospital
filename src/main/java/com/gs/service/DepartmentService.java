package com.gs.service;

import com.gs.bean.Department;
import com.gs.common.bean.Pager;

import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
public interface DepartmentService extends BaseService<Department, String> {

    public List<Department> queryByPagerAndCriteria(Pager pager, Department department);

    public int countByCriteria(Department department);

}

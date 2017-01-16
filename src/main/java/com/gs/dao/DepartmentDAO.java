package com.gs.dao;

import com.gs.bean.Department;
import com.gs.common.bean.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
@Repository
public interface DepartmentDAO extends BaseDAO<Department, String> {

    public List<Department> queryByPagerAndCriteria(@Param("pager") Pager pager,
                                                    @Param("dept") Department department);

    public int countByCriteria(@Param("dept") Department department);

}

package com.gs.dao;

import com.gs.bean.Admin;
import com.gs.common.bean.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
@Repository
public interface AdminDAO extends BaseDAO<Admin, String> {

    public int updatePassword(Admin admin);

    public List<Admin> queryByPagerAndCriteria(@Param("pager") Pager pager,
                                               @Param("admin") Admin admin);

    public int countByCriteria(@Param("admin") Admin admin);

}

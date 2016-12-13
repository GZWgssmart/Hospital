package com.gs.dao;

import com.gs.bean.User;
import com.gs.common.bean.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
@Repository
public interface UserDAO extends BaseDAO<User,String> {

    public int updatePassword(User user);

    public List<User> queryByPagerAndCriteria(@Param("pager") Pager pager,
                                                  @Param("user") User user);

    public int countByCriteria(@Param("user") User user);
}

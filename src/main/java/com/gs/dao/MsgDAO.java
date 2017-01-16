package com.gs.dao;

import com.gs.bean.Message;
import com.gs.common.bean.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
@Repository
public interface MsgDAO extends BaseDAO<Message, String> {

    public List<Message> queryByPagerAndCriteria(@Param("pager") Pager pager,
                                              @Param("msg") Message msg);

    public int countByCriteria(@Param("msg") Message msg);

}

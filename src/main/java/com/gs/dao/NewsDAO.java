package com.gs.dao;

import com.gs.bean.News;
import com.gs.common.bean.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
@Repository
public interface NewsDAO extends BaseDAO<News, String> {

    public List<News> queryByPagerAndCriteria(@Param("pager") Pager pager,
                                                 @Param("news") News news);

    public int countByCriteria(@Param("news") News news);

    public List<News> queryByTitle();

}

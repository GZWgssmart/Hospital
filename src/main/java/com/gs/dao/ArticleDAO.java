package com.gs.dao;

import com.gs.bean.Article;
import com.gs.common.bean.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
@Repository
public interface ArticleDAO extends BaseDAO<Article, String> {

    public List<Article> queryByPagerAndCriteria(@Param("pager") Pager pager,
                                                 @Param("article") Article article);

    public List<Article> queryByPagerTypeAndCriteria(@Param("pager") Pager pager, @Param("type") String type, @Param("article") Article article);

    public int countByCriteria(@Param("article") Article article);

    public int countByTypeCriteria(@Param("article") Article article, @Param("type") String type);

}

package com.gs.dao;

import com.gs.bean.ArticleType;
import com.gs.common.bean.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
@Repository
public interface ArticleTypeDAO extends BaseDAO<ArticleType, String> {

    public List<ArticleType> queryByPagerAndCriteria(@Param("pager") Pager pager,
                                                @Param("articleType") ArticleType articleType);

    public int countByCriteria(@Param("articleType") ArticleType articleType);

    public List<ArticleType> queryByTitle();



}

package com.gs.service;

import com.gs.bean.ArticleType;
import com.gs.common.bean.Pager;

import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
public interface ArticleTypeService extends BaseService<ArticleType, String> {

    public List<ArticleType> queryByPagerAndCriteria(Pager pager, ArticleType articleType);

    public int countByCriteria(ArticleType articleType);

    public List<ArticleType> queryByTitle();

}

package com.gs.service;

import com.gs.bean.Article;
import com.gs.common.bean.Pager;

import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
public interface ArticleService extends BaseService<Article, String> {

    public List<Article> queryByPagerAndCriteria(Pager pager, Article article);

    public List<Article> queryByPagerTypeAndCriteria(Pager pager, String type, Article article);

    public int countByCriteria(Article article);

}

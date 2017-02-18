package com.gs.service;

import com.gs.bean.News;
import com.gs.common.bean.Pager;

import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
public interface NewsService extends BaseService<News, String> {

    public List<News> queryByPagerAndCriteria(Pager pager, News news);

    public int countByCriteria(News news);

    public List<News> queryByTitle();

}

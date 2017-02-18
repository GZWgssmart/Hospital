package com.gs.service;

import com.gs.bean.News;
import com.gs.common.bean.Pager;
import com.gs.dao.NewsDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
@Service
public class NewsServiceImpl implements NewsService {

    @Resource
    private NewsDAO newsDAO;

    @Override
    public List<News> queryAll() {
        return newsDAO.queryAll();
    }

    @Override
    public News queryById(String id) {
        return newsDAO.queryById(id);
    }

    @Override
    public News query(News news) {
        return newsDAO.query(news);
    }

    @Override
    public int insert(News news) {
        return newsDAO.insert(news);
    }

    @Override
    public int delete(News news) {
        return newsDAO.delete(news);
    }

    @Override
    public int deleteById(String id) {
        return newsDAO.deleteById(id);
    }

    @Override
    public int update(News news) {
        return newsDAO.update(news);
    }

    @Override
    public List<News> queryByPager(Pager pager) {
        return newsDAO.queryByPager(pager);
    }

    @Override
    public int count() {
        return newsDAO.count();
    }

    @Override
    public List<News> queryByPagerAndCriteria(Pager pager, News news) {
        return newsDAO.queryByPagerAndCriteria(pager, news);
    }

    @Override
    public int countByCriteria(News news) {
        return newsDAO.countByCriteria(news);
    }

    public List<News> queryByTitle() {
        return newsDAO.queryByTitle();
    }
}

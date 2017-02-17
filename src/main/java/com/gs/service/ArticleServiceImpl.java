package com.gs.service;

import com.gs.bean.Article;
import com.gs.common.bean.Pager;
import com.gs.dao.ArticleDAO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
@Service
public class ArticleServiceImpl implements ArticleService {

    @Resource
    private ArticleDAO articleDAO;

    @Override
    public List<Article> queryAll() {
        return articleDAO.queryAll();
    }

    @Override
    public Article queryById(String id) {
        return articleDAO.queryById(id);
    }

    @Override
    public Article query(Article article) {
        return articleDAO.query(article);
    }

    @Override
    public int insert(Article article) {
        return articleDAO.insert(article);
    }

    @Override
    public int delete(Article article) {
        return articleDAO.delete(article);
    }

    @Override
    public int deleteById(String id) {
        return articleDAO.deleteById(id);
    }

    @Override
    public int update(Article article) {
        return articleDAO.update(article);
    }

    @Override
    public List<Article> queryByPager(Pager pager) {
        return articleDAO.queryByPager(pager);
    }

    @Override
    public int count() {
        return articleDAO.count();
    }

    @Override
    public List<Article> queryByPagerAndCriteria(Pager pager, Article article) {
        return articleDAO.queryByPagerAndCriteria(pager, article);
    }

    @Override
    public List<Article> queryByPagerTypeAndCriteria(Pager pager, String type, Article article) {
        return articleDAO.queryByPagerTypeAndCriteria(pager, type, article);
    }

    @Override
    public int countByCriteria(Article article) {
        return articleDAO.countByCriteria(article);
    }
    @Override
    public int countByTypeCriteria(@Param("article") Article article, @Param("type") String type) {
        return articleDAO.countByTypeCriteria(article, type);
    }
}

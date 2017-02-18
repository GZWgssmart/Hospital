package com.gs.service;

import com.gs.bean.ArticleType;
import com.gs.common.bean.Pager;
import com.gs.dao.ArticleTypeDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
@Service
public class ArticleTypeServiceImpl implements ArticleTypeService {

    @Resource
    private ArticleTypeDAO articleTypeDAO;

    @Override
    public List<ArticleType> queryAll() {
        return articleTypeDAO.queryAll();
    }

    @Override
    public ArticleType queryById(String id) {
        return articleTypeDAO.queryById(id);
    }

    @Override
    public ArticleType query(ArticleType articleType) {
        return articleTypeDAO.query(articleType);
    }

    @Override
    public int insert(ArticleType articleType) {
        return articleTypeDAO.insert(articleType);
    }

    @Override
    public int delete(ArticleType articleType) {
        return articleTypeDAO.delete(articleType);
    }

    @Override
    public int deleteById(String id) {
        return articleTypeDAO.deleteById(id);
    }

    @Override
    public int update(ArticleType articleType) {
        return articleTypeDAO.update(articleType);
    }

    @Override
    public List<ArticleType> queryByPager(Pager pager) {
        return articleTypeDAO.queryByPager(pager);
    }

    @Override
    public int count() {
        return articleTypeDAO.count();
    }

    @Override
    public List<ArticleType> queryByPagerAndCriteria(Pager pager, ArticleType articleType) {
        return articleTypeDAO.queryByPagerAndCriteria(pager, articleType);
    }

    @Override
    public int countByCriteria(ArticleType articleType) {
        return articleTypeDAO.countByCriteria(articleType);
    }

    public List<ArticleType> queryByTitle() {
        return articleTypeDAO.queryByTitle();
    }
}

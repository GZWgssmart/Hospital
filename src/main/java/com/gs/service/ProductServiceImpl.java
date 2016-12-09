package com.gs.service;

import com.gs.bean.Product;
import com.gs.common.bean.Pager;
import com.gs.dao.ProductDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
@Service
public class ProductServiceImpl implements ProductService {

    @Resource
    private ProductDAO productDAO;

    @Override
    public List<Product> queryAll() {
        return productDAO.queryAll();
    }

    @Override
    public List<Product> queryAll(String status) {
        return productDAO.queryAll(status);
    }

    @Override
    public Product queryById(String id) {
        return productDAO.queryById(id);
    }

    @Override
    public Product query(Product product) {
        return productDAO.query(product);
    }

    @Override
    public int insert(Product product) {
        return productDAO.insert(product);
    }

    @Override
    public int update(Product product) {
        return productDAO.update(product);
    }

    @Override
    public int inactive(String id) {
        return productDAO.inactive(id);
    }

    @Override
    public int active(String id) {
        return productDAO.active(id);
    }

    @Override
    public int batchInsert(List<Product> products) {
        return productDAO.batchInsert(products);
    }

    @Override
    public List<Product> queryByPager(Pager pager) {
        return productDAO.queryByPager(pager);
    }

    @Override
    public int count() {
        return productDAO.count();
    }

    @Override
    public List<Product> search(String keyword) {
        List<Product> products = new ArrayList<Product>();

        return products;
    }
}

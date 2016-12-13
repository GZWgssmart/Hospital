package com.gs.service;

import com.gs.common.bean.Pager;

import java.io.Serializable;
import java.util.List;

/**
 * Created by WangGenshen on 5/25/16.
 */
public interface BaseService<T, PK extends Serializable> {

    public int insert(T t);
    public int delete(T t);
    public int deleteById(PK id);
    public int update(T t);
    public List<T> queryAll();
    public T query(T t);
    public T queryById(PK id);
    public List<T> queryByPager(Pager pager);
    public int count();
}

package com.gs.service;

import com.gs.bean.Message;
import com.gs.common.bean.Pager;
import com.gs.dao.MsgDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
@Service
public class MsgServiceImpl implements MsgService {

    @Resource
    private MsgDAO msgDAO;

    @Override
    public List<Message> queryAll() {
        return msgDAO.queryAll();
    }

    @Override
    public Message queryById(String id) {
        return msgDAO.queryById(id);
    }

    @Override
    public Message query(Message msg) {
        return msgDAO.query(msg);
    }

    @Override
    public int insert(Message msg) {
        return msgDAO.insert(msg);
    }

    @Override
    public int delete(Message msg) {
        return msgDAO.delete(msg);
    }

    @Override
    public int deleteById(String id) {
        return msgDAO.deleteById(id);
    }

    @Override
    public int update(Message msg) {
        return msgDAO.update(msg);
    }

    @Override
    public List<Message> queryByPager(Pager pager) {
        return msgDAO.queryByPager(pager);
    }

    @Override
    public int count() {
        return msgDAO.count();
    }

    @Override
    public List<Message> queryByPagerAndCriteria(Pager pager, Message msg) {
        return msgDAO.queryByPagerAndCriteria(pager, msg);
    }

    @Override
    public int countByCriteria(Message msg) {
        return msgDAO.countByCriteria(msg);
    }
}

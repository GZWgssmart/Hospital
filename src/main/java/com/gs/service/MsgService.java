package com.gs.service;

import com.gs.bean.Message;
import com.gs.common.bean.Pager;

import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
public interface MsgService extends BaseService<Message, String> {

    public List<Message> queryByPagerAndCriteria(Pager pager, Message msg);

    public int countByCriteria(Message msg);

}

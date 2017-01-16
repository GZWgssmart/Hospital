package com.gs.service;

import com.gs.bean.Hospital;
import com.gs.common.bean.Pager;
import com.gs.dao.HospitalDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
@Service
public class HospitalServiceImpl implements HospitalService {

    @Resource
    private HospitalDAO hospitalDAO;

    @Override
    public List<Hospital> queryAll() {
        return hospitalDAO.queryAll();
    }

    @Override
    public Hospital queryById(String id) {
        return hospitalDAO.queryById(id);
    }

    public List<Hospital> queryByPager(Pager pager) {
        return null;
    }

    public int count() {
        return 0;
    }

    @Override
    public Hospital query(Hospital hospital) {
        return hospitalDAO.query(hospital);
    }

    @Override
    public int insert(Hospital hospital) {
        return hospitalDAO.insert(hospital);
    }

    @Override
    public int delete(Hospital hospital) {
        return hospitalDAO.delete(hospital);
    }

    @Override
    public int deleteById(String id) {
        return hospitalDAO.deleteById(id);
    }

    @Override
    public int update(Hospital hospital) {
        return hospitalDAO.update(hospital);
    }
}

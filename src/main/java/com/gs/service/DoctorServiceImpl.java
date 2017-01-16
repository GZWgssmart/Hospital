package com.gs.service;

import com.gs.bean.Doctor;
import com.gs.common.bean.Pager;
import com.gs.dao.DoctorDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
@Service
public class DoctorServiceImpl implements DoctorService {

    @Resource
    private DoctorDAO doctorDAO;

    @Override
    public List<Doctor> queryAll() {
        return doctorDAO.queryAll();
    }

    @Override
    public Doctor queryById(String id) {
        return doctorDAO.queryById(id);
    }

    @Override
    public Doctor query(Doctor doctor) {
        return doctorDAO.query(doctor);
    }

    @Override
    public int insert(Doctor doctor) {
        return doctorDAO.insert(doctor);
    }

    @Override
    public int delete(Doctor doctor) {
        return doctorDAO.delete(doctor);
    }

    @Override
    public int deleteById(String id) {
        return doctorDAO.deleteById(id);
    }

    @Override
    public int update(Doctor doctor) {
        return doctorDAO.update(doctor);
    }

    @Override
    public List<Doctor> queryByPager(Pager pager) {
        return doctorDAO.queryByPager(pager);
    }

    @Override
    public int count() {
        return doctorDAO.count();
    }

    @Override
    public List<Doctor> queryByPagerAndCriteria(Pager pager, Doctor doctor) {
        return doctorDAO.queryByPagerAndCriteria(pager, doctor);
    }

    @Override
    public int countByCriteria(Doctor doctor) {
        return doctorDAO.countByCriteria(doctor);
    }
}

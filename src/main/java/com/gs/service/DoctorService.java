package com.gs.service;

import com.gs.bean.Doctor;
import com.gs.common.bean.Pager;

import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
public interface DoctorService extends BaseService<Doctor, String> {

    public List<Doctor> queryByPagerAndCriteria(Pager pager, Doctor doctor);

    public int countByCriteria(Doctor doctor);

}

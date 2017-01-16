package com.gs.dao;

import com.gs.bean.Doctor;
import com.gs.common.bean.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
@Repository
public interface DoctorDAO extends BaseDAO<Doctor, String> {

    public List<Doctor> queryByPagerAndCriteria(@Param("pager") Pager pager,
                                                    @Param("doctor") Doctor doctor);

    public int countByCriteria(@Param("doctor") Doctor doctor);

}

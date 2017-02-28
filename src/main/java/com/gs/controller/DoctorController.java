package com.gs.controller;

import com.gs.bean.Doctor;
import com.gs.common.bean.ControllerResult;
import com.gs.common.bean.Pager;
import com.gs.common.bean.Pager4EasyUI;
import com.gs.common.util.PagerUtil;
import com.gs.common.web.SessionUtil;
import com.gs.service.DoctorService;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
@Controller
@RequestMapping("/doctor")
public class DoctorController {

    private static final Logger logger = LoggerFactory.getLogger(DoctorController.class);

    @Resource
    private DoctorService doctorService;

    @ResponseBody
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public ControllerResult add(Doctor doctor, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            doctorService.insert(doctor);
            logger.info("Add doctor successfully");
            return ControllerResult.getSuccessResult("成功添加医生");
        } else {
            return ControllerResult.getNotLoginResult("登录信息无效，请重新登录");
        }
    }

    @RequestMapping(value = "list_page", method = RequestMethod.GET)
    public String toListPage(HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            return "doctor/doctors";
        } else {
            return "redirect:redirect_login_page";
        }
    }


    @ResponseBody
    @RequestMapping(value = "search_pager", method = RequestMethod.GET)
    public Pager4EasyUI<Doctor> searchPager(@Param("page") String page, @Param("rows") String rows, Doctor doctor, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            logger.info("show news info by pager");
            int total = doctorService.countByCriteria(doctor);
            Pager pager = PagerUtil.getPager(page, rows, total);
            List<Doctor> departments = doctorService.queryByPagerAndCriteria(pager, doctor);
            return new Pager4EasyUI<Doctor>(pager.getTotalRecords(), departments);
        } else {
            logger.info("can not show admin info by pager cause admin is not login");
            return null;
        }
    }

    @RequestMapping(value = "search_pager_type", method = RequestMethod.GET)
    public ModelAndView searchPagerByType(@Param("page") String page, @Param("rows") String rows, Doctor doctor, HttpSession session) {
        logger.info("show news info by pager");
        int total = doctorService.countByCriteria(doctor);
        Pager pager = PagerUtil.getPager(page, rows, total);
        List<Doctor> newses = doctorService.queryByPagerAndCriteria(pager, doctor);
        Pager4EasyUI<Doctor> pagers = new Pager4EasyUI<Doctor>(pager.getTotalRecords(), newses);
        pagers.setRows(newses);
        pagers.setTotal(total);
        ModelAndView mav = new ModelAndView("doctor/doctorList");
        mav.addObject("pagers", pagers);
        mav.addObject("pager", pager);
        return mav;
    }

    @RequestMapping(value = "query/{id}", method = RequestMethod.GET)
    public ModelAndView queryById(@PathVariable("id") String id, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            ModelAndView mav = new ModelAndView("admin/info");
            Doctor doctor = doctorService.queryById(id);
            mav.addObject("doctor", doctor);
            return mav;
        }
        return new ModelAndView("redirect:/admin/redirect_login_page");
    }

    @ResponseBody
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public ControllerResult update(Doctor doctor, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            logger.info("update doctor info successfully");
            doctorService.update(doctor);
            return ControllerResult.getSuccessResult("成功更新医生信息");
        } else {
            return ControllerResult.getNotLoginResult("登录信息无效，请重新登录");
        }
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }


    @RequestMapping(value = "queryById/{id}", method = RequestMethod.GET)
    public ModelAndView userQueryById(@PathVariable("id") String id) {
        ModelAndView mav = new ModelAndView("doctor/doctorDetail");
        Doctor doctor = doctorService.queryById(id);
        mav.addObject("doctor", doctor);
        return mav;
    }
}

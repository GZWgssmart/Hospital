package com.gs.controller;

import com.gs.bean.Hospital;
import com.gs.common.bean.ControllerResult;
import com.gs.common.web.SessionUtil;
import com.gs.service.HospitalService;
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
@RequestMapping("/hospital")
public class HospitalController {

    private static final Logger logger = LoggerFactory.getLogger(HospitalController.class);

    @Resource
    private HospitalService hospitalService;

    @ResponseBody
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public ControllerResult add(Hospital hospital, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            hospitalService.insert(hospital);
            logger.info("Add hospital successfully");
            return ControllerResult.getSuccessResult("成功添加医院信息");
        } else {
            return ControllerResult.getNotLoginResult("登录信息无效，请重新登录");
        }
    }

    @RequestMapping(value = "query", method = RequestMethod.GET)
    public ModelAndView query(HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            ModelAndView mav = new ModelAndView("hospital/info");
            List<Hospital> hospitals = hospitalService.queryAll();
            if (hospitals != null && hospitals.size() > 0) {
                mav.addObject("hospital", hospitals.get(0));
            } else {
                mav.addObject("hospital", new Hospital());
            }
            return mav;
        }
        return new ModelAndView("redirect:/admin/login_page");
    }

    @ResponseBody
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public ControllerResult update(Hospital hospital, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            logger.info("update hospital info successfully");
            hospitalService.update(hospital);
            return ControllerResult.getSuccessResult("成功更新医院信息");
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
        ModelAndView mav = new ModelAndView("hospital/hospitalDetail");
        Hospital hospital = hospitalService.queryById(id);
        mav.addObject("hospital", hospital);
        return mav;
    }

}

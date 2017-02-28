package com.gs.controller;

import com.gs.bean.ArticleType;
import com.gs.bean.Department;
import com.gs.common.bean.ComboBox4EasyUI;
import com.gs.common.bean.ControllerResult;
import com.gs.common.bean.Pager;
import com.gs.common.bean.Pager4EasyUI;
import com.gs.common.util.PagerUtil;
import com.gs.common.web.SessionUtil;
import com.gs.service.DepartmentService;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
@Controller
@RequestMapping("/dept")
public class DepartmentController {

    private static final Logger logger = LoggerFactory.getLogger(DepartmentController.class);

    @Resource
    private DepartmentService departmentService;

    @ResponseBody
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public ControllerResult add(Department dept, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            departmentService.insert(dept);
            logger.info("Add dept successfully");
            return ControllerResult.getSuccessResult("成功添加科室");
        } else {
            return ControllerResult.getNotLoginResult("登录信息无效，请重新登录");
        }
    }

    @RequestMapping(value = "list_page", method = RequestMethod.GET)
    public String toListPage(HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            return "department/departments";
        } else {
            return "redirect:redirect_login_page";
        }
    }

    @ResponseBody
    @RequestMapping(value = "search_pager", method = RequestMethod.GET)
    public Pager4EasyUI<Department> searchPager(@Param("page")String page, @Param("rows")String rows, Department dept, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            logger.info("show dept info by pager");
            int total = departmentService.countByCriteria(dept);
            Pager pager = PagerUtil.getPager(page, rows, total);
            List<Department> departments = departmentService.queryByPagerAndCriteria(pager, dept);
            return new Pager4EasyUI<Department>(pager.getTotalRecords(), departments);
        } else {
            logger.info("can not show admin info by pager cause admin is not login");
            return null;
        }
    }

    @RequestMapping(value = "query/{id}", method = RequestMethod.GET)
    public ModelAndView queryById(@PathVariable("id") String id, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            ModelAndView mav = new ModelAndView("admin/info");
            Department dept = departmentService.queryById(id);
            mav.addObject("dept", dept);
            return mav;
        }
        return new ModelAndView("redirect:/admin/redirect_login_page");
    }

    @ResponseBody
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public ControllerResult update(Department dept, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            logger.info("update dept info successfully");
            departmentService.update(dept);
            return ControllerResult.getSuccessResult("成功更新科室信息");
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

    @ResponseBody
    @RequestMapping("all")
    public List<ComboBox4EasyUI> queryAll() {
        List<Department> depts = departmentService.queryAll();
        List<ComboBox4EasyUI> cobox = new ArrayList<ComboBox4EasyUI>();
        for(Department dept : depts) {
            ComboBox4EasyUI co = new ComboBox4EasyUI();
            co.setId(String.valueOf(dept.getId()));
            co.setText(dept.getName());
            cobox.add(co);
        }
        return cobox;
    }

    @RequestMapping(value = "search_pager_type", method = RequestMethod.GET)
    public ModelAndView searchPagerByType(@Param("page") String page, @Param("rows") String rows, Department dept, HttpSession session) {
        logger.info("show department info by pager");
        int total = departmentService.countByCriteria(dept);
        Pager pager = PagerUtil.getPager(page, rows, total);
        List<Department> deptList = departmentService.queryByPagerAndCriteria(pager, dept);
        Pager4EasyUI<Department> pagers = new Pager4EasyUI<Department>(pager.getTotalRecords(), deptList);
        pagers.setRows(deptList);
        pagers.setTotal(total);
        ModelAndView mav = new ModelAndView("department/deptList");
        mav.addObject("pagers", pagers);
        mav.addObject("pager", pager);
        return mav;
    }

    @RequestMapping(value = "queryById/{id}", method = RequestMethod.GET)
    public ModelAndView userQueryById(@PathVariable("id") String id) {
        ModelAndView mav = new ModelAndView("department/deptDetail");
        Department dept = departmentService.queryById(id);
        mav.addObject("dept", dept);
        return mav;
    }

}

package com.gs.controller;

import com.gs.bean.Message;
import com.gs.common.bean.ControllerResult;
import com.gs.common.bean.Pager;
import com.gs.common.bean.Pager4EasyUI;
import com.gs.common.util.PagerUtil;
import com.gs.common.web.SessionUtil;
import com.gs.service.MsgService;
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
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
@Controller
@RequestMapping("/msg")
public class MsgController {

    private static final Logger logger = LoggerFactory.getLogger(MsgController.class);

    @Resource
    private MsgService msgService;

    @ResponseBody
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public ControllerResult add(Message msg, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            msg.setSendTime(Calendar.getInstance().getTime());
            msgService.insert(msg);
            logger.info("Add msg successfully");
            return ControllerResult.getSuccessResult("成功添加消息");
        } else {
            return ControllerResult.getNotLoginResult("登录信息无效，请重新登录");
        }
    }

    @RequestMapping(value = "list_page", method = RequestMethod.GET)
    public String toListPage(HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            return "message/msgs";
        } else {
            return "redirect:redirect_login_page";
        }
    }

    @ResponseBody
    @RequestMapping(value = "search_pager", method = RequestMethod.GET)
    public Pager4EasyUI<Message> searchPager(@Param("page")String page, @Param("rows")String rows, Message msg, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            logger.info("show msg info by pager");
            int total = msgService.countByCriteria(msg);
            Pager pager = PagerUtil.getPager(page, rows, total);
            List<Message> departments = msgService.queryByPagerAndCriteria(pager, msg);
            return new Pager4EasyUI<Message>(pager.getTotalRecords(), departments);
        } else {
            logger.info("can not show admin info by pager cause admin is not login");
            return null;
        }
    }

    @RequestMapping(value = "query/{id}", method = RequestMethod.GET)
    public ModelAndView queryById(@PathVariable("id") String id, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            ModelAndView mav = new ModelAndView("admin/info");
            Message msg = msgService.queryById(id);
            mav.addObject("msg", msg);
            return mav;
        }
        return new ModelAndView("redirect:/admin/redirect_login_page");
    }

    @ResponseBody
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public ControllerResult update(Message msg, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            logger.info("update msg info successfully");
            msgService.update(msg);
            return ControllerResult.getSuccessResult("成功更新消息");
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

    @RequestMapping(value = "msg_pager", method = RequestMethod.GET)
    public ModelAndView msgPager(@Param("page")String page, @Param("rows")String rows, Message msg, HttpSession session) {
        if (SessionUtil.isUser(session)) {
            ModelAndView mav = new ModelAndView("message/systemMsg");
            logger.info("user show msg info by pager");
            int total = msgService.countByCriteria(msg);
            Pager pager = PagerUtil.getPager(page, rows, total);
            List<Message> departments = msgService.queryByPagerAndCriteria(pager, msg);
            Pager4EasyUI<Message> messages = new Pager4EasyUI<Message>(pager.getTotalRecords(), departments);
            mav.addObject("pager", pager);
            mav.addObject("messages", messages);
            return mav;
        } else {
            logger.info("can not show admin info by pager cause admin is not login");
            return null;
        }
    }

    @RequestMapping(value = "queryById/{id}", method = RequestMethod.GET)
    public ModelAndView userQueryById(@PathVariable("id") String id, HttpSession session) {
        if (SessionUtil.isUser(session)) {
            ModelAndView mav = new ModelAndView("message/msgDetail");
            Message msg = msgService.queryById(id);
            mav.addObject("msg", msg);
            return mav;
        }
        return new ModelAndView("redirect:/redirect_index");
    }

}

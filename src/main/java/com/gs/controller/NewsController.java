package com.gs.controller;

import com.gs.bean.News;
import com.gs.common.bean.ControllerResult;
import com.gs.common.bean.Pager;
import com.gs.common.bean.Pager4EasyUI;
import com.gs.common.util.PagerUtil;
import com.gs.common.web.SessionUtil;
import com.gs.service.NewsService;
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
@RequestMapping("/news")
public class NewsController {

    private static final Logger logger = LoggerFactory.getLogger(NewsController.class);

    @Resource
    private NewsService newsService;

    @ResponseBody
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public ControllerResult add(News news, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            news.setPubTime(Calendar.getInstance().getTime());
            newsService.insert(news);
            logger.info("Add news successfully");
            return ControllerResult.getSuccessResult("成功添加新闻");
        } else {
            return ControllerResult.getNotLoginResult("登录信息无效，请重新登录");
        }
    }

    @RequestMapping(value = "list_page", method = RequestMethod.GET)
    public String toListPage(HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            return "news/news";
        } else {
            return "redirect:redirect_login_page";
        }
    }

    @ResponseBody
    @RequestMapping(value = "search_pager", method = RequestMethod.GET)
    public Pager4EasyUI<News> searchPager(@Param("page")String page, @Param("rows")String rows, News news, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            logger.info("show news info by pager");
            int total = newsService.countByCriteria(news);
            Pager pager = PagerUtil.getPager(page, rows, total);
            List<News> departments = newsService.queryByPagerAndCriteria(pager, news);
            return new Pager4EasyUI<News>(pager.getTotalRecords(), departments);
        } else {
            logger.info("can not show admin info by pager cause admin is not login");
            return null;
        }
    }

    @RequestMapping(value = "query/{id}", method = RequestMethod.GET)
    public ModelAndView queryById(@PathVariable("id") String id, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            ModelAndView mav = new ModelAndView("admin/info");
            News news = newsService.queryById(id);
            mav.addObject("news", news);
            return mav;
        }
        return new ModelAndView("redirect:/admin/redirect_login_page");
    }

    @ResponseBody
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public ControllerResult update(News news, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            logger.info("update news info successfully");
            newsService.update(news);
            return ControllerResult.getSuccessResult("成功更新新闻信息");
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

}

package com.gs.controller;

import com.gs.bean.Article;
import com.gs.bean.ArticleType;
import com.gs.common.bean.ComboBox4EasyUI;
import com.gs.common.bean.ControllerResult;
import com.gs.common.bean.Pager;
import com.gs.common.bean.Pager4EasyUI;
import com.gs.common.util.PagerUtil;
import com.gs.common.web.SessionUtil;
import com.gs.service.ArticleTypeService;
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
@RequestMapping("/articleType")
public class ArticleTypeController {

    private static final Logger logger = LoggerFactory.getLogger(ArticleTypeController.class);

    @Resource
    private ArticleTypeService articleTypeService;

    @ResponseBody
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public ControllerResult add(ArticleType articleType, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            articleTypeService.insert(articleType);
            logger.info("Add articleType successfully");
            return ControllerResult.getSuccessResult("成功添加文章类型");
        } else {
            return ControllerResult.getNotLoginResult("登录信息无效，请重新登录");
        }
    }

    @RequestMapping(value = "list_page", method = RequestMethod.GET)
    public String toListPage(HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            return "article/article_types";
        } else {
            return "redirect:redirect_login_page";
        }
    }

    @ResponseBody
    @RequestMapping(value = "search_pager", method = RequestMethod.GET)
    public Pager4EasyUI<ArticleType> searchPager(@Param("page")String page, @Param("rows")String rows, ArticleType articleType, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            logger.info("show articleType info by pager");
            int total = articleTypeService.countByCriteria(articleType);
            Pager pager = PagerUtil.getPager(page, rows, total);
            List<ArticleType> departments = articleTypeService.queryByPagerAndCriteria(pager, articleType);
            return new Pager4EasyUI<ArticleType>(pager.getTotalRecords(), departments);
        } else {
            logger.info("can not show admin info by pager cause admin is not login");
            return null;
        }
    }

    @RequestMapping(value = "query/{id}", method = RequestMethod.GET)
    public ModelAndView queryById(@PathVariable("id") String id, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            ModelAndView mav = new ModelAndView("admin/info");
            ArticleType articleType = articleTypeService.queryById(id);
            mav.addObject("articleType", articleType);
            return mav;
        }
        return new ModelAndView("redirect:/admin/redirect_login_page");
    }

    @ResponseBody
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public ControllerResult update(ArticleType articleType, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            logger.info("update articleType info successfully");
            articleTypeService.update(articleType);
            return ControllerResult.getSuccessResult("成功更新文章类型");
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
    @RequestMapping("all_type")
    public List<ComboBox4EasyUI> queryAll() {
        List<ArticleType> ats = articleTypeService.queryAll();
        List<ComboBox4EasyUI> cobox = new ArrayList<ComboBox4EasyUI>();
        for(ArticleType at : ats) {
            ComboBox4EasyUI co = new ComboBox4EasyUI();
            co.setId(String.valueOf(at.getId()));
            co.setText(at.getName());
            cobox.add(co);
        }
        return cobox;
    }

}

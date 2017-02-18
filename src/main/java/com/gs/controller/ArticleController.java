package com.gs.controller;

import com.gs.bean.Article;
import com.gs.bean.ArticleType;
import com.gs.common.bean.ControllerResult;
import com.gs.common.bean.Pager;
import com.gs.common.bean.Pager4EasyUI;
import com.gs.common.util.PagerUtil;
import com.gs.common.web.SessionUtil;
import com.gs.service.ArticleService;
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
@RequestMapping("/article")
public class ArticleController {

    private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);

    @Resource
    private ArticleService articleService;

    @ResponseBody
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public ControllerResult add(Article article, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            article.setPubTime(Calendar.getInstance().getTime());
            articleService.insert(article);
            logger.info("Add article successfully");
            return ControllerResult.getSuccessResult("成功添加文章");
        } else {
            return ControllerResult.getNotLoginResult("登录信息无效，请重新登录");
        }
    }

    @RequestMapping(value = "list_page", method = RequestMethod.GET)
    public String toListPage(HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            return "article/articles";
        } else {
            return "redirect:redirect_login_page";
        }
    }

    @ResponseBody
    @RequestMapping(value = "search_pager", method = RequestMethod.GET)
    public Pager4EasyUI<Article> searchPager(@Param("page") String page, @Param("rows") String rows, Article article, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            logger.info("show article info by pager");
            int total = articleService.countByCriteria(article);
            Pager pager = PagerUtil.getPager(page, rows, total);
            List<Article> articles = articleService.queryByPagerAndCriteria(pager, article);
            return new Pager4EasyUI<Article>(pager.getTotalRecords(), articles);
        } else {
            logger.info("can not show admin info by pager cause admin is not login");
            return null;
        }
    }

    @ResponseBody
    @RequestMapping(value = "search_pager_type", method = RequestMethod.GET)
    public ModelAndView searchPagerByType(@Param("page") String page, @Param("rows") String rows, @Param("type") String type, Article article, HttpSession session) {
        logger.info("show article info by pager");
        ArticleType at = new ArticleType();
        at.setName(type);
        article.setArticleType(at);
        int total = articleService.countByTypeCriteria(article, type);
        Pager pager = PagerUtil.getPager(page, rows, total);
        List<Article> articles = articleService.queryByPagerTypeAndCriteria(pager, type, article);
        Pager4EasyUI<Article> pagers = new Pager4EasyUI<Article>(pager.getTotalRecords(), articles);
        pagers.setRows(articles);
        pagers.setTotal(total);
        ModelAndView mav = new ModelAndView("article/articleList");
        mav.addObject("pagers", pagers);
        mav.addObject("articleType", type);
        mav.addObject("pager", pager);
        return mav;
    }

    @RequestMapping(value = "query/{id}", method = RequestMethod.GET)
    public ModelAndView queryById(@PathVariable("id") String id, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            ModelAndView mav = new ModelAndView("admin/info");
            Article article = articleService.queryById(id);
            mav.addObject("article", article);
            return mav;
        }
        return new ModelAndView("redirect:/admin/redirect_login_page");
    }

    @ResponseBody
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public ControllerResult update(Article article, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            logger.info("update article info successfully");
            articleService.update(article);
            return ControllerResult.getSuccessResult("成功更新文章信息");
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

    @RequestMapping(value = "queryById/{id}/{type}", method = RequestMethod.GET)
    public ModelAndView userQueryById(@PathVariable("id") String id, @PathVariable("type") String type) {
        ModelAndView mav = new ModelAndView("article/articleDetail");
        Article article = articleService.queryById(id);
        mav.addObject("article", article);
        mav.addObject("articleType", type);
        return mav;
    }

}

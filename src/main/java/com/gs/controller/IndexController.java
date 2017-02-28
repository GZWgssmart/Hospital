package com.gs.controller;

import com.gs.bean.ArticleType;
import com.gs.bean.Hospital;
import com.gs.bean.News;
import com.gs.service.ArticleTypeService;
import com.gs.service.HospitalService;
import com.gs.service.NewsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by WangGenshen on 5/17/16.
 */
@Controller
@RequestMapping("/")
public class IndexController {

    @Resource
    private NewsService newsService;

    @Resource
    private ArticleTypeService ats;

    @Resource
    private HospitalService hospitalService;

    @RequestMapping(value = "index",method = RequestMethod.GET)
    public ModelAndView home() {
        ModelAndView mav = new ModelAndView("index/home");
        List<News> newss = newsService.queryByTitle();
        List<ArticleType> articleTypes = ats.queryByTitle();
        Hospital hospital = hospitalService.query(new Hospital());
        mav.addObject("newss", newss);
        mav.addObject("articleTypes", articleTypes);
        mav.addObject("hospital", hospital);
        return mav;
    }

    @RequestMapping(value = "redirect_index",method = RequestMethod.GET)
    public String redirectHome(Model model) {
        model.addAttribute("redirect", "redirect");
        return "index/home";
    }

}

package com.gs.controller;

import com.gs.bean.User;
import com.gs.common.Constants;
import com.gs.common.bean.ControllerResult;
import com.gs.common.bean.Pager;
import com.gs.common.bean.Pager4EasyUI;
import com.gs.common.util.DateUtil;
import com.gs.common.util.EncryptUtil;
import com.gs.common.util.PagerUtil;
import com.gs.common.web.SessionUtil;
import com.gs.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
@RequestMapping("/user")
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Resource
    private UserService userService;


    @ResponseBody
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public ControllerResult login(User user, HttpSession session) {
        if (SessionUtil.isUser(session)) {
            return ControllerResult.getSuccessResult("登录成功");
        }
        user.setPwd(EncryptUtil.md5Encrypt(user.getPwd()));
        User c = userService.query(user);
        if (c != null) {
            session.setAttribute(Constants.SESSION_CUSTOMER, c);
            return ControllerResult.getSuccessResult("登录成功");
        } else {
            return ControllerResult.getFailResult("登录失败,请检查手机号或密码");
        }
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute(Constants.SESSION_CUSTOMER);
        return "redirect:/index";
    }

    @RequestMapping(value = "reg_page", method = RequestMethod.GET)
    public String toRegPage(Model model) {
        model.addAttribute(new User());
        return "user/register";
    }

    @RequestMapping(value = "reg", method = RequestMethod.POST)
    public String reg(User user, HttpSession session) {
        user.setPwd(EncryptUtil.md5Encrypt(user.getPwd()));
        user.setCreatedTime(DateUtil.getDate());
        userService.insert(user);
        session.setAttribute(Constants.SESSION_CUSTOMER, user);
        return "redirect:home";
    }

    @ResponseBody
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public ControllerResult add(User user, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            user.setPwd(EncryptUtil.md5Encrypt(user.getPwd()));
            userService.insert(user);
            return ControllerResult.getSuccessResult("成功添加用户信息");
        }
        return ControllerResult.getNotLoginResult("登录信息无效，请重新登录");
    }

    @RequestMapping(value = "home", method = RequestMethod.GET)
    public ModelAndView home(HttpSession session) {
        if (SessionUtil.isUser(session)) {
            User user = (User) session.getAttribute(Constants.SESSION_CUSTOMER);
            ModelAndView mav = new ModelAndView("user/home");
            return mav;
        } else {
            return new ModelAndView("redirect:/index");
        }
    }

    @RequestMapping(value = "list_page", method = RequestMethod.GET)
    public String toListPage(HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            return "user/users";
        } else {
            return "redirect:/admin/redirect_login_page";
        }
    }

    @ResponseBody
    @RequestMapping(value = "search_pager", method = RequestMethod.GET)
    public Pager4EasyUI<User> searchPager(@Param("page")String page, @Param("rows")String rows, User user, HttpSession session) {
        if (SessionUtil.isAdmin(session)) {
            logger.info("show users by pager");
            int total = userService.countByCriteria(user);
            Pager pager = PagerUtil.getPager(page, rows, total);
            List<User> users = userService.queryByPagerAndCriteria(pager, user);
            return new Pager4EasyUI<User>(pager.getTotalRecords(), users);
        } else {
            logger.info("can not show user by pager cause admin is no login");
            return null;
        }
    }

    @RequestMapping(value = "query/{id}", method = RequestMethod.GET)
    public ModelAndView queryById(@PathVariable("id") String id, HttpSession session) {
        if (SessionUtil.isAdmin(session) || SessionUtil.isUser(session)) {
            logger.info("query user info by id: " + id);
            ModelAndView mav = new ModelAndView("user/info");
            User user = userService.queryById(id);
            mav.addObject("user", user);
            return mav;
        }
        return new ModelAndView("redirect:/index");
    }

    @ResponseBody
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public ControllerResult update(User user, HttpSession session) {
        if (SessionUtil.isAdmin(session) || SessionUtil.isUser(session)) {
            logger.info("update user info");
            userService.update(user);
            session.removeAttribute(Constants.SESSION_CUSTOMER);
            return ControllerResult.getSuccessResult("成功更新用户信息");
        } else {
            return ControllerResult.getNotLoginResult("登录信息无效，请重新登录");
        }
    }

    @RequestMapping(value = "setting_page", method = RequestMethod.GET)
    public String settingPage(User user, HttpSession session) {
        if (SessionUtil.isUser(session)) {
            return "user/setting";
        } else {
            return "redirect:/redirect_index";
        }
    }

    @ResponseBody
    @RequestMapping(value = "update_pwd", method = RequestMethod.POST)
    public ControllerResult updatePwd(@Param("pwd")String pwd, @Param("newPwd")String newPwd, @Param("conPwd")String conPwd, HttpSession session) {
        if (SessionUtil.isUser(session)) {
            User user = (User) session.getAttribute(Constants.SESSION_CUSTOMER);
            if (user.getPwd().equals(EncryptUtil.md5Encrypt(pwd)) && newPwd != null && conPwd != null && newPwd.equals(conPwd)) {
                user.setPwd(EncryptUtil.md5Encrypt(newPwd));
                userService.updatePassword(user);
                session.removeAttribute(Constants.SESSION_CUSTOMER);
                return ControllerResult.getSuccessResult("更新用户密码成功");
            } else {
                return ControllerResult.getFailResult("原密码错误,或新密码与确认密码不一致");
            }
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

    @RequestMapping(value = "login_page", method = RequestMethod.GET)
    public String toLoginPage(Model model) {
        model.addAttribute(new User());
        return "user/login";
    }

    @RequestMapping(value = "index_demo", method = RequestMethod.GET)
    public String toIndexPage() {
        return "user/index";
    }

    @RequestMapping(value = "system_msg", method = RequestMethod.GET)
    public String systemMsgPage() {
        return "user/systemMsg";
    }


}

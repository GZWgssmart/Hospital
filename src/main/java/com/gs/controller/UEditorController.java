package com.gs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by WangGenshen on 18/02/2017.
 */
@Controller
@RequestMapping("/ueditor")
public class UEditorController {

    @RequestMapping("core")
    public String core() {
        return "/ueditor/controller";
    }

}

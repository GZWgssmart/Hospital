package com.gs.common.web;

/**
 * Created by WangGenshen on 18/02/2017.
 */
public class CommonsMultipartResolver extends org.springframework.web.multipart.commons.CommonsMultipartResolver {

        /**
         * 用于过滤百度编辑器上传文件时阻止 commonsMultipartResolver 对文件进行包装
         */
        @Override
        public boolean isMultipart(javax.servlet.http.HttpServletRequest request) {
            String uri = request.getRequestURI();
            System.out.println(uri);
            //过滤使用百度EmEditor的URI
            if (uri.indexOf("ueditor/core") > 0) {
                System.out.println("commonsMultipartResolver 放行");
                return false;
            }
            System.out.println("commonsMultipartResolver 拦截");
            return super.isMultipart(request);
        }
}

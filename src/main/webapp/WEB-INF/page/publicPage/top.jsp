<%--
  Created by IntelliJ IDEA.
  User: ALTERUI
  Date: 2019/3/25
  Time: 8:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>南京浦仪大桥质量环保子系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/layui.js">

    <script>
        //JavaScript代码区域
        layui.use('element', function(){
            var element = layui.element;

        });
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">浦仪大桥信息协同平台</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">

            <li class="layui-nav-item">
                <a href="javascript:;">质量管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="/page/beam/beamStandard">质量验收标准</a></dd>
                    <c:if test="${permission==1}">
                    <dd><a href="/page/beam">质量验收</a></dd>
                    </c:if>
                    <dd><a href="/page/beam/showChart">质量可视化管理</a></dd>
                </dl>
            </li>


            <li class="layui-nav-item">
                <a href="javascript:;">环保管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="">检查报告管理</a></dd>
                    <dd><a href="">检查报告审核</a></dd>
                </dl>
            </li>


            <c:if test="${permission==1}">
                <li class="layui-nav-item">
                    <a href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="">普通用户管理</a></dd>
                        <dd><a href="">管理员用户管理</a></dd>
                    </dl>
                </li>
            </c:if>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${pageContext.request.contextPath}/static/img/tx.jpg" class="layui-nav-img">
                    ${userName}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/logout">退出</a></li>
        </ul>
    </div>
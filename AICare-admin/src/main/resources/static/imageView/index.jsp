<%--
  Created by IntelliJ IDEA.
  User: l
  Date: 2022/6/23
  Time: 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>
        智慧医疗创新技术平台
    </title>
    <link rel="stylesheet" href="./WebCss/bootstrap.min.css">
    <link rel="stylesheet" href="WebCss/index.css">
    <link rel="stylesheet" href="./WebCss/aos.css">
</head>
<body>
<div class="header" id="home">
    <div class="container">
        <div class="head">
            <div class="logo">
                <img src="./image/logo.jpg" alt="logo">
                <h2>
                    智慧医疗创新技术平台
                </h2>
            </div>
            <div class="navigation">
                <ul class="navig">
                    <li>
                        <a href="#" class="active">主页</a>
                    </li>
                    <li>
                        <a href="problem-Advise.jsp" target="_blank">联系我们</a>
                    </li>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<div class="banner">
    <div class="container" style="height: 380px;">
        <div class="banner-main">
            <div class="col-md-6 banner-left" style="padding-left: 0;">
                <h1>教学+科研+医疗产品</h1>
                <h2>一站式集成服务平台</h2>
                <h3>功能面向国内知名医学院校、科研机构和单位以及各大医院，
                    致力于发展交叉学科，提升科研成果转化，完善辅助诊疗系统。</h3>

                <div class="img-view-test">
                    <a class="btn btn-default uploadImg" href="#">上传本地图像</a>
                </div>
            </div>

            <div class="col-md-6 banner-right" style="margin-top: 18px;">
                <img src="./image/2.jpg" alt="image">
            </div>

            <div class="clearfix"></div>
        </div>
    </div>

</div>

<div class="image-Example">
    <div class="title">
        <h2>图像示例</h2>
    </div>
    <div class="container"  aos="fade-up">
        <div class="row">
            <div class="col-lg-4 col-sm-6 aos-init aos-animate" data-aos="zoom-in" onclick="selectD()">
                <div class="radius">
                    <img src="./image/three.png"  alt="3"/>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 aos-init aos-animate" data-aos="zoom-in" onclick="selectN()">
                <div class="radius">
                    <img src="./image/two.png"  alt="2"/>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 aos-init aos-animate" data-aos="zoom-in" onclick="selectA()">
                <div class="radius">
                    <img src="./image/one.png"  alt="1"/>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="foot">
    <div class="container">
        <p style="padding-right: 0;">
            DICOM 医学影像 Nifty 医学影像 医学影像云 3维重建 互操作
            Copyright  © 2020-2024  智慧医疗创新技术平台-轻量又便捷的智能互联网医学影像交互平台
        </p>
    </div>
</div>

</body>

<script src="./WebJs/jquery-1.10.2.js" type="text/javascript"></script>
<script src="WebJs/index.js" type="text/javascript"></script>

</html>

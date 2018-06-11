<!DOCTYPE html>
<html lang="en">
<head>
    <title>Tennis Court a Sports Category Flat Bootstrap Responsive Website Template | Typography :: w3layouts</title>
    <!-- custom-theme -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Tennis Court Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <script type="text/javascript" src="/js/jsMenu.js"></script>

    <!-- //custom-theme -->
    <link href="/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="/css/jsMenu.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="/css/create_post.css">
    <link rel="stylesheet" href="/css/post.css">
    <link rel="stylesheet" href="/css/profile.css">

    <link rel="stylesheet" href="/css/mystories.css">


    <!--<script defer src="js/post.js"></script      >-->
    <link href="js/jquery-ui-1.12.1/jquery-ui.css" type="text/css" rel="stylesheet">

    <script src="js/jquery-ui-1.12.1/jquery-ui.js"></script>
    <script src="js/jquery-3.2.1.min.js"></script>


    <!-- font-awesome-icons -->
    <link href="/css/font-awesome.css" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,600i,700,900" rel="stylesheet">

</head>
<body>
<div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a href="stringer/profile">Профиль</a>
    <a href="stringer/applications">Натяжки струн</a>
    <a href="#">Сообщения</a>

</div>
<div id="main">
    <div class="header">

        <div class="w3layouts_header_right">
            <ul>
                <li><i class="fa fa-phone" aria-hidden="true"></i>(+000) 123 456</li>
                <li><i class="fa fa-envelope" aria-hidden="true"></i><a
                        href="mailto:info@example.com">info@example.com</a>
                </li>
            </ul>
        </div>
        <div class="w3layouts_header_left">
            <ul>
                <li><a href="#" data-toggle="modal" data-target="#myModal2"><i class="fa fa-user"
                                                                               aria-hidden="true"></i>
                    Log in</a></li>
                <li><a href="#" data-toggle="modal" data-target="#myModal3"><i class="fa fa-pencil-square-o"
                                                                               aria-hidden="true"></i> Sign up</a></li>
            </ul>

        </div>
        <div class="clearfix"></div>
    </div>

    <div class="banner">
        <nav class="navbar navbar-default">
            <div class="navbar-header navbar-left">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <h1><a class="navbar-brand" href="index.html">Tennis Court</a></h1>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                <nav class="link-effect-2" id="link-effect-2">
                    <ul class="nav navbar-nav">
                        <li><a href="index.html"><span data-hover="Home">Home</span></a></li>
                        <li><a href="about.html"><span data-hover="About Us">About Us</span></a></li>
                        <li><a href="events.html"><span data-hover="Events">Events</span></a></li>
                        <li class="dropdown active">
                            <a href="#" class="dropdown-toggle active" data-toggle="dropdown"><span
                                    data-hover="Short Codes">Short Codes</span> <b class="caret"></b></a>
                            <ul class="dropdown-menu agile_short_dropdown">
                                <li><a href="icons.html">Web Icons</a></li>
                                <li><a href="typography.html">Typography</a></li>
                            </ul>
                        </li>
                        <li><a href="mail.html"><span data-hover="Mail Us">Mail Us</span></a></li>
                    </ul>
                </nav>

            </div>
            <div class="w3_agile_search">
                <form action="#" method="post">
                    <input type="search" name="Search" placeholder="Search Keywords..." required=""/>
                    <input type="submit" value="Search">
                </form>

            </div>
        </nav>
    </div>

<div class="b-profile">
    <form method="POST" enctype="multipart/form-data" accept-charset="UTF-8" id="userEditForm">
        <fieldset>
            <legend>
                Ваш профиль:
            </legend>
            <input type="file" name="file" id="file">
            <div class="input-gr">
                <label for="userlogin">
                    <span class="l-text">Логин</span>
                    <span class="fa fa-user hide"></span>
                </label>
                <input class="dis-def" type="text" id="userlogin" value="<#if model.user.login??>${model.user.login}</#if>" name="login">
            </div>
            <div class="input-gr">
                <label for="userlogin">
                    <span class="l-text">Имя</span>
                    <span class="fa fa-user hide"></span>
                </label>
                <input class="dis-def" type="text" id="userlogin" value="<#if model.user.name??>${model.user.name}</#if>" name="name">
            </div>

            <div class="input-gr">
                <label for="useremail">
                    <span class="l-text">E-mail</span>
                    <span class="fa fa-envelope hide"></span>
                </label>
                <input class="dis-def" type="email" id="useremail" value="${model.user.email}" name="email">
            </div>

            <div class="input-gr">
                <label for="userpassword">
                    <span class="l-text">Пароль</span>
                    <span class="fa fa-lock hide"></span>
                </label>
                <input class="dis-def" type="password" id="userpassword" value="" name="password1">
            </div>

            <div class="input-gr">
                <label for="userpassword">
                    <span class="l-text">Пароль</span>
                    <span class="fa fa-lock hide"></span>
                </label>
                <input class="dis-def" type="password" id="userpassword"
                       value="" name="password2">
            </div>

            <div class="input-gr">
                <label for="userphone">
                    <span class="l-text">Телефон</span>
                    <span class="fa fa-building hide"></span>
                </label>
                <input class="dis-def" type="text" id="userphone" value="<#if model.user.phone??>${model.user.phone}</#if>" name="phone">
            </div>
            <div class="input-gr">
                <label for="usersex">
                    <span class="l-text">Пол</span>
                    <span class="fa fa-building hide"></span>
                </label>
                <input class="dis-def" type="text" id="usersex" value="<#if model.user.sex??>${model.user.sex}</#if>" name="sex">
            </div>
            <#if model.user.role == "CLIENT" >
                <div class="input-gr">
                    <label for="playerDegree">
                        <span class="l-text">Разряд</span>
                        <span class="fa fa-building hide"></span>
                    </label>
                    <input class="dis-def" type="text" id="playerDegree" value="<#if model.client.playerDegree??>${model.client.playerDegree}"</#if>name="playerDegree">
                </div>
            <#elseif model.user.role == "COACH">
                <div class="input-gr">
                    <label for="playerDegree">
                        <span class="l-text">Разряд</span>
                        <span class="fa fa-building hide"></span>
                    </label>
                    <input class="dis-def" type="text"
                           id="playerDegree" value="<#if model.coach.playerDegree??>${model.coach.playerDegree}"</#if>name="playerDegree">
                </div>
            </#if>

        <#if model.user.role == "COACH" >
            <div class="input-gr">
                <label for="coachDegree">
                    <span class="l-text">Категория</span>
                    <span class="fa fa-building hide"></span>
                </label>
                <input class="dis-def" type="text" id="coachDegree" value="<#if model.coach.coachDegree??>${model.coach.coachDegree}"</#if>name="coachDegree">
            </div>
        </#if>
        <#if model.user.role == "STRINGER" >
            <div class="input-gr">
                <label for="userprice">
                    <span class="l-text">Цена</span>
                    <span class="fa fa-building hide"></span>
                </label>
                <input class="dis-def" type="text" id="userprice" value="<#if model.stringer.price??>${model.stringer.price}" </#if> name="price">
            </div>
        </#if>
            <input type="submit" class="def-btn b-e-post__submit" value="Сохранить">
        </fieldset>
    </form>
    <script>
        "use strict";

        function handleFiles(files) {
            var imageType = /^image\//;
            if (!imageType.test(files[0].type.match)) {
                var reader = new FileReader();
                reader.onload = function (e) {

                    profimg.style.backgroundImage = "url(" + e.target.result + ")";
                };
                reader.readAsDataURL(files[0]);
            }
        }
    </script>
</div>
</body>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
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
    <!-- //custom-theme -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="css/mainStyles.css"/>
    <link rel='stylesheet' href='css/dscountdown.css' type='text/css' media='all'/>
    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" property=""/>
    <!-- gallery -->
    <link href="css/lsb.css" rel="stylesheet" type="text/css">
    <!-- //gallery -->
    <!-- font-awesome-icons -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,600i,700,900" rel="stylesheet">

</head>
<body>

<div class="modal-content">
    <div class="modal-header">
    <#if error??>
        <div class="alert alert-info">
            <strong>${error}</strong>
            <br>
        </div>
    </#if>
        <div class="signin-form profile">
            <h3 class="agileinfo_sign">Sign Up</h3>
            <div class="login-form">
                <form action="#" method="post">
                    <input type="text" name="login" placeholder="Username" required="">
                    <input type="email" name="email" placeholder="Email" required="">
                    <input type="password" name="password" placeholder="Password" required="">
                    <input type="password" name="password2" placeholder="Confirm Password" required="">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="remember-me"> Remember Me
                        </label>
                        <label class="pull-right">
                            <a href="#">Forgotten Password?</a>
                        </label>

                    </div>
                    <input type="submit" value="Sign Up">

                </form>
            </div>
            <p><a href="#"> By clicking register, I agree to your terms</a></p>
        </div>
    </div>
</div>
</body>
</html>
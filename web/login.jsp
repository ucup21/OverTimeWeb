<%-- 
    Document   : login
    Created on : Apr 22, 2018, 4:17:20 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="apple-touch-icon" href="apple-icon.png">
        <link rel="shortcut icon" href="favicon.ico">

        <link rel="stylesheet" href="assets/css/normalize.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/flag-icon.min.css">
        <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
        <!-- <link rel="stylesheet" href="assets/css/bootstrap-select.less"> -->
        <link rel="stylesheet" href="assets/scss/style.css">

        <title>Login</title>
    </head>
    <body class="bg-dark">

        <div class="sufee-login d-flex align-content-center flex-wrap">
            <div class="container">
                <div class="login-content">

                    <div class="login-form">
                        <div class="login-logo">
                            <h3 font-color="white">Over-Time</h3>
                        </div>

                        <form action="loginServlet" method="POST">
                            <%if (session.getAttribute("Berhasil") != null) {%>
                            <div class="alert alert-success" role="alert">
                                <%out.print(session.getAttribute("Berhasil") + "<br>");
                                    session.removeAttribute("Berhasil");%>
                            </div>
                            <%} else if (session.getAttribute("Gagal") != null) {%>                                    
                            <div class="alert alert-danger" role="alert">
                                <%out.print(session.getAttribute("Gagal") + "<br>");
                                    session.removeAttribute("Gagal");%>
                            </div>
                            <%}%>     
                            <div class="form-group">
                                <label>Username</label>
                                <input type="text" name="userName" required="" class="form-control" placeholder="Username">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" name="pass" required="" class="form-control" placeholder="Password">
                            </div>
                            <button type="submit" class="btn btn-success btn-flat m-b-30 m-t-30">Sign in</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>


    </body>
</html>

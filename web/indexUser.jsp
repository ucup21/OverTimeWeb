<%-- 
    Document   : indexAfter
    Created on : Apr 24, 2018, 5:38:04 AM
    Author     : hp
--%>

<%@page import="java.util.List"%>
<%@page import="dao.PegawaiMiiDAO"%>
<%@page import="entities.PegawaiMii"%>
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
        <link rel="stylesheet" href="assets/scss/style.css">
        <link href="assets/css/lib/vector-map/jqvmap.min.css" rel="stylesheet">
        <title>Over-Time</title>
    </head>
    <body>
        <aside id="left-panel" class="left-panel">
            <nav class="navbar navbar-expand-sm navbar-default">

                <div class="navbar-header">
                    <a class="navbar-brand" href="homeServlet">Over-Time</a>
                    <a class="navbar-brand hidden" href="homeServlet">O</a>
                </div>

                <div id="main-menu" class="main-menu collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="homeServletUser"> <i class="menu-icon ti-home"></i>Home </a>
                        </li>
                        <h3 class="menu-title">Laporan</h3><!-- /.menu-title -->
                        <li>
                            <a href="view/reportBulanNip_1.jsp"> <i class="menu-icon ti-book"></i>Laporan Lembur Pegawai</a>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </nav>
        </aside><!-- /#left-panel -->

        <!-- Left Panel -->

        <!-- Right Panel -->

        <div id="right-panel" class="right-panel">
            <% String loginUsername = (String) session.getAttribute("login");%>
            <!-- Header-->
            <header id="header" class="header">

                <div class="header-menu">

                    <div class="col-sm-7">
                        <a id="menuToggle" class="menutoggle pull-left"><i class="fa fa fa-tasks"></i></a>

                    </div>

                    <div class="col-sm-5">

                        <div class="user-area dropdown float-right">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img class="user-avatar rounded-circle" src="images/admin.jpg" alt="User Avatar">
                            </a>

                            <div class="user-menu dropdown-menu">
                                <a class="nav-link" href="" data-toggle="modal" data-target="#editPassword<%= loginUsername%>"><i class="fa fa- user"></i>Ubah Password</a>
                                <a class="nav-link" href="logoutServlet"><i class="fa fa-power -off"></i>Logout</a>
                            </div>

                        </div>
                    </div>
                </div>


                <div class="modal fade" id="editPassword<%= loginUsername%>" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true" data-backdrop="static">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editModalLabel">Ganti Password</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="ubahPasswordServlet" method="POST">
                                <div class="modal-body">
                                    <input type="hidden"  required class="form-control" name="username" value="<%= loginUsername%>">
                                    
                                    <div  class="col-md-12">
                                        <div class="form-group">
                                            <label>Password Lama</label>
                                            <input type="password"  required class="form-control" name="passwordLama" placeholder="Masukkan password lama" value="">
                                        </div>
                                    </div>
                                    <div  class="col-md-12">
                                        <div class="form-group">
                                            <label>Password Baru</label>
                                            <input type="password" required class="form-control" name="passwordBaru" placeholder="Masukan password baru" value="">
                                        </div>
                                    </div>
                                    <div  class="col-md-12">
                                        <div class="form-group">
                                            <label>Konfirmasi Password Baru</label>
                                            <input type="password" required class="form-control" name="konfirmasipasswordBaru" placeholder="Masukan konfirmasi password baru" value="">
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-primary">Ubah </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </header><!-- /header -->


            <div class="content mt-3">
                <div class="animated fadeIn">
                    <%if (session.getAttribute("berhasil") != null) {%>
                    <div class="alert alert-success" role="alert">
                        <%out.print(session.getAttribute("berhasil") + "<br>");
                            session.removeAttribute("berhasil");%>
                    </div>
                    <%} else if (session.getAttribute("gagal") != null) {%>                                    
                    <div class="alert alert-danger" role="alert">
                        <%out.print(session.getAttribute("gagal") + "<br>");
                            session.removeAttribute("gagal");%>
                    </div>
                    <%}%>      

                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <h1 align="center">~ Selamat Datang Di Web Over-Time ~</h1>
                </div>
            </div>
        </div><!-- /#right-panel -->

        <!-- Right Panel -->

        <script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>


        <script src="assets/js/popper.min.js"></script>


        <script src="assets/js/lib/chart-js/Chart.bundle.js"></script>
        <script src="assets/js/dashboard.js"></script>
        <script src="assets/js/widgets.js"></script>
        <script src="assets/js/lib/vector-map/jquery.vmap.js"></script>
        <script src="assets/js/lib/vector-map/jquery.vmap.min.js"></script>
        <script src="assets/js/lib/vector-map/jquery.vmap.sampledata.js"></script>
        <script src="assets/js/lib/vector-map/country/jquery.vmap.world.js"></script>
        <script>
            (function ($) {
                "use strict";

                jQuery('#vmap').vectorMap({
                    map: 'world_en',
                    backgroundColor: null,
                    color: '#ffffff',
                    hoverOpacity: 0.7,
                    selectedColor: '#1de9b6',
                    enableZoom: true,
                    showTooltip: true,
                    values: sample_data,
                    scaleColors: ['#1de9b6', '#03a9f5'],
                    normalizeFunction: 'polynomial'
                });
            })(jQuery);
        </script>
    </body>
</html>

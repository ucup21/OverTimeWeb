<%-- 
    Document   : indexAfter
    Created on : Apr 24, 2018, 5:38:04 AM
    Author     : hp
--%>

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
                            <a href="homeServlet"> <i class="menu-icon ti-home"></i>Home </a>
                        </li>
                        <h3 class="menu-title">Master</h3><!-- /.menu-title -->
                        <li>
                            <a href="jabatanServlet"> <i class="menu-icon ti-bag"></i>Jabatan </a>
                        </li>
                        <li>
                            <a href="pegawaiServlet"> <i class="menu-icon ti-user"></i>Pegawai </a>
                        </li>
                        <li>
                            <a href="jenisLemburServlet"> <i class="menu-icon ti-agenda"></i>Jenis Lembur </a>
                        </li>
                        <li>
                            <a href="detailJabatanLemburServlet"> <i class="menu-icon ti-clipboard"></i>Detail Jenis Lembur </a>
                        </li>
                        <h3 class="menu-title">Transaksi</h3><!-- /.menu-title -->
                        <li>
                            <a href="detailLemburServlet"> <i class="menu-icon ti-write"></i>Detail Lembur Pegawai </a>
                        </li>
                        <h3 class="menu-title">Laporan</h3><!-- /.menu-title -->
                        <li>
                            <a href="view/report.jsp"> <i class="menu-icon ti-book"></i>Laporan Lembur Bulanan </a>
                            <a href="view/reportBulanNip.jsp"> <i class="menu-icon ti-book"></i>Laporan Lembur Pegawai</a>
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
                                <% Object datas = session.getAttribute("nama");
                                PegawaiMii mii = (PegawaiMii) datas; %>
                                <button class="btn btn-dark"><%= mii.getNama()%></button>
                            </a>

                            <div class="user-menu dropdown-menu">
                                
                                <a class="nav-link" href="logoutServlet"><i class="fa fa-power -off"></i>Logout</a>
                            </div>

                        </div>
                    </div>
                </div>

            </header><!-- /header -->


            <div class="content mt-3">
                <div class="animated fadeIn">
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

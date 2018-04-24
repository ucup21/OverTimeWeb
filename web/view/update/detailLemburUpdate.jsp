<%-- 
    Document   : detailLemburUpdate
    Created on : Apr 18, 2018, 10:13:00 AM
    Author     : hp
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="dao.PegawaiMiiDAO"%>
<%@page import="entities.PegawaiMii"%>
<%@page import="entities.JenisLembur"%>
<%@page import="dao.JenisLemburDAO"%>
<%@page import="java.util.List"%>
<%@page import="entities.DetailLembur"%>
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
        <link rel="stylesheet" href="assets/css/lib/datatable/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="assets/scss/style.css">
        <title>Detail Lembur Update</title>
    </head>
    <body>
        <aside id="left-panel" class="left-panel">
            <nav class="navbar navbar-expand-sm navbar-default">

                <div class="navbar-header">
                    <a class="navbar-brand" href="./">Over-Time</a>
                    <a class="navbar-brand hidden" href="./">O</a>
                </div>

                <div id="main-menu" class="main-menu collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="index.html"> <i class="menu-icon ti-home"></i>Home </a>
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
                        <li class="active">
                            <a href="detailLemburServlet"> <i class="menu-icon ti-write"></i>Detail Lembur Pegawai </a>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </nav>
        </aside><!-- /#left-panel -->

        <div id="right-panel" class="right-panel">

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
                                <a class="nav-link" href="#"><i class="fa fa- user"></i>My Profile</a>

                                <a class="nav-link" href="#"><i class="fa fa- user"></i>Notifications <span class="count">13</span></a>

                                <a class="nav-link" href="#"><i class="fa fa -cog"></i>Settings</a>

                                <a class="nav-link" href="#"><i class="fa fa-power -off"></i>Logout</a>
                            </div>
                        </div>

                        <div class="language-select dropdown" id="language-select">
                            <a class="dropdown-toggle" href="#" data-toggle="dropdown"  id="language" aria-haspopup="true" aria-expanded="true">
                                <i class="flag-icon flag-icon-us"></i>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="language" >
                                <div class="dropdown-item">
                                    <span class="flag-icon flag-icon-fr"></span>
                                </div>
                                <div class="dropdown-item">
                                    <i class="flag-icon flag-icon-es"></i>
                                </div>
                                <div class="dropdown-item">
                                    <i class="flag-icon flag-icon-us"></i>
                                </div>
                                <div class="dropdown-item">
                                    <i class="flag-icon flag-icon-it"></i>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </header><!-- /header -->
            <!-- Header-->

            <div class="breadcrumbs">
                <div class="col-sm-4">
                    <div class="page-header float-left">
                        <div class="page-title">
                            <h1>Transaksi</h1>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="page-header float-right">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li><a href="index.html">Home</a></li>
                                <li><a href="detailJabatanLemburServlet">Detail Jenis Lembur</a></li>
                                <li class="active">Update Detail Jenis Lembur</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content mt-3">
                <div class="animated fadeIn">
                    <div class="row">

                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h1 align="center">Update Detail Jenis Lembur</h1>
                                </div>
                                <br>
                                <form action="detailLemburUpdate" method="POST">
                                    <% DetailLembur detailLembur = (DetailLembur) session.getAttribute("detailLembur");%>
                                    <div class="col-md-6">
                                        <div class="row">
                                            <div  class="col-md-12">
                                                <div class="form-group">
                                                    <label for="kdDetailLembur">Kode Detail Lembur</label>
                                                    <input type="text" readonly class="form-control" name="kdDetailLembur" placeholder="Masukkan kode detail lembur" value="<%= detailLembur.getKdDetailLembur()%>">
                                                </div>
                                            </div>
                                            <div  class="col-md-12">
                                                <div class="form-group">
                                                    <label for="lamaLembur">Lama Lembur</label>
                                                    <!--<input type="text" class="form-control" name="lamaLembur" placeholder="Masukan lama lembur" value="<%= detailLembur.getKdLembur().getLamaLembur()%>">-->
                                                    <select name="lamaLembur" class="form-control">
                                                        <%
                                                            List<Object> datas1 = new JenisLemburDAO().getAll();
                                                            for (Object data : datas1) {
                                                                JenisLembur lembur = (JenisLembur) data;
                                                                if (detailLembur.getKdLembur().getLamaLembur().equals(lembur.getLamaLembur())) {%>
                                                                    <option value="<%= lembur.getKdLembur() %>" selected><%= lembur.getLamaLembur() %> </option><%
                                                                } else {%>
                                                                    <option value="<%= lembur.getKdLembur()%>"><%= lembur.getLamaLembur() %></option>
                                                                <%
                                                                }
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div  class="col-md-12">
                                                <div class="form-group">
                                                    <label for="nmPegawai">Nama Pegawai</label>
                                                    <!--<input type="text" class="form-control" name="nmPegawai" placeholder="Masukan nama Anda" value="<%= detailLembur.getNip().getNama()%>">-->
                                                    <select name="nmPegawai" class="form-control">
                                                        <%
                                                            List<Object> datas2 = new PegawaiMiiDAO().getAll();
                                                            for (Object data : datas2) {
                                                                PegawaiMii mii = (PegawaiMii) data;
                                                                if (detailLembur.getNip().getNama().equals(mii.getNama())) {%>
                                                                    <option value="<%= mii.getNip() %>" selected><%= mii.getNama() %> </option><%
                                                                } else {%>
                                                                    <option value="<%= mii.getNip()%>"><%= mii.getNama() %></option>
                                                                <%
                                                                }
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div  class="col-md-12">
                                                <div class="form-group">
                                                    <label for="tglLembur">Tanggal Lembur</label>
                                                    <% DateFormat date = new SimpleDateFormat("yyyy-mm-dd");
                                                    String tgl = date.format(detailLembur.getTglLembur()); %>
                                                    <input type="date" class="form-control" name="tglLembur" placeholder="Masukan tanggal lembur" value="<%= tgl%>">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <input type="submit" value="Simpan" class="btn btn-primary">
                                        </div>


                                    </div>
                                </form>
                            </div>
                        </div>
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

<%-- 
    Document   : pegawaiUpdate
    Created on : Apr 17, 2018, 11:18:59 PM
    Author     : hp
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="entities.Jabatan"%>
<%@page import="dao.JabatanDAO"%>
<%@page import="java.util.List"%>
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
        <link rel="stylesheet" href="assets/css/lib/datatable/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="assets/scss/style.css">
        <title>Pegawai Update</title>

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
                        <li class="active">
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
                            <h1>Master</h1>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="page-header float-right">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li><a href="index.html">Home</a></li>
                                <li><a href="pegawaiServlet">Pegawai</a></li>
                                <li class="active">Update Pegawai</li>
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
                                    <h1 align="center">Update Pegawai</h1>
                                </div>
                                <br>
                                
                                <form action="pegawaiUpdate" method="POST">
                                    <% PegawaiMii mii = (PegawaiMii) session.getAttribute("pegawai");%>
                                    <div class="col-md-6">
                                        <div class="row">
                                            <div  class="col-md-12">
                                                <div class="form-group">
                                                    <label for="nip">Nomor Induk Pegawai</label>
                                                    <input type="text"  readonly class="form-control" name="nip" placeholder="Masukkan nip Anda" value="<%= mii.getNip()%>">
                                                </div>
                                            </div>
                                            <div  class="col-md-12">
                                                <div class="form-group">
                                                    <label for="nmJabatan">Nama Jabatan</label>
                                                    <select name="cmbJabatan" class="form-control">

                                                        <%
                                                            List<Object> datas2 = new JabatanDAO().getAll();
                                                            //                    List<Object> datas2 = (List<Object>) session.getAttribute("dataJabatan");
                                                            for (Object data : datas2) {
                                                                Jabatan jabatan = (Jabatan) data;
                                                                if (mii.getKdJabatan().getKdJabatan().equals(jabatan.getKdJabatan())) {%>
                                                        <option value="<%= jabatan.getKdJabatan()%>" selected><%= jabatan.getNamaJabatan()%> </option><%
                                                        } else {%>
                                                        <option value="<%= jabatan.getKdJabatan()%>"><%= jabatan.getNamaJabatan()%></option>
                                                        <%
                                                                }
                                                            }
                                                        %>

                                                    </select>
                                                </div>
                                            </div>
                                            <div  class="col-md-12">
                                                <div class="form-group">
                                                    <label for="nmLengkap">Nama Lengkap</label>
                                                    <input type="text" class="form-control" name="nmLengkap" placeholder="Masukan nama lengkap" value="<%= mii.getNama()%>">
                                                </div>
                                            </div>
                                            <div  class="col-md-12">
                                                <div class="form-group">
                                                    <label for="jk">Jenis Kelamin</label>
                                                    <%
                                                        if (mii.getJk().equals("Laki-Laki")) {%>
                                                    <input type="radio" name="jk" value="Laki-Laki" checked="checked" />Laki-Laki<br>
                                                    <input type="radio" name="jk" value="Perempuan" />Perempuan<%
                                                    } else {%>
                                                    <input type="radio" name="jk" value="Laki-Laki" />Laki-Laki
                                                    <input type="radio" name="jk" value="Perempuan" checked="checked" />Perempuan<br><%
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="row">
                                            <div  class="col-md-12">
                                                <div class="form-group">
                                                    <label for="alamat">Alamat</label>
                                                    <input type="text" class="form-control" name="alamat" placeholder="Masukkan alamat Anda" value="<%= mii.getAlamat()%>">
                                                </div>
                                            </div>
                                            <div  class="col-md-12">
                                                <div class="form-group">
                                                    <label for="tmptLahir">Tempat Lahir</label>
                                                    <input type="text" class="form-control" name="tmptLahir" placeholder="Masukan tempat lahir anda" value="<%= mii.getTmptLahir()%>">
                                                </div>
                                            </div> 
                                            <div  class="col-md-12">
                                                <div class="form-group">
                                                    <label for="tglLahir">Tanggal Lahir</label>
                                                    <% DateFormat date = new SimpleDateFormat("yyyy-MM-dd");
                                                    String tgl = date.format(mii.getTglLahir()); %>
                                                    <input type="date" class="form-control datepicker" name="tglLahir" placeholder="Masukan tanggal lahir anda" value="<%= tgl %>">
                                                </div>
                                            </div>      
                                            <div class="col-md-5">

                                            </div>
                                            <div class="col-md-3">
                                                <br>
                                                <div class="form-group">
                                                    <input type="submit" value="Edit" class="btn btn-primary">
                                                </div>
                                            </div>
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

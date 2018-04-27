<%-- 
    Document   : jenisLembur
    Created on : Apr 16, 2018, 4:26:58 PM
    Author     : Asus
--%>

<%@page import="entities.PegawaiMii"%>
<%@page import="dao.DetailDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.DetailLembur"%>
<%@page import="dao.DetailLemburDAO"%>
<%@page import="entities.JenisLembur"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="apple-touch-icon" href="apple-icon.png">
        <link rel="shortcut icon" href="favicon.ico">
        <link rel="stylesheet" href="../assets/css/normalize.css">
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="../assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="../assets/css/themify-icons.css">
        <link rel="stylesheet" href="../assets/css/flag-icon.min.css">
        <link rel="stylesheet" href="../assets/css/cs-skin-elastic.css">
        <link rel="stylesheet" href="../assets/css/lib/datatable/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="../assets/scss/style.css">
        <title>Laporan Lembur Bulanan</title>
    </head>
    <body>
         <% 
            if (session.getAttribute("login") == null) {
                response.sendRedirect("../login.jsp");
            }
            
        %>
        <aside id="left-panel" class="left-panel">
            <nav class="navbar navbar-expand-sm navbar-default">

                <div class="navbar-header">
                    <a class="navbar-brand" href="../homeServlet">Over-Time</a>
                    <a class="navbar-brand hidden" href="../homeServlet">O</a>
                </div>

                <div id="main-menu" class="main-menu collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="../homeServlet"> <i class="menu-icon ti-home"></i>Home </a>
                        </li>
                        <h3 class="menu-title">Master</h3><!-- /.menu-title -->
                        <li>
                            <a href="../jabatanServlet"> <i class="menu-icon ti-bag"></i>Jabatan </a>
                        </li>
                        <li>
                            <a href="../pegawaiServlet"> <i class="menu-icon ti-user"></i>Pegawai </a>
                        </li>
                        <li>
                            <a href="../jenisLemburServlet"> <i class="menu-icon ti-agenda"></i>Jenis Lembur </a>
                        </li>
                        <li>
                            <a href="detailJabatanLemburServlet"> <i class="menu-icon ti-clipboard"></i>Detail Jenis Lembur </a>
                        </li>
                        <h3 class="menu-title">Transaksi</h3><!-- /.menu-title -->
                        <li>
                            <a href="../detailLemburServlet"> <i class="menu-icon ti-write"></i>Detail Lembur Pegawai </a>
                        </li>
                        <h3 class="menu-title">Laporan</h3><!-- /.menu-title -->
                        <li class="active">
                            <a href="report.jsp"> <i class="menu-icon ti-book"></i>Laporan Lembur Bulanan </a>
                        </li>
                        <li>
                            <a href="reportBulanNip.jsp"> <i class="menu-icon ti-book"></i>Laporan Lembur Pegawai</a>
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
                                <% Object datas10 = session.getAttribute("nama");
                                PegawaiMii mii10 = (PegawaiMii) datas10; %>
                                <button class="btn btn-dark"><%= mii10.getNama() %></button>
                            </a>

                            <div class="user-menu dropdown-menu">

                                <a class="nav-link" href="../logoutServlet"><i class="fa fa-power -off"></i>Logout</a>
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
                            <h1>Laporan</h1>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="page-header float-right">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li><a href="../index.jsp">Home</a></li>
                                <li class="active">Laporan Lembur Bulanan</li>
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
                                    <h1 align="center">Report Berdasarkan Bulan</h1>
                                </div>

                                <br>

                                <form action="" method="POST">
                                    <div class="col-md-6">
                                        <select name="cmbBulan" class="form-control" required>
                                            <option value="">Pilih Bulan</option>
                                            <option value="-01-">Januari</option>
                                            <option value="-02-">Februari</option>
                                            <option value="-03-">Maret</option>
                                            <option value="-04-">April</option>
                                            <option value="-05-">Mei</option>
                                            <option value="-06-">Juni</option>
                                            <option value="-07-">Juli</option>
                                            <option value="-08-">Agustus</option>
                                            <option value="-09-">September</option>
                                            <option value="-10-">Oktober</option>
                                            <option value="-11-">November</option>
                                            <option value="-12-">Desember</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <button class="btn-primary" type="submit" value="Cetak" target="_blank">Tampil</button>
                                    </div>
                                </form>
                                <br>

                            </div>
                            <div class="card">
                                <br>
                                <% String bulan = request.getParameter("cmbBulan"); %>
                                <form action="cetakPdf.jsp" target="_blank">
                                    <input type="hidden" value="<%= bulan %>" name="Bulan" />
                                    <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                    
                                            <th>No</th>
                                            <th>Kode Detail Lembur</th>
                                            <th>Lama Lembur</th>
                                            <th>Nama Pegawai</th>
                                            <th>Tanggal Lembur</th>
                                            <th>Upah</th>
                                        </tr>
                                    </thead>
                                    <%
//                                        String bulan = request.getParameter("cmbBulan");
                                        List<Object> datas = new DetailLemburDAO().report("tgl_lembur", bulan);
//                                        List<Object> datas = (List<Object>) session.getAttribute("dataDetailLembur");
                                        int i = 1;
                                        for (Object data : datas) {
                                            DetailLembur dl = (DetailLembur) data;
                                            String date = null;
                                            date = new SimpleDateFormat("EEEE,dd MMMM yyyy", new java.util.Locale("id")).format(dl.getTglLembur());
                                            Long upah = new DetailDAO().upah(dl.getNip().getKdJabatan().getKdJabatan(), dl.getKdLembur().getKdLembur());
                                    %>
                                    <tr>
                                        <td><%= i%></td>
                                        <td><%= dl.getKdDetailLembur()%></td>
                                        <td><%= dl.getKdLembur().getLamaLembur()%>&nbsp;jam</td>
                                        <td><%= dl.getNip().getNama()%></td>
                                        <td><%= date%></td>
                                        <td><%= upah%></td>
                                        
                                    </tr>
                                    <% i++;
                                        }%>
                                </table>
                                    <div class="col-md-6">
                                        <button class="btn-primary" type="submit" value="Cetak" target="_blank">Cetak</button>
                                    </div>
                                </form>
                                <br>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="../assets/js/vendor/jquery-2.1.4.min.js"></script>
<script src="../assets/js/popper.min.js"></script>
<script src="../assets/js/plugins.js"></script>
<script src="../assets/js/main.js"></script>
<script src="../assets/js/lib/data-table/datatables.min.js"></script>
<script src="../assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
<script src="../assets/js/lib/data-table/dataTables.buttons.min.js"></script>
<script src="../assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
<script src="../assets/js/lib/data-table/jszip.min.js"></script>
<script src="../assets/js/lib/data-table/pdfmake.min.js"></script>
<script src="../assets/js/lib/data-table/vfs_fonts.js"></script>
<script src="../assets/js/lib/data-table/buttons.html5.min.js"></script>
<script src="../assets/js/lib/data-table/buttons.print.min.js"></script>
<script src="../assets/js/lib/data-table/buttons.colVis.min.js"></script>
<script src="../assets/js/lib/data-table/datatables-init.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#bootstrap-data-table-export').DataTable();
    });
</script>
</body>
</html>

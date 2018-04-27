<%-- 
    Document   : jenisLembur
    Created on : Apr 16, 2018, 4:26:58 PM
    Author     : Asus
--%>

<%@page import="entities.PegawaiMii"%>
<%@page import="entities.JenisLembur"%>
<%@page import="java.util.List"%>
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
        <title>Jenis Lembur</title>
    </head>
    <body>
        <% String autoId = (String) session.getAttribute("autoID"); %>
        <aside id="left-panel" class="left-panel">
            <nav class="navbar navbar-expand-sm navbar-default">

                <div class="navbar-header">
                    <a class="navbar-brand" href="homeServlet">Over-Time</a>
                    <a class="navbar-brand hidden" href="homeServlet">O</a>
                </div>

                <div id="main-menu" class="main-menu collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="homeServlet"> <i class="menu-icon ti-home"></i>Home </a>
                        </li>
                        <h3 class="menu-title">Master</h3><!-- /.menu-title -->
                        <li>
                            <a href="jabatanServlet"> <i class="menu-icon ti-bag"></i>Jabatan </a>
                        </li>
                        <li>
                            <a href="pegawaiServlet"> <i class="menu-icon ti-user"></i>Pegawai </a>
                        </li>
                        <li class="active">
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

                                <a class="nav-link" href="logoutServlet"><i class="fa fa-power -off"></i>Logout</a>
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
                                <li><a href="index.jsp">Home</a></li>
                                <li class="active">Jenis Lembur</li>
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
                                    <h1 align="center">Jenis Lembur</h1>
                                </div>
                                <br>
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

                                <div class="col-md-6">
                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#tambahModal"><i class="ti-file"></i> Tambah </button>
                                </div>
                                <br>
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Kode Jenis Lembur</th>
                                            <th>Lama Lembur</th>
                                            <th>Aksi</th>
                                        </tr>
                                    </thead>
                                    <%
                                        //                List<Object> datas = new DepartmentsDAO().getAll();
                                        List<Object> datas = (List<Object>) session.getAttribute("dataJenisLembur");
                                        int i = 1;
                                        for (Object data : datas) {
                                            JenisLembur j = (JenisLembur) data;
                                            String manager = "";%>

                                    <tr>
                                        <td><%= i%></td>
                                        <td><%= j.getKdLembur()%></td>
                                        <td><%= j.getLamaLembur()%>&nbsp;jam</td>
                                        <td width="80px">
                                    <center><button class="btn btn-danger btn-sm ti-pencil-alt" data-toggle="modal" data-target="#Update<%= j.getKdLembur()%>" title="Edit"></button>
                                        <button class="btn btn-danger btn-sm ti-close" data-toggle="modal" data-target="#Delete<%= j.getKdLembur()%>" title="Delete"></button></center></td>
                                    </tr>
                                    <% i++;
                                        }%>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!--modal insert-->
                <div class="modal fade" id="tambahModal" tabindex="-1" role="dialog" aria-labelledby="tambahModalLabel" aria-hidden="true" data-backdrop="static">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="tambahModalLabel">Tambah Data</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="jenisLemburInsert" method="POST">
                                <div class="modal-body">
                                    <div  class="col-md-12">
                                        <div class="form-group">
                                            <label for="kdJenisLembur">Kode Jenis Lembur</label>
                                            <input type="text" readonly class="form-control" name="kdJenisLembur" placeholder="Masukkan kode jenis lembur" value="<%= autoId%>">
                                        </div>
                                    </div>
                                    <div  class="col-md-12">
                                        <div class="form-group">
                                            <label for="lamaLembur">Lama Lembur</label>
                                            <input type="text" class="form-control" name="lamaLembur" placeholder="Masukan lama lembur">
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-primary">Simpan </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <%
                    //                List<Object> datas = new DepartmentsDAO().getAll();
                    List<Object> datas1 = (List<Object>) session.getAttribute("dataJenisLembur");
                    for (Object data : datas1) {
                        JenisLembur j = (JenisLembur) data;
                %>
                <!--modal delete-->
                <div class="modal fade" id="Delete<%= j.getKdLembur()%>" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="confirmDeleteLabel">Delete </h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>Apakah Anda Yakin Ingin Menghapus??</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                <a href="jenisLemburDelete?id=<%= j.getKdLembur()%>" class="btn btn-danger">Hapus</a>
                            </div>
                        </div>
                    </div>
                </div> 

                <!--modal update-->
                <div class="modal fade" id="Update<%= j.getKdLembur()%>" tabindex="-1" role="dialog" aria-labelledby="updateModelLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="updateModelLabel"> Update </h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="jenisLemburUpdate" method="POST">
                                <div class="modal-body">
                                    <div  class="col-md-12">
                                        <div class="form-group">
                                            <label for="kdJenisLembur">Kode Jenis Lembur</label>
                                            <input type="text" readonly class="form-control" name="kdJenisLembur" placeholder="Masukkan kode jenis lembur" value="<%= j.getKdLembur()%>">
                                        </div>
                                    </div>
                                    <div  class="col-md-12">
                                        <div class="form-group">
                                            <label for="lamaLembur">Lama Lembur</label>
                                            <input type="text" class="form-control" name="lamaLembur" placeholder="Masukan lama lembur" value="<%= j.getLamaLembur()%>">
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-primary">Simpan </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div> 
                <%}%>

            </div>
        </div>
        <script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>
        <script src="assets/js/lib/data-table/datatables.min.js"></script>
        <script src="assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
        <script src="assets/js/lib/data-table/dataTables.buttons.min.js"></script>
        <script src="assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
        <script src="assets/js/lib/data-table/jszip.min.js"></script>
        <script src="assets/js/lib/data-table/pdfmake.min.js"></script>
        <script src="assets/js/lib/data-table/vfs_fonts.js"></script>
        <script src="assets/js/lib/data-table/buttons.html5.min.js"></script>
        <script src="assets/js/lib/data-table/buttons.print.min.js"></script>
        <script src="assets/js/lib/data-table/buttons.colVis.min.js"></script>
        <script src="assets/js/lib/data-table/datatables-init.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#bootstrap-data-table-export').DataTable();
            });
        </script>
    </body>
</html>

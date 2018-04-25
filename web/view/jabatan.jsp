<%-- 
    Document   : jabatan
    Created on : Apr 16, 2018, 4:38:10 PM
    Author     : hp
--%>

<%@page import="entities.Jabatan"%>
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

        <title>Daftar Jabatan</title>
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
                        <li>
                            <a href="homeServlet"> <i class="menu-icon ti-home"></i>Home </a>
                        </li>
                        <h3 class="menu-title">Master</h3><!-- /.menu-title -->
                        <li class="active">
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
                                <li class="active">Jabatan</li>
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
                                    <h1 align="center">Daftar Jabatan</h1>
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
                                            <th>Kode Jabatan</th>
                                            <th>Nama jabatan</th>
                                            <th>Aksi</th> 
                                        </tr>
                                    </thead>
                                    <%
                                        //                List<Object> datas = new DepartmentsDAO().getAll();
                                        List<Object> datas = (List<Object>) session.getAttribute("dataJabatan");
                                        int i = 1;
                                        for (Object data : datas) {
                                            Jabatan jabatan = (Jabatan) data;
                                    %>

                                    <tr>
                                        <td><center><%= i++%></center></td>
                                    <td><%= jabatan.getKdJabatan()%></td>                    
                                    <td><%= jabatan.getNamaJabatan()%></td>
                                    <td width="80px">
                                    <center><button class="btn btn-danger btn-sm ti-pencil-alt" data-toggle="modal" data-target="#Update<%= jabatan.getKdJabatan()%>"></button>
                                        <button class="btn btn-danger btn-sm ti-close" data-toggle="modal" data-target="#Delete<%= jabatan.getKdJabatan()%>"></button></center></td>
                                    </tr>
                                    <% }%>
                                    </tr>
                                </table>
                                <br>
                            </div>
                        </div>
                    </div>
                </div><!-- .animated -->

                <!--modal tambah-->
                <div class="modal fade" id="tambahModal" tabindex="-1" role="dialog" aria-labelledby="tambahModalLabel" aria-hidden="true" data-backdrop="static">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="tambahModalLabel">Tambah Data</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="jabatanInsert" method="POST">
                                <div class="modal-body">
                                    <div  class="col-md-12">
                                        <div class="form-group">
                                            <label for="kdJabatan">Kode Jabatan</label>
                                            <input type="text"  required class="form-control" name="kdJabatan" placeholder="Masukkan kode jabatan" value="">
                                        </div>
                                    </div>
                                    <div  class="col-md-12">
                                        <div class="form-group">
                                            <label for="nmJabatan">Nama Jabatan</label>
                                            <input type="text" required class="form-control" name="nmJabatan" placeholder="Masukan nama jabatan" value="">
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
                    List<Object> datas1 = (List<Object>) session.getAttribute("dataJabatan");
                    for (Object data : datas1) {
                        Jabatan jabatan = (Jabatan) data;
                %>
                <!--modal delete-->
                <div class="modal fade" id="Delete<%= jabatan.getKdJabatan()%>" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
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
                                <a href="jabatanDelete?id=<%= jabatan.getKdJabatan()%>" class="btn btn-danger">Hapus</a>
                            </div>
                        </div>
                    </div>
                </div> 

                <!--modal update-->
                <div class="modal fade" id="Update<%= jabatan.getKdJabatan()%>" tabindex="-1" role="dialog" aria-labelledby="updateModelLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="updateModelLabel"> Update </h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="jabatanUpdate" method="POST">
                                <div class="modal-body">
                                    <div  class="col-md-12">
                                        <div class="form-group">
                                            <label for="kdJabatan">Kode Jabatan</label>
                                            <input type="text" readonly class="form-control" name="kdJabatan" placeholder="Masukkan kode jabatan" value="<%= jabatan.getKdJabatan()%>">
                                        </div>
                                    </div>
                                    <div  class="col-md-12">
                                        <div class="form-group">
                                            <label for="nmJabatan">Nama Jabatan</label>
                                            <input type="text" class="form-control" name="nmJabatan" placeholder="Masukan nama jabatan" value="<%= jabatan.getNamaJabatan()%>">
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

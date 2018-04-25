<%-- 
    Document   : detailLemburJabatan
    Created on : Apr 16, 2018, 4:48:19 PM
    Author     : hp
--%>

<%@page import="entities.Jabatan"%>
<%@page import="dao.JabatanDAO"%>
<%@page import="dao.JenisLemburDAO"%>
<%@page import="entities.JenisLembur"%>
<%@page import="dao.DetailDAO"%>
<%@page import="entities.Detail"%>
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
        <title>Detail Lembur Jabatan</title>
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
                        <li>
                            <a href="jabatanServlet"> <i class="menu-icon ti-bag"></i>Jabatan </a>
                        </li>
                        <li>
                            <a href="pegawaiServlet"> <i class="menu-icon ti-user"></i>Pegawai </a>
                        </li>
                        <li>
                            <a href="jenisLemburServlet"> <i class="menu-icon ti-agenda"></i>Jenis Lembur </a>
                        </li>
                        <li class="active">
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
                                <li class="active">Detail Jenis Lembur</li>
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
                                    <h1 align="center">Detail Jenis Lembur</h1>
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
                                </br>
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th><center>No.</center></th>
                                    <th><center>Nama Jabatan</center></th>
                                    <th><center>Lama Lembur</center></th>
                                    <th><center>Tarif</center></th>
                                    <th><center>Aksi</center></th>
                                    </tr>
                                    </thead>
                                    <%
                                        //                List<Object> datas = new DepartmentsDAO().getAll();
                                        List<Object> datas = (List<Object>) session.getAttribute("dataDetailjabatanLembur");
                                        int i = 1;
                                        for (Object data : datas) {
                                            Detail detail = (Detail) data;

                                    %>
                                    <tr>
                                        <td><center><%= i++%></td>
                                        <td><%= detail.getJabatan().getNamaJabatan()%></td>                    
                                        <td><center><%= detail.getJenisLembur().getLamaLembur()%></center></td>
                                        <td><center><%= detail.getTarif()%></center></td>
                                        <td width="80px">
                                        <center><button class="btn btn-danger btn-sm ti-pencil-alt" data-toggle="modal" data-target="#Update<%= detail.getJabatan().getKdJabatan()%><%=  detail.getJenisLembur().getKdLembur()%>"></button>
                                            <button class="btn btn-danger btn-sm ti-close" data-toggle="modal" data-target="#Delete<%= detail.getJabatan().getKdJabatan()%><%=  detail.getJenisLembur().getKdLembur()%>"></button></center></td>
                                        </tr>
                                        <% }%>
                                </table>

                                <br>
                                <br>

                            </div>
                        </div>
                    </div>
                </div>
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
                            <form action="detailJabatanLemburInsert" method="POST">
                                <div class="modal-body">
                                    <div  class="col-md-12">
                                        <div class="form-group">
                                            <label for="kdJabatan">Nama Jabatan</label>
                                            <%
                                                List<Object> datas5 = new JabatanDAO().getAll();%>
                                            <select name="kdJabatan" class="form-control">
                                                <%
                                                    for (Object data : datas5) {
                                                        Jabatan jabatan = (Jabatan) data;
                                                %>
                                                <option value="<%= jabatan.getKdJabatan()%>"><%= jabatan.getNamaJabatan()%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                    </div>
                                    <div  class="col-md-12">
                                        <div class="form-group">
                                            <label for="kdJenisLembur">Lama Lembur</label>
                                            <%
                                                List<Object> datas4 = new JenisLemburDAO().getAll();%>
                                            <select name="kdJenisLembur" class="form-control">
                                                <%
                                                    for (Object data : datas4) {
                                                        JenisLembur lembur = (JenisLembur) data;
                                                %>
                                                <option value="<%= lembur.getKdLembur()%>"><%= lembur.getLamaLembur()%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                    </div>
                                    <div  class="col-md-12">
                                        <div class="form-group">
                                            <label for="tarif">Tarif</label>
                                            <input type="text" class="form-control" name="tarif" placeholder="Masukan tarif lembur">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
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
                    List<Object> datas1 = (List<Object>) session.getAttribute("dataDetailjabatanLembur");
                    for (Object data : datas1) {
                        Detail detail = (Detail) data;

                %>
                <!--modal delete-->
                <div class="modal fade" id="Delete<%= detail.getJabatan().getKdJabatan()%><%=  detail.getJenisLembur().getKdLembur()%>" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
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
                                <a href="detailLemburJabatanDelete?id=<%= detail.getJabatan().getKdJabatan()%>&ids=<%=  detail.getJenisLembur().getKdLembur()%>" class="btn btn-danger">Hapus</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!--modal update-->
                <div class="modal fade" id="Update<%= detail.getJabatan().getKdJabatan()%><%=  detail.getJenisLembur().getKdLembur()%>" tabindex="-1" role="dialog" aria-labelledby="updateLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="updateLabel">Update </h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="detailJabatanLemburUpdate" method="POST">
                                <div class="modal-body">
                                    <div  class="col-md-12">
                                        <div class="form-group">
                                            <label for="kdJabatan">Nama Jabatan</label>
                                            <select name="kdJabatan" class="form-control">
                                                <%
                                                    List<Object> datas2 = new JabatanDAO().getAll();
                                                    for (Object data1 : datas2) {
                                                        Jabatan jabatan = (Jabatan) data1;
                                                        if (detail.getJabatan().getKdJabatan().equals(jabatan.getKdJabatan())) {%>
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
                                            <label for="kdJenisLembur">Lama Lembur</label>
                                            <select name="kdJenisLembur" class="form-control">
                                                <%
                                                    List<Object> datas3 = new JenisLemburDAO().getAll();
                                                    for (Object data1 : datas3) {
                                                        JenisLembur lembur = (JenisLembur) data1;
                                                        if (detail.getJenisLembur().getLamaLembur().equals(lembur.getLamaLembur())) {%>
                                                <option value="<%= lembur.getKdLembur()%>" selected><%= lembur.getLamaLembur()%> </option><%
                                                } else {%>
                                                <option value="<%= lembur.getKdLembur()%>"><%= lembur.getLamaLembur()%></option>
                                                <%
                                                        }
                                                    }
                                                %>

                                            </select>
                                        </div>
                                    </div>
                                    <div  class="col-md-12">
                                        <div class="form-group">
                                            <label for="tarif">Tarif</label>
                                            <input type="text" class="form-control" name="tarif" placeholder="Masukan tarif lembur" value="<%=detail.getTarif()%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-primary">Simpan</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div> 
                <%}%>
            </div> 
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

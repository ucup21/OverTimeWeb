<%-- 
    Document   : jenisLembur
    Created on : Apr 16, 2018, 4:26:58 PM
    Author     : Asus
--%>

<%@page import="dao.PegawaiMiiDAO"%>
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
        <title>Laporan Lembur Pegawai</title>
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
                    <a class="navbar-brand" href="../homeServletUser">Over-Time</a>
                    <a class="navbar-brand hidden" href="../homeServletUser">O</a>
                </div>

                <div id="main-menu" class="main-menu collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="../homeServletUser"> <i class="menu-icon ti-home"></i>Home </a>
                        </li>
                        <h3 class="menu-title">Laporan</h3><!-- /.menu-title -->
                        <li class="active">
                            <a href="reportBulanNip_1.jsp"> <i class="menu-icon ti-book"></i>Laporan Lembur Pegawai</a>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </nav>
        </aside><!-- /#left-panel -->

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
                                <% Object datas2 = session.getAttribute("nama");
                                PegawaiMii mii = (PegawaiMii) datas2; %>
                                <button class="btn btn-dark"><%= mii.getNama() %></button>
                            </a>

                            <div class="user-menu dropdown-menu">
                                <a class="nav-link" href="" data-toggle="modal" data-target="#editPassword<%= loginUsername%>"><i class="fa fa- user"></i>Ubah Password</a>
                                <a class="nav-link" href="../logoutServlet"><i class="fa fa-power -off"></i>Logout</a>
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
                                <li><a href="../homeServletUser">Home</a></li>
                                <li class="active">Laporan Lembur Pegawai</li>
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
                                        <input type="text" name="nip" class="form-control" value="<%= loginUsername%>" readonly><br>
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
                                <% String bulan = request.getParameter("cmbBulan");
                                    String nipPegawai = request.getParameter("nip");

                                %>
                                <form action="cetakPdfBulanNip.jsp" target="_blank" method="POST">

                                    <input type="hidden" value="<%= bulan%>" name="Bulan" />
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" value="<%= nipPegawai%>" name="Nip" readonly=""/>
                                    </div>
                                    <div class="col-md-12">
                                        <br>
                                        <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>

                                                    <th>No</th>
                                                    <th>Kode Detail Lembur</th>
                                                    <th>Lama Lembur</th>
                                                    <th>Tanggal Lembur</th>
                                                    <th>Upah</th>
                                                </tr>
                                            </thead>
                                            <%
        //                                        String bulan = request.getParameter("cmbBulan");
                                                List<Object> datas = new DetailLemburDAO().reportNip("tgl_lembur", bulan, nipPegawai);
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
                                                <td><%= date%></td>
                                                <td><%= upah%></td>
                                            </tr>
                                            <% i++;
                                        }%>
                                        </table>

                                        <div class="col-md-6">
                                            <button class="btn-primary" type="submit" value="Cetak" target="_blank">Cetak</button>
                                        </div>
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

<%-- 
    Document   : pegawai
    Created on : Apr 16, 2018, 4:24:10 PM
    Author     : hp
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="dao.JabatanDAO"%>
<%@page import="dao.PegawaiMiiDAO"%>
<%@page import="entities.Jabatan"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="entities.PegawaiMii"%>
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

        <title>Daftar Pegawai</title>
    </head>
    <body>
        <% Long autoId = (Long) session.getAttribute("autoID"); %>
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
                        <li  class="active">
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
                                <li class="active">Pegawai</li>
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
                                    <h1 align="center">Daftar Pegawai</h1>
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
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                    </br>
                                    <thead>
                                        <tr>
                                            <th><center>No.</center></th>
                                    <th><center>NIP</center></th>
                                    <th><center>Jabatan</center></th>
                                    <th><center>Nama</center></th>
                                    <th><center>Jenis Kelamin</center></th>
                                    <th><center>Alamat</center></th>
                                    <th><center>Tempat Lahir</center></th>
                                    <th><center>Tanggal Lahir</center></th>
                                    <th><center>Aksi</center></th>
                                    </tr>
                                    </thead>
                                    <%
                                        //                                    List<Object> datas = new PegawaiMiiDAO().getAll();
                                        List<Object> datas = (List<Object>) session.getAttribute("dataPegawai");
                                        int i = 1;
                                        for (Object data : datas) {
                                            PegawaiMii mii = (PegawaiMii) data;
                                            String date = null;
                                            date = new SimpleDateFormat("EEEE,dd MMMM yyyy", new java.util.Locale("id")).format(mii.getTglLahir());
                                    %>

                                    <tr>
                                        <td><%= i++%></td>
                                        <td><%= mii.getNip()%></td>                    
                                        <td><%= mii.getKdJabatan().getNamaJabatan()%></td>
                                        <td><%= mii.getNama()%></td>
                                        <td><%= mii.getJk()%></td>
                                        <td><%= mii.getAlamat()%></td>
                                        <td><%= mii.getTmptLahir()%></td>
                                        <td><%= date%></td>
                                        <td width="80px">
                                    <center><button class="btn btn-danger btn-sm ti-pencil-alt" data-toggle="modal" data-target="#Update<%= mii.getNip()%>"></button>
                                        <button class="btn btn-danger btn-sm ti-close" data-toggle="modal" data-target="#Delete<%= mii.getNip()%>"></button></center></td>

                                    </tr>
                                    <% }%>
                                </table>
                                <br>

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
                            <form action="pegawaiInsert" method="POST">
                                <div class="modal-body">

                                    <div class="col-md-12">
                                        <div class="row">
                                            <div  class="col-md-12">
                                                <div class="form-group">
                                                    <label for="nip">Nomor Induk Pegawai</label>
                                                    <%
                                                        if (autoId == null) {
                                                    %> <input readonly type="text" class="form-control" name="nip" placeholder="Masukkan nip Anda" value="14300"><%
                                                    } else {%>
                                                    <input readonly type="text" class="form-control" name="nip" placeholder="Masukkan nip Anda" value="<%= autoId%>">  <%
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                            <div  class="col-md-12">
                                                <div class="form-group">
                                                    <label for="nmJabatan">Nama Jabatan</label>
                                                    <select name="cmbJabatan" class="form-control">
                                                        <%
                                                            List<Object> datas2 = new JabatanDAO().getAll();
                                                            for (Object data : datas2) {
                                                                Jabatan jabatan = (Jabatan) data;

                                                        %>
                                                        <option value="<%= jabatan.getKdJabatan()%>"><%= jabatan.getNamaJabatan()%></option><%
                                                            }%>
                                                    </select>

                                                </div>
                                            </div>
                                            <div  class="col-md-12">
                                                <div class="form-group">
                                                    <label for="nmLengkap">Nama Lengkap</label>
                                                    <input type="text" class="form-control" name="nmLengkap" placeholder="Masukan nama lengkap">
                                                </div>
                                            </div>
                                            <div  class="col-md-12">
                                                <div class="form-group">
                                                    <label for="jk">Jenis Kelamin</label><br>
                                                    <input type="radio" name="jk" value="Laki-Laki" checked="checked" />Laki-Laki
                                                    &nbsp;&nbsp;&nbsp;<input type="radio" name="jk" value="Perempuan" />Perempuan
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div  class="col-md-12">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <input type="text" class="form-control" name="alamat" placeholder="Masukkan alamat Anda">
                                        </div>
                                    </div>
                                    <div  class="col-md-12">
                                        <div class="form-group">
                                            <label for="tmptLahir">Tempat Lahir</label>
                                            <input type="text" class="form-control" name="tmptLahir" placeholder="Masukan tempat lahir anda">
                                        </div>
                                    </div>  

                                    <div  class="col-md-12">
                                        <div class="form-group">
                                            <label for="tglLahir">Tanggal Lahir</label>
                                            <input type="date" class="form-control" name="tglLahir" placeholder="Masukan tanggal lahir anda">
                                        </div>
                                    </div>
                                    <div  class="col-md-12">
                                        <div class="form-group">
                                            <label>Akses</label>
                                            <select class="form-control" name="akses">
                                                <option value="admin">Admin</option>
                                                <option value="manager">Manager</option>
                                                <option value="pegawai">Pegawai</option>
                                            </select>
                                        </div>
                                    </div>


                                    <div  class="col-md-12"></div>
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
                    //                                    List<Object> datas = new PegawaiMiiDAO().getAll();
                    List<Object> datas1 = (List<Object>) session.getAttribute("dataPegawai");

                    for (Object data : datas1) {
                        PegawaiMii mii = (PegawaiMii) data;
                %>
                <!--modal delete-->
                <div class="modal fade" id="Delete<%= mii.getNip()%>" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
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
                                <a href="pegawaiDelete?id=<%= mii.getNip()%>" class="btn btn-danger">Hapus</a>
                            </div>
                        </div>
                    </div>
                </div> 


                <div class="modal fade" id="Update<%= mii.getNip()%>" tabindex="-1" role="dialog" aria-labelledby="updateModelLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="updateModelLabel"> Update </h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="pegawaiInsert" method="POST">
                                <div class="modal-body"><div  class="col-md-12">
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
                                                    List<Object> datas3 = new JabatanDAO().getAll();
                                                    for (Object data1 : datas3) {
                                                        Jabatan jabatan = (Jabatan) data1;
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
                                            <label for="jk">Jenis Kelamin</label><br>
                                            <%
                                                if (mii.getJk().equals("Laki-Laki")) {%>
                                            <input type="radio" name="jk" value="Laki-Laki" checked="checked" />Laki-Laki   
                                            <input type="radio" name="jk" value="Perempuan" />Perempuan<%
                                            } else {%>
                                            <input type="radio" name="jk" value="Laki-Laki" />Laki-Laki
                                            <input type="radio" name="jk" value="Perempuan" checked="checked" />Perempuan   <%
                                                }
                                            %>
                                        </div>
                                    </div>
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
                                                String tgl = date.format(mii.getTglLahir());%>
                                            <input type="date" class="form-control datepicker" name="tglLahir" placeholder="Masukan tanggal lahir anda" value="<%= tgl%>">
                                        </div>
                                    </div>

                                    <div  class="col-md-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="akses" value="<%= mii.getAkses()%>">
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

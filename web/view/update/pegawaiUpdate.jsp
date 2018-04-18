<%-- 
    Document   : pegawaiUpdate
    Created on : Apr 17, 2018, 11:18:59 PM
    Author     : hp
--%>

<%@page import="entities.PegawaiMii"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="bootstrap-datepicker/bootsrap-datapicker.css"/>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <title>JSP Page</title>

    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" >Over Time</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="#">Home</a></li>
                    <li class="active"><a href="pegawaiServlet">Pegawai</a></li>
                    <li><a href="jabatanServlet">Jabatan</a></li>
                    <li><a href="jenisLemburServlet">Jenis Lembur</a></li>
                    <li><a href="detailLemburServlet">Detail Lembur</a></li>
                    <li><a href="detailJabatanLemburServlet">Detail Jabatan Lembur</a></li>
                </ul>                    
            </div>
        </nav>

        <div class="container">
            <form action="pegawaiUpdate" method="POST">
                <% PegawaiMii mii = (PegawaiMii) session.getAttribute("pegawai");%>
                <div class="col-md-6">
                    <div class="row">
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="nip">Nomor Induk Pegawai</label>
                                <input type="text" readonly class="form-control" name="nip" placeholder="Masukkan nip Anda" value="<%= mii.getNip()%>">
                            </div>
                        </div>
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="nmJabatan">Nama Jabatan</label>
                                <input type="text" class="form-control" name="nmJabatan" placeholder="Masukan nama jabatan" value="<%= mii.getKdJabatan().getNamaJabatan()%>">
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
                                <input type="text" class="form-control" name="jk" placeholder="Masukan jenis kelamin" value="<%= mii.getJk()%>">
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
                                <label for="tglLahir">Tanggal Lahir</label>
                                <input type="text" class="form-control datepicker" name="tglLahir" placeholder="Masukan tanggal lahir anda" value="<%= mii.getTglLahir()%>">
                            </div>
                        </div>
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="tmptLahir">Tempat Lahir</label>
                                <input type="text" class="form-control" name="tmptLahir" placeholder="Masukan tempat lahir anda" value="<%= mii.getTmptLahir()%>">
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
    </body>
</html>

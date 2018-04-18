<%-- 
    Document   : pegawai
    Created on : Apr 16, 2018, 4:24:10 PM
    Author     : hp
--%>

<%@page import="entities.PegawaiMii"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
        <title>Daftar Pegawai</title>
    </head>
    <body>
        <% Long autoId = (Long) session.getAttribute("autoID"); %>
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
            <h1 align="center">Tabel Pegawai</h1>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th><center>No.</center></th>
                        <th><center>NIP</center></th>
                        <th><center>Jabatan</center></th>
                        <th><center>Nama</center></th>
                        <th><center>Jenis Kelamin</center></th>
                        <th><center>Alamat</center></th>
                        <th><center>Tanggal Lahir</center></th>
                        <th><center>Tempat Lahir</center></th>
                        <th colspan="2"><center>Aksi</center></th>
                    </tr>
                    </thead>
                <%
                    //                List<Object> datas = new DepartmentsDAO().getAll();
                    List<Object> datas = (List<Object>) session.getAttribute("dataPegawai");
                    int i = 1;
                    for (Object data : datas) {
                        PegawaiMii mii = (PegawaiMii) data;
                %>
                <tbody>
                    <tr>
                        <td><%= i++%></td>
                        <td><%= mii.getNip()%></td>                    
                        <td><%= mii.getKdJabatan().getNamaJabatan()%></td>
                        <td><%= mii.getNama()%></td>
                        <td><%= mii.getJk()%></td>
                        <td><%= mii.getAlamat()%></td>
                        <td><%= mii.getTglLahir()%></td>
                        <td><%= mii.getTmptLahir()%></td>
                        <td><center><a href="pegawaiGetById?id=<%= mii.getNip() %>">Update</a></center></td>
                        <td><center><a href="pegawaiDelete?id=<%= mii.getNip() %>">Delete</a></center></td>
                </tr>
                <% }%>
                </tbody>
            </table>
            <br>
            <br>
            <br>
            <form action="pegawaiInsert" method="POST">
                <div class="col-md-6">
                    <div class="row">
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="nip">Nomor Induk Pegawai</label>
                                <input type="text" class="form-control" name="nip" placeholder="Masukkan nip Anda" value="<%= autoId %>">
                            </div>
                        </div>
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="nmJabatan">Nama Jabatan</label>
                                <input type="text" class="form-control" name="nmJabatan" placeholder="Masukan nama jabatan">
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
                                <label for="jk">Jenis Kelamin</label>
                                <input type="text" class="form-control" name="jk" placeholder="Masukan jenis kelamin">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="alamat">Alamat</label>
                                <input type="text" class="form-control" name="alamat" placeholder="Masukkan alamat Anda">
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
                                <label for="tmptLahir">Tempat Lahir</label>
                                <input type="text" class="form-control" name="tmptLahir" placeholder="Masukan tempat lahir anda">
                            </div>
                        </div>       
                        <div class="col-md-5">

                        </div>
                        <div class="col-md-3">
                            <br>
                            <div class="form-group">
                                <input type="submit" value="Simpan" class="btn btn-primary">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>

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
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
        <title>Daftar Jabatan</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" >Over Time</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="#">Home</a></li>
                    <li><a href="pegawaiServlet">Pegawai</a></li>
                    <li class="active"><a href="jabatanServlet">Jabatan</a></li>
                    <li><a href="jenisLemburServlet">Jenis Lembur</a></li>
                    <li><a href="detailLemburServlet">Detail Lembur</a></li>
                    <li><a href="detailJabatanLemburServlet">Detail Jabatan Lembur</a></li>
                </ul>                    
            </div>
        </nav>
        <div class="container">
            <h1 align="center">Tabel Jabatan</h1>
            </br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th><center>No.</center></th>
                <th><center>Kode Jabatan</center></th>
                <th><center>Nama Jabatan</center></th>
                <th colspan="2"><center>Aksi</center></th>
                </tr>
                </thead>
                <%
                    //                List<Object> datas = new DepartmentsDAO().getAll();
                    List<Object> datas = (List<Object>) session.getAttribute("dataJabatan");
                    int i = 1;
                    for (Object data : datas) {
                        Jabatan jabatan = (Jabatan) data;
                %>
                <tbody>
                    <tr>
                        <td><center><%= i++%></center></td>
                <td><%= jabatan.getKdJabatan()%></td>                    
                <td><%= jabatan.getNamaJabatan()%></td>
                <td><center><a href="jabatanGetById?id=<%= jabatan.getKdJabatan()%>">Update</a></center></td>
                <td><center><a href="jabatanDelete?id=<%= jabatan.getKdJabatan()%>">Delete</a></center></td>
                </tr>
                <% }%>
                </tbody>
            </table>
            <br>
            <br>
            <br>

            <form action="jabatanInsert" method="POST">                
                <div class="col-md-6">
                    <div class="row">
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="kdJabatan">Kode Jabatan</label>
                                <input type="text" class="form-control" name="kdJabatan" placeholder="Masukkan kode jabatan" value="">
                            </div>
                        </div>
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="nmJabatan">Nama Jabatan</label>
                                <input type="text" class="form-control" name="nmJabatan" placeholder="Masukan nama jabatan" value="">
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
</body>
</html>

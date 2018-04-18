<%-- 
    Document   : detailLemburJabatan
    Created on : Apr 16, 2018, 4:48:19 PM
    Author     : hp
--%>

<%@page import="entities.Detail"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
        <title>Detail Lembur Jabatan</title>
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
                    <li><a href="jabatanServlet">Jabatan</a></li>
                    <li><a href="jenisLemburServlet">Jenis Lembur</a></li>
                    <li><a href="detailLemburServlet">Detail Lembur</a></li>
                    <li class="active"><a href="detailJabatanLemburServlet">Detail Jabatan Lembur</a></li>
                </ul>                    
            </div>
        </nav>
        <div class="container">
            <h1 align="center">Detail Lembur Jabatan</h1>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th><center>No.</center></th>
                        <th><center>Kode Jabatan</center></th>
                        <th><center>Kode Lembur</center></th>
                        <th><center>Tarif</center></th>
                        <th colspan="2"><center>Aksi</center></th>
                    </tr>
                </thead>
                <%
    //                List<Object> datas = new DepartmentsDAO().getAll();
                    List<Object> datas = (List<Object>) session.getAttribute("dataDetailjabatanLembur");
                    int i = 1;
                    for (Object data : datas) {
                        Detail detail = (Detail) data;
                %>
                <tbody>
                    <tr>
                        <td><center><%= i++%></td>
                        <td><%= detail.getJabatan().getNamaJabatan()%></td>                    
                        <td><center><%= detail.getJenisLembur().getLamaLembur()%></center></td>
                        <td><center><%= detail.getTarif()%></center></td>
                        <td><center><a href="jenisLemburGetById?id=<% %>">Update</a></center></td>
                        <td><center><a href="jenisLemburDelete?id=<% %>">Delete</a></center></td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
                
            <br>
            <br>
            <form>
                <div class="col-md-6">
                    <div class="row">
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="kdJabatan">Kode Jabatan</label>
                                <input type="text" class="form-control" id="kdJabatan" placeholder="Masukkan kode jabatan">
                            </div>
                        </div>
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="kdJenisLembur">Kode Jenis Lembur</label>
                                <input type="text" class="form-control" id="kdJenisLembur" placeholder="Masukan kode jenis lembur">
                            </div>
                        </div>
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="tarif">Tarif</label>
                                <input type="text" class="form-control" id="tarif" placeholder="Masukan tarif lembur">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <input type="submit" value="Simpan" class="btn btn-primary">
                    </div>


                </div>
            </form>
        </div>
    </body>
</html>

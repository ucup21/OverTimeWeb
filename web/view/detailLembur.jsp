<%-- 
    Document   : DetailLembur
    Created on : Apr 16, 2018, 4:38:14 PM
    Author     : Asus
--%>

<%@page import="entities.DetailLembur"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
        <title>Detail Lembur</title>
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
                    <li class="active"><a href="detailLemburServlet">Detail Lembur</a></li>
                    <li><a href="detailJabatanLemburServlet">Detail Jabatan Lembur</a></li>
                </ul>                    
            </div>
        </nav>
        <div class="container">
        <h1 align="center">Tabel Detail Lembur</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Kode Detail Lembur</th>
                    <th>Lama Lembur</th>
                    <th>Nama Pegawai</th>
                    <th>Tanggal Lembur</th>
                    <th colspan="2">Aksi</th>
                </tr>
            </thead>
            <%
//                List<Object> datas = new DepartmentsDAO().getAll();
                List<Object> datas = (List<Object>) session.getAttribute("dataDetailLembur");
                int i = 1;
                for (Object data : datas) {
                    DetailLembur dl = (DetailLembur) data;
            %>
            <tbody>
                <tr>
                    <td><%= i%></td>
                    <td><%= dl.getKdDetailLembur()%></td>
                    <td><%= dl.getKdLembur().getLamaLembur()%></td>
                    <td><%= dl.getNip().getNama()%></td>
                    <td><%= dl.getTglLembur()%></td>
                    <td><center><a href="jenisLemburGetById?id=<%%>">Update</a></center></td>
                    <td><center><a href="jenisLemburDelete?id=<%%>">Delete</a></center></td>
                </tr>
            </tbody>
            <% i++;
                }%>
        </table>
            <br>
            <br>
            <form>
                <div class="col-md-6">
                    <div class="row">
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="kdDetailLembur">Kode Detail Lembur</label>
                                <input type="text" class="form-control" id="kdDetailLembur" placeholder="Masukkan kode detail lembur">
                            </div>
                        </div>
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="lamaLembur">Lama Lembur</label>
                                <input type="text" class="form-control" id="lamaLembur" placeholder="Masukan lama lembur">
                            </div>
                        </div>
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="nmPegawai">Nama Pegawai</label>
                                <input type="text" class="form-control" id="nmPegawai" placeholder="Masukan nama Anda">
                            </div>
                        </div>
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="tglLembur">Tanggal Lembur</label>
                                <input type="date" class="form-control" id="tglLembur" placeholder="Masukan tanggal lembur">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <input type="submit" value="Simpan" class="btn btn-primary">
                    </div>


                </div>
            </form>
    </body>
</html>

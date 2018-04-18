<%-- 
    Document   : jenisLemburUpdate
    Created on : Apr 18, 2018, 6:52:31 AM
    Author     : hp
--%>

<%@page import="entities.JenisLembur"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
        <title>Jenis Lembur Update</title>
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
                    <li class="active"><a href="jenisLemburServlet">Jenis Lembur</a></li>
                    <li><a href="detailLemburServlet">Detail Lembur</a></li>
                    <li><a href="detailJabatanLemburServlet">Detail Jabatan Lembur</a></li>
                </ul>                    
            </div>
        </nav>
        <div class="container">
            <form action="jenisLemburUpdate" method="POST">
            <% JenisLembur jenisLembur = (JenisLembur) session.getAttribute("jenisLembur");%>
            <div class="col-md-6">
                <div class="row">
                    <div  class="col-md-12">
                        <div class="form-group">
                            <label for="kdJenisLembur">Kode Jenis Lembur</label>
                            <input type="text" readonly class="form-control" name="kdJenisLembur" placeholder="Masukkan kode jenis lembur" value="<%= jenisLembur.getKdLembur() %>">
                        </div>
                    </div>
                    <div  class="col-md-12">
                        <div class="form-group">
                            <label for="lamaLembur">Lama Lembur</label>
                            <input type="text" class="form-control" name="lamaLembur" placeholder="Masukan lama lembur" value="<%= jenisLembur.getLamaLembur() %>">
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

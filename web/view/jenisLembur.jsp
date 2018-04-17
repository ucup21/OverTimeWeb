<%-- 
    Document   : jenisLembur
    Created on : Apr 16, 2018, 4:26:58 PM
    Author     : Asus
--%>

<%@page import="entities.JenisLembur"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
        <title>Jenis Lembur</title>
    </head>
    <body>
        <div class="container">
            <h1 align="center">Tabel Jenis Lembur</h1>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Kode Jenis Lembur</th>
                        <th>Lama Lembur</th>
                    </tr>
                </thead>
                <%
    //                List<Object> datas = new DepartmentsDAO().getAll();
                    List<Object> datas = (List<Object>) session.getAttribute("dataJenisLembur");
                    int i = 1;
                    for (Object data : datas) {
                        JenisLembur j = (JenisLembur) data;
                        String manager = "";%>
                <tbody>
                    <tr>
                        <td><%= i%></td>
                        <td><%= j.getKdLembur()%></td>
                        <td><%= j.getLamaLembur()%></td>
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
                                <label for="kdJenisLembur">Kode Jenis Lembur</label>
                                <input type="text" class="form-control" id="kdJenisLembur" placeholder="Masukkan kode jenis lembur">
                            </div>
                        </div>
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="lamaLembur">Lama Lembur</label>
                                <input type="text" class="form-control" id="lamaLembur" placeholder="Masukan lama lembur">
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

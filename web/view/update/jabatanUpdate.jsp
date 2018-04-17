<%-- 
    Document   : jabatanUpdate
    Created on : Apr 17, 2018, 10:10:04 PM
    Author     : hp
--%>

<%@page import="entities.Jabatan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
        <title>Jabatan Update</title>
    </head>
    <body>
        <div class="container">
            <form action="jabatanUpdate" method="POST">
                <% Jabatan jab = (Jabatan) session.getAttribute("jab");%>
                <div class="col-md-6">
                    <div class="row">
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="kdJabatan">Kode Jabatan</label>
                                <input type="text" class="form-control" name="kdJabatan" placeholder="Masukkan kode jabatan" value="<%= jab.getKdJabatan()%>">
                            </div>
                        </div>
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="nmJabatan">Nama Jabatan</label>
                                <input type="text" class="form-control" name="nmJabatan" placeholder="Masukan nama jabatan" value="<%= jab.getNamaJabatan()%>">
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

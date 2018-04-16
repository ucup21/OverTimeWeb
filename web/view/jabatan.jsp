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
        <title>Daftar Pegawai</title>
    </head>
    <body>
        <h1>Tabel Jabatan</h1>
         <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Kode Jabatan</th>
                    <th>Nama Jabatan</th>
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
                    <td><%= i++%></td>
                    <td><%= jabatan.getKdJabatan() %></td>                    
                    <td><%= jabatan.getNamaJabatan() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </body>
</html>

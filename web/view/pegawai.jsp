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
        <title>Daftar Pegawai</title>
    </head>
    <body>
        <h1>Tabel Pegawai</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>NIP</th>
                    <th>Jabatan</th>
                    <th>Nama</th>
                    <th>Jenis Kelamin</th>
                    <th>Alamat</th>
                    <th>Tanggal Lahir</th>
                    <th>Tempat Lahir</th>
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
                    <td><%= mii.getKdJabatan().getNamaJabatan() %></td>
                    <td><%= mii.getNama()%></td>
                    <td><%= mii.getJk()%></td>
                    <td><%= mii.getAlamat()%></td>
                    <td><%= mii.getTglLahir()%></td>
                    <td><%= mii.getTmptLahir()%></td>
                </tr>
                <% } %>
            </tbody>
        </table>

    </body>
</html>

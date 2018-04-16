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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Tabel Detail Lembur</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Kode Detail Lembur</th>
                    <th>Lama Lembur</th>
                    <th>Nama Pegawai</th>
                    <th>Tanggal Lembur</th>
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
                </tr>
            </tbody>
            <% i++;
                }%>
        </table>

    </body>
</html>

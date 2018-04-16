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
        <title>Detail Lembur Jabatan</title>
    </head>
    <body>
        <h1>Detail Lembur Jabatan</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Kode Jabatan</th>
                    <th>Kode Lembur</th>
                    <th>Tarif</th>
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
                    <td><%= i++%></td>
                    <td><%= detail.getJabatan().getNamaJabatan() %></td>                    
                    <td><%= detail.getJenisLembur().getLamaLembur() %></td>
                    <td><%= detail.getTarif() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </body>
</html>

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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Tabel Jenis Lembur</h1><table border="1">
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
    </body>
</html>

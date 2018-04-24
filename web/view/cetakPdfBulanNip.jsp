<%-- 
    Document   : cetakPdf
    Created on : Apr 23, 2018, 1:17:19 PM
    Author     : Asus
--%>

<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.engine.jdbc.connections.spi.ConnectionProvider"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cetak PDF</title>
    </head>
    <body>
        <%
            try {
//                String path = "E://MII//tugas//WebOverTime//web//view//report//reportAll.jasper";
//                String path = "//view//report//reportBulanNip.jasper";
//                String driver = "oracle.jdbc.OracleDriver";
//                String konek = "jdbc:oracle:thin:@localhost:1521:XE";
//                String user = "system";
//                String password = "password";
                HashMap parameter = new HashMap();
                int nip = Integer.parseInt(request.getParameter("nip"));
                String bulan = request.getParameter("cmbBulan");
                parameter.put("nip", nip);
                parameter.put("bulan", bulan);
//                Class.forName(driver);
//                Connection conn = DriverManager.getConnection(konek, user, password);                
                Connection connection = HibernateUtil.getSessionFactory().getSessionFactoryOptions().getServiceRegistry().getService(ConnectionProvider.class).getConnection();
                File reportFile = new File(application.getRealPath("/view/report/reportBulanNip.jasper"));
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameter, connection);

                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream outputStream = response.getOutputStream();
                outputStream.write(bytes, 0, bytes.length);
                outputStream.flush();
                outputStream.close();
            } catch (Exception e) {
                out.println("Error :" + e.getMessage());
            }

        %>
    </body>
</html>

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
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
        <title>Daftar Pegawai</title>
    </head>
    <body>
        <div class="container">
            <h1 align="center">Tabel Pegawai</h1>
            <br>
            <table class="table table-bordered">
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
                        <td><%= mii.getKdJabatan().getNamaJabatan()%></td>
                        <td><%= mii.getNama()%></td>
                        <td><%= mii.getJk()%></td>
                        <td><%= mii.getAlamat()%></td>
                        <td><%= mii.getTglLahir()%></td>
                        <td><%= mii.getTmptLahir()%></td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
            <br>
            <br>
            <br>
            <form>
                <div class="col-md-6">
                    <div class="row">
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="nip">Nomor Induk Pegawai</label>
                                <input type="text" class="form-control" id="nip" placeholder="Masukkan nip Anda">
                            </div>
                        </div>
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="nmJabatan">Nama Jabatan</label>
                                <input type="text" class="form-control" id="nmJabatan" placeholder="Masukan nama jabatan">
                            </div>
                        </div>
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="nmLengkap">Nama Lengkap</label>
                                <input type="text" class="form-control" id="nmLengkap" placeholder="Masukan nama lengkap">
                            </div>
                        </div>
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="jk">Jenis Kelamin</label>
                                <input type="text" class="form-control" id="jk" placeholder="Masukan jenis kelamin">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="alamat">Alamat</label>
                                <input type="text" class="form-control" id="alamat" placeholder="Masukkan alamat Anda">
                            </div>
                        </div>
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="tglLahir">Tanggal Lahir</label>
                                <input type="date" class="form-control" id="tglLahir" placeholder="Masukan tanggal lahir anda">
                            </div>
                        </div>
                        <div  class="col-md-12">
                            <div class="form-group">
                                <label for="tmptLahir">Tempat Lahir</label>
                                <input type="text" class="form-control" id="tmptLahir" placeholder="Masukan tempat lahir anda">
                            </div>
                        </div>       
                        <div class="col-md-5">
                            
                        </div>
                        <div class="col-md-3">
                            <br>
                            <div class="form-group">
                                <input type="submit" value="Simpan" class="btn btn-primary">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>

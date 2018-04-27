/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.PegawaiMiiDAO;
import dao.UserManagementDAO;
import entities.PegawaiMii;
import entities.Usermanagement;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tools.BCrypt;

/**
 *
 * @author hp
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/loginServlet"})
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        String Username = request.getParameter("userName");
//        String Pass = request.getParameter("pass");
//        RequestDispatcher dispatcher = null;
//        HttpSession session = request.getSession();
//        String category = "nip";
//        UserManagementDAO managementDAO = new UserManagementDAO();
//        PegawaiMiiDAO miiDAO = new PegawaiMiiDAO();
//        miiDAO.getById(Username);

//        PegawaiMiiDAO dAO = new PegawaiMiiDAO();
//        PegawaiMii mii = (PegawaiMii) new PegawaiMiiDAO().getById(Username);
//
////        List<Object> datas = (List<Object>) managementDAO.search(category, Username);
//        try (PrintWriter out = response.getWriter()) {
//            String send = "", pesan = "", hasil = "";
//            boolean login = managementDAO.login(category, Username, Pass);
//            if (mii.getNip().toString() == Username) {
//                if (BCrypt.checkpw(Pass, mii.getPassword())) {
//                    if (mii.getAkses().equals("admin")) {
//                        pesan = "berhasil login " + mii.getNama();
//                        hasil = "Berhasil";
//                        send = "indexAdmin.jsp";
//                    } else if (mii.getAkses().equals("manager")) {
//                        pesan = "berhasil login " + mii.getNama();
//                        hasil = "Berhasil";
//                        send = "indexManager.jsp";
//                    } else if (mii.getAkses().equals("pegawai")) {
//                        pesan = "berhasil login " + mii.getNama();
//                        hasil = "Berhasil";
//                        send = "indexUser.jsp";
//                    }
//                } else {
//                    pesan = "Username atau Password Salah";
//                    hasil = "Gagal";
//                    send = "login.jsp";
//                }
//
//            } else {
//                pesan = "Username atau Password Salah";
//                hasil = "Gagal";
//                send = "login.jsp";
//            }
//            if (dAO.login(Username, Pass)) {
//                if (mii.getNip().toString().equals(Username)) {
//                    if (mii.getAkses().equals("admin")) {
//                        pesan = "berhasil login " + mii.getNama();
//                        hasil = "Berhasil";
//                        send = "indexAdmin.jsp";
//                    } else if (mii.getAkses().equals("manager")) {
//                        pesan = "berhasil login " + mii.getNama();
//                        hasil = "Berhasil";
//                        send = "indexManager.jsp";
//                    } else if (mii.getAkses().equals("pegawai")) {
//                        pesan = "berhasil login " + mii.getNama();
//                        hasil = "Berhasil";
//                        send = "indexUser.jsp";
//                    }
//                }
//            } else if (mii == null) {
//                if (!dAO.login(Username, Pass)) {
//                    pesan = "Username atau Password Salah";
//                    hasil = "Gagal";
//                    send = "login.jsp";
//                }
//            } else if (!dAO.login(Username, Pass)) {
//                pesan = "Username atau Password Salah";
//                hasil = "Gagal";
//                send = "login.jsp";
//
//            }
//            session.setAttribute("login", Username);
//            session.setAttribute(hasil, pesan);
//            dispatcher = request.getRequestDispatcher(send);
//            dispatcher.include(request, response);
        String Username = request.getParameter("userName");
        String Pass = request.getParameter("pass");
        RequestDispatcher dispatcher = null;
        HttpSession session = request.getSession();
        String category = "nip";
        PegawaiMiiDAO aO = new PegawaiMiiDAO();

        List<Object> datas = (List<Object>) aO.search(category, Username);

        try (PrintWriter out = response.getWriter()) {
            String send = "", pesan = "", hasil = "";
//            booSlean login = managementDAO.login(category, Username, Pass);
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if (Username.equals("") || Pass.equals("")) {
                pesan = "Username dan Password Harus Terisi";
                hasil = "Gagal";
                send = "login.jsp";
            } else if (aO.search(category, Username).isEmpty() || !aO.login(category, Username, Pass)) {
                pesan = "Username atau Password Salah";
                hasil = "Gagal";
                send = "login.jsp";
            } else if (aO.login(category, Username, Pass)) {
                for (Object data : datas) {
                    PegawaiMii u = (PegawaiMii) data;
                    if (u.getNip().toString().equals(Username)) {
                        if (u.getAkses().equals("admin")) {
                            pesan = "berhasil login" + Username;
                            hasil = "Berhasil";
                            send = "indexAdmin.jsp";
                            PegawaiMii mii = new PegawaiMii();
                            mii.setNama(u.getNama());
                            session.setAttribute("nama", mii);
                        } else if (u.getAkses().equals("manager")) {
                            pesan = "berhasil login" + Username;
                            hasil = "Berhasil";
                            send = "indexManager.jsp";
                            PegawaiMii mii2 = new PegawaiMii();
                            mii2.setNama(u.getNama());
                            session.setAttribute("nama", mii2);
                        } else if (u.getAkses().equals("pegawai")) {
                            pesan = "berhasil login" + Username;
                            hasil = "Berhasil";
                            send = "indexUser.jsp";
                            PegawaiMii mii3 = new PegawaiMii();
                            mii3.setNama(u.getNama());
                            session.setAttribute("nama", mii3);
                        }
                    }
                }
            }else if (session.getAttribute("login") == null) {
//                response.sendRedirect("login.jsp");
                dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
            }

            session.setAttribute("login", Username);
            session.setAttribute(hasil, pesan);
            dispatcher = request.getRequestDispatcher(send);
            dispatcher.include(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

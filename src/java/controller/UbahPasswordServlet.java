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
@WebServlet(name = "UbahPasswordServlet", urlPatterns = {"/ubahPasswordServlet"})
public class UbahPasswordServlet extends HttpServlet {

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
        String Username = request.getParameter("username");
        String PassLama = request.getParameter("passwordLama");
        String PassBaru = request.getParameter("passwordBaru");
        String KonPasBar = request.getParameter("konfirmasipasswordBaru");
        
        HttpSession session = request.getSession(true);
//        RequestDispatcher dispatcher = null;
        try (PrintWriter out = response.getWriter()) {
            PegawaiMiiDAO aO = new PegawaiMiiDAO();
            List<Object> datas = (List<Object>) aO.search("nip", Username);
            String pesan = "", hasil = "";
            for (Object data : datas) {
                PegawaiMii mii  = (PegawaiMii) data;
                if (mii.getNip().toString().equals(Username)) {
                    if (BCrypt.checkpw(PassLama, mii.getPassword())) {
                        if (PassBaru.equals(KonPasBar)) {
                            mii.setNip(Long.valueOf(Username));
                            mii.setPassword(BCrypt.hashpw(PassBaru, BCrypt.gensalt()));
                            mii.setAkses("pegawai");
                            aO.insert(mii);
                            pesan = "Password Berhasil Diubah";
                            hasil = "berhasil";
                            
                        } else {
                            pesan = "Password Tidak Sama";
                            hasil = "gagal";
                        }
                    } else {
                        pesan = "Password Lama Salah";
                        hasil = "gagal";
                    }
                }
            }
            session.setAttribute(hasil, pesan);
            response.sendRedirect("indexUser.jsp");

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

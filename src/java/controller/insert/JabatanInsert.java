/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.insert;

import dao.JabatanDAO;
import entities.Jabatan;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hp
 */
@WebServlet(name = "JabatanInsert", urlPatterns = {"/jabatanInsert"})
public class JabatanInsert extends HttpServlet {

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
        String kdJabatan = request.getParameter("kdJabatan");
        String nmJabatan = request.getParameter("nmJabatan");
        RequestDispatcher dis = null;
        HttpSession session = request.getSession();
        JabatanDAO jdao = new JabatanDAO();
        try (PrintWriter out = response.getWriter()) {
            Jabatan jabatan = new Jabatan();
            jabatan.setKdJabatan(kdJabatan);
            jabatan.setNamaJabatan(nmJabatan);
            if (jdao.insert(jabatan)) {
                String berhasil = "Berhasil menambah data dengan ID :" + jabatan.getKdJabatan();
                session.setAttribute("berhasil", berhasil);
            } else {
                String gagal = "Gagal menambah ID :" + jabatan.getKdJabatan();
                session.setAttribute("gagal", gagal);
            }
            dis = request.getRequestDispatcher("jabatanServlet");
            dis.include(request, response);
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

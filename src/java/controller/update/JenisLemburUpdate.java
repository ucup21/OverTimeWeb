/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.update;

import dao.JenisLemburDAO;
import entities.JenisLembur;
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
@WebServlet(name = "JenisLemburUpdate", urlPatterns = {"/jenisLemburUpdate"})
public class JenisLemburUpdate extends HttpServlet {

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
        String kdJenisLembur = request.getParameter("kdJenisLembur");
        String lamaLembur = request.getParameter("lamaLembur");
        RequestDispatcher dis = null;
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            JenisLembur jenisLembur = new JenisLembur();
            jenisLembur.setKdLembur(kdJenisLembur);
            jenisLembur.setLamaLembur(Short.valueOf(lamaLembur));
            JenisLemburDAO aO = new JenisLemburDAO();
            if (aO.update(jenisLembur)) {
                String berhasil = "Berhasil mengubah data dengan ID :" + jenisLembur.getKdLembur();
                session.setAttribute("berhasil", berhasil);
            }else {
                String gagal = "Gagal mengubah";
                session.setAttribute("gagal", gagal);
            }
            dis = request.getRequestDispatcher("jenisLemburServlet");
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserManagementDAO;
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
        String Username = request.getParameter("userName");
        String Pass = request.getParameter("pass");
        RequestDispatcher dispatcher = null;
        HttpSession session = request.getSession();
        String category = "username";
        UserManagementDAO managementDAO = new UserManagementDAO();
        try (PrintWriter out = response.getWriter()) {
            String send = "", pesan = "", hasil = "";
//            boolean login = managementDAO.login(category, Username, Pass);
            if (Username.equals("") || Pass.equals("")) {
                pesan = "Username dan Password Harus Terisi";
                hasil = "Gagal";
                send = "index.jsp";
            } else if (managementDAO.search(category, Username).isEmpty() || !managementDAO.login(category, Username, Pass)) {
                pesan = "Username atau Password Salah";
                hasil = "Gagal";
                send = "index.jsp";
            } else if (managementDAO.login(category, Username, Pass)) {
                pesan = "berhasil login" + Username;
                hasil = "Berhasil";
                send = "indexAfter.jsp";
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.insert;

import dao.DetailLemburDAO;
import entities.DetailLembur;
import entities.JenisLembur;
import entities.PegawaiMii;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Asus
 */
@WebServlet(name = "DetailLemburInsert", urlPatterns = {"/detailLemburInsert"})
public class DetailLemburInsert extends HttpServlet {

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
        String KdDetailLembur = request.getParameter("kdDetailLembur");
        String LamaLembur = request.getParameter("lamaLembur");
        String Nama = request.getParameter("nmPegawai");
        String TglLembur = request.getParameter("tglLembur");
        Date date = null;
        try {
            date = new SimpleDateFormat("yyyy-MM-dd").parse(TglLembur);
        } catch (Exception e) {
        }
        RequestDispatcher dis = null;
        DetailLemburDAO dAO = new DetailLemburDAO();
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            DetailLembur dl = new DetailLembur();
            dl.setKdDetailLembur(KdDetailLembur);
            dl.setKdLembur(new JenisLembur(LamaLembur));
            dl.setNip(new PegawaiMii(Long.parseLong(Nama)));
            dl.setTglLembur(date);
            if (dAO.insert(dl)) {
                String berhasil = "Berhasil menambah data dengan ID :" + dl.getKdDetailLembur();
                session.setAttribute("berhasil", berhasil);
            }else{
                String gagal = "Gagal menambah data dengan ID :" + dl.getKdDetailLembur();
                session.setAttribute("gagal", gagal);
            }
//            out.print(pesan);
            
            dis = request.getRequestDispatcher("detailLemburServlet");
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

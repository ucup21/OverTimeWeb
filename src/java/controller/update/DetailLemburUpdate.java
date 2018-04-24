/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.update;

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
 * @author hp
 */
@WebServlet(name = "DetailLemburUpdate", urlPatterns = {"/detailLemburUpdate"})
public class DetailLemburUpdate extends HttpServlet {

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
        String kdDetailLembur = request.getParameter("kdDetailLembur");
        String kdLembur = request.getParameter("lamaLembur");
        String nmPegawai = request.getParameter("nmPegawai");
        String tglLembur = request.getParameter("tglLembur");
        Date date = null;
        try {
            date = new SimpleDateFormat("yyyy-mm-dd").parse(tglLembur);
        } catch (Exception e) {
        }
        RequestDispatcher dispatcher = null;
        
        DetailLemburDAO aO = new DetailLemburDAO();
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            DetailLembur dl = new DetailLembur();
            dl.setKdDetailLembur(kdDetailLembur);
            dl.setKdLembur(new JenisLembur(kdLembur));
            dl.setNip(new PegawaiMii(Long.parseLong(nmPegawai)));
            dl.setTglLembur(date);
            if (aO.update(dl)) {
                String berhasil = "Berhasil mengubah data dengan ID :" + dl.getKdDetailLembur();
                session.setAttribute("berhasil", berhasil);
            }else{
                String gagal = "gagal";
                session.setAttribute("gagal", gagal);
            }
//            out.print(pesan);
            
            dispatcher = request.getRequestDispatcher("detailLemburServlet");
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

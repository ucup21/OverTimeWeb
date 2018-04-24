/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.update;

import dao.PegawaiMiiDAO;
import entities.Jabatan;
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
@WebServlet(name = "PegawaiUpdate", urlPatterns = {"/pegawaiUpdate"})
public class PegawaiUpdate extends HttpServlet {

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
        String nip = request.getParameter("nip");
        String nmJabatan = request.getParameter("cmbJabatan");
        String nama = request.getParameter("nmLengkap");
        String jk = request.getParameter("jk");
        String alamat = request.getParameter("alamat");
        String tglLahir = request.getParameter("tglLahir");
        String tmptLahir = request.getParameter("tmptLahir");
        Date date = null;
        try {
            date = new SimpleDateFormat("yyyy-mm-dd").parse(tglLahir);
        } catch (Exception e) {
        }
        RequestDispatcher dispatcher = null;
        HttpSession session = request.getSession();
        PegawaiMiiDAO miiDAO = new PegawaiMiiDAO();
        try (PrintWriter out = response.getWriter()) {

            PegawaiMii mii = new PegawaiMii();
            mii.setNip(Long.valueOf(nip));
            mii.setKdJabatan(new Jabatan(nmJabatan));
            mii.setNama(nama);
            mii.setJk(jk);
            mii.setAlamat(alamat);
            mii.setTglLahir(date);
            mii.setTmptLahir(tmptLahir);
            if (miiDAO.update(mii)) {
                String berhasil = "Berhasil mengubah data dengan ID :" + mii.getNip();
                session.setAttribute("berhasil", berhasil);
            } else {
                String gagal = "Gagal mengubah data";
                session.setAttribute("gagal", gagal);
            }
//            out.print(pesan);
            
            dispatcher = request.getRequestDispatcher("pegawaiServlet");
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

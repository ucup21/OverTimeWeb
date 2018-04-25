/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Jabatan;
import entities.PegawaiMii;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import tools.BCrypt;
import tools.HibernateUtil;

/**
 *
 * @author hp
 */
public class PegawaiMiiDAO implements InterfaceDAO {

    public Session session;
    private SessionFactory factory;
    public Transaction transaction;
    public FunctionsDAO fdao;

    public PegawaiMiiDAO() {
        this.fdao = new FunctionsDAO(HibernateUtil.getSessionFactory());
    }

    public boolean insert(Object object) {
        return fdao.insert(object);
    }

    /**
     * Fungsi Untuk Delete di table PegawaiiMII
     *
     * @param object Object berupa class PegawaiMII yang di Delete
     * @return fdao memanggil fungsi delete pada class fdao
     */
    public boolean delete(Object object) {
        return fdao.delete(PegawaiMii.class, Long.parseLong(object + ""));
    }

    /**
     * Fungsi search untuk mencari data pada tabel PegawaiMII
     *
     * @param String category berupa kategori yang ingin dicari, search berupa
     * nilai yang ingin dicari
     * @return fdao memanggil fungsi getAll pada class fdao
     */
    public List<Object> search(String category, String search) {
        return fdao.getAll("FROM PegawaiMii WHERE " + category + " LIKE '%" + search + "%'");
    }

    public Object getById(String Id) {
        return fdao.getById("FROM PegawaiMii where nip='" + Id + "'");
    }

    /**
     * fungsi insert untuk mengedit data pada tabel PegawaiMII
     *
     * @param object
     * @return fdao memangil fungsi insert pada class fdao
     */
    public boolean update(Object object) {
        return fdao.insert(object);
    }

    public List<Object> getAll() {
        return fdao.getAll("FROM PegawaiMii ORDER BY nip");
    }

    public Long getAutoID() {
        return (Long) fdao.getById("SELECT MAX(nip)+1 FROM PegawaiMii");
    }

//    public boolean insert(Long nip, String kdJabatan, String nama, String jk, String Alamat, String tgl_lahir, String tmpt_lahir, String password, String akses, boolean isUpdate) {
//        Long nipBaru = nip;
//        if (!isUpdate) {
//            nipBaru = getAutoID();
//        }
//        PegawaiMii mii = new PegawaiMii(); //salt seperti key nya
//        mii.setNip(nipBaru);
//        mii.setKdJabatan(new Jabatan(kdJabatan));
//        mii.setNama(nama);
//        mii.setAlamat(Alamat);
//        mii.setTglLahir(new java.sql.Date(new Long (tgl_lahir)));
//        mii.setTmptLahir(tmpt_lahir);
//        mii.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));
//        mii.setAkses(akses);
//        return insert(mii);
//    }

    public boolean login(String nip, String password){
        PegawaiMii mii = (PegawaiMii) getById(nip);
        return BCrypt.checkpw(password, mii.getPassword());
    }
     public boolean login(String category, String username, String password) {
        PegawaiMii mii = (PegawaiMii) search(category, username).get(0);
        return BCrypt.checkpw(password, mii.getPassword());
    }
}

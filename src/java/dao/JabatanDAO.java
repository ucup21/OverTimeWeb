/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Jabatan;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import tools.HibernateUtil;

/**
 *
 * @author hp
 */
public class JabatanDAO implements InterfaceDAO{
    public Session session;
    private SessionFactory factory;
    public Transaction transaction;

    public FunctionsDAO fdao;

    public JabatanDAO() {
        this.fdao = new FunctionsDAO(HibernateUtil.getSessionFactory());
    }

    public boolean insert(Object object) {
        return fdao.insert(object);
    }

    /**
     * Fungsi Untuk Delete di table Jabatan
     *
     * @param object Object berupa class jabatan yang di Delete
     * @return fdao memanggil fungsi delete pada class fdao
     */
    
    public boolean delete(Object object) {
        return fdao.delete(Jabatan.class,object.toString());
    }

    /**
     * Fungsi search untuk mencari data pada tabel Jabatan
     *
     * @param String category berupa kategori yang ingin dicari, search berupa
     * nilai yang ingin dicari
     * @return fdao memanggil fungsi getAll pada class fdao
     */
    public List<Object> search(String category, String search) {
        return fdao.getAll("FROM Jabatan WHERE " + category + " LIKE '%" + search + "%'");
    }

    public Object getById(String Id) {
        return fdao.getById("FROM Jabatan where kdJabatan='" + Id + "'");
    }

    /**
     * fungsi insert untuk mengedit data pada tabel Jabatan
     *
     * @param object 
     * @return fdao memangil fungsi insert pada class fdao
     */
    public boolean update(Object object) {
        return fdao.insert(object);
    }

    public List<Object> getAll() {
        return fdao.getAll("FROM Jabatan");
    }
}


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Detail;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import tools.HibernateUtil;

/**
 *
 * @author hp
 */
public class DetailDAO implements InterfaceDAO{
    public Session session;
    private SessionFactory factory;
    public Transaction transaction;

    public FunctionsDAO fdao;

    public DetailDAO() {
        this.fdao = new FunctionsDAO(HibernateUtil.getSessionFactory());
    }
    

    public boolean insert(Object object) {
        return fdao.insert(object);
    }

    /**
     * Fungsi Untuk Delete di table Detail
     *
     * @param object Object berupa class PegawaiMII yang di Delete
     * @return fdao memanggil fungsi delete pada class fdao
     */
    
    public boolean delete(Object object) {
        return fdao.delete(Detail.class, (Serializable) object);
    }

    /**
     * Fungsi search untuk mencari data pada tabel PegawaiMII
     *
     * @param String category berupa kategori yang ingin dicari, search berupa
     * nilai yang ingin dicari
     * @return fdao memanggil fungsi getAll pada class fdao
     */
    public List<Object> search(String category, String search) {
//        return fdao.getAll("FROM Detail WHERE " + category + " LIKE '%" + search + "%'");
        return fdao.getAll("FROM Detail WHERE " + category + " LIKE '%" + search + "%'");
    }

    public Object getById(String Id) {
        return fdao.getById("FROM Detail where ='" + Id + "'");
    }

    /**
     * fungsi insert untuk mengedit data pada tabel Detail
     *
     * @param object 
     * @return fdao memangil fungsi insert pada class fdao
     */
    public boolean update(Object object) {
        return fdao.insert(object);
    }

    public List<Object> getAll() {
        return fdao.getAll("FROM Detail order by jabatan");
    }
    
     public Object getById(String Id, String Ids) {
        return fdao.getById("FROM Detail where kd_jabatan='" + Id + "' AND kd_lembur='" + Ids + "'");
    }
    
}

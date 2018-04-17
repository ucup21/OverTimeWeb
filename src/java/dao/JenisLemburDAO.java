/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.JenisLembur;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import tools.HibernateUtil;

/**
 *
 * @author Asus
 */
public class JenisLemburDAO implements InterfaceDAO{
    public SessionFactory factory;
    public Session session;
    public Transaction transaksi;
    public FunctionsDAO fdao;

    public JenisLemburDAO() {
        this.fdao = new FunctionsDAO(HibernateUtil.getSessionFactory());
    }
    
    @Override
    public boolean insert(Object object) {
        return fdao.insert(object);
    }

    @Override
    public boolean update(Object object) {
        return fdao.insert(object);
    }

    @Override
    public boolean delete(Object object) {
        return fdao.delete(JenisLembur.class, object.toString());
    }

    @Override
    public List<Object> getAll() {
        return fdao.getAll("FROM JenisLembur");
    }

    @Override
    public List<Object> search(String category, String search) {
        return fdao.getAll("FROM JenisLembur WHERE " + category + " LIKE '%" + search + "%'");
    }

    @Override
    public Object getById(String id) {
        return fdao.getById("FROM JenisLembur where kd_lembur='" + id + "'");
    }
}

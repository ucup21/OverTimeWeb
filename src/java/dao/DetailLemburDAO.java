/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.DetailLembur;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import tools.HibernateUtil;

/**
 *
 * @author Asus
 */
public class DetailLemburDAO implements InterfaceDAO {

    public SessionFactory factory;
    public Session session;
    public Transaction transaksi;
    public FunctionsDAO fdao;

    public DetailLemburDAO() {
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
        return fdao.delete(DetailLembur.class, (object + ""));
    }

    @Override
    public List<Object> getAll() {
        return fdao.getAll("FROM DetailLembur");
    }

    @Override
    public List<Object> search(String category, String search) {
        return fdao.getAll("FROM DetailLembur WHERE " + category + " LIKE '%" + search + "%'");
    }

    @Override
    public Object getById(String id) {
        return fdao.getById("from DetailLembur where KD_DETAIL_LEMBUR = '" + id + "'");
    }
    
    public String getAutoID()
    {
        return (String) fdao.getById("SELECT CONCAT('DL',LPAD((TO_NUMBER(SUBSTR(MAX(KD_DETAIL_LEMBUR),3,3))+1),3,'0')) FROM DetailLembur");
    }
    
    public List<Object> report(String category, String bulan) {
        return fdao.getAll("FROM DetailLembur WHERE " + category + " LIKE '%" + bulan + "%'");
    }
    
    public List<Object> reportNip(String category, String bulan, String nip) {
        return fdao.getAll("FROM DetailLembur WHERE " + category + " LIKE '%" + bulan + "%' AND nip = "+nip);
    }

}

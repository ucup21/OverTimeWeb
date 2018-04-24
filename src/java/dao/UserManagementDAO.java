/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Usermanagement;
import java.math.BigDecimal;
import java.util.List;
import tools.BCrypt;
import tools.HibernateUtil;

/**
 *
 * @author hp
 */
public class UserManagementDAO {

    private final FunctionsDAO fdao;
    
    public UserManagementDAO() {
         this.fdao = new FunctionsDAO(HibernateUtil.getSessionFactory());
    }

    
  
    public boolean save(Object object) {
        return fdao.insert(object);
    }

  
    public boolean delete(Object object) {
        return fdao.delete(Usermanagement.class, BigDecimal.valueOf(new Long(object.toString())));
    }

    public List<Object> getAll() {
        return fdao.getAll("FROM Usermanagement ORDER BY id");
    }

    public List<Object> search(String category, String search) {
        return fdao.getAll("FROM Usermanagement WHERE "+category
                +" LIKE '%"+search+"%'ORDER BY id");
    }

    public Object getById(String id) {
        return fdao.getById("FROM Usermanagement WHERE id="+id);
                
    }

    
    public Object getAutoID() {
        return fdao.getById("SELECT MAX(id)+1 FROM Usermanagement");
    }
    
    public boolean login(String category, String username, String password){
        Usermanagement u = (Usermanagement) search(category, username).get(0);
        return BCrypt.checkpw(password, u.getPassword());
    }

    
    
}

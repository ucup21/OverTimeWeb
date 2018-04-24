/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import dao.DetailDAO;
import dao.JenisLemburDAO;
import dao.PegawaiMiiDAO;
import dao.UserManagementDAO;
import entities.JenisLembur;

/**
 *
 * @author Asus
 */
public class test {
    public static void main(String[] args) {
//        System.out.println(new PegawaiMiiDAO().getAutoID());
//System.out.println(new DetailDAO().getById("SA", "LB001"));
System.out.println(new UserManagementDAO().search("username", "sas"));
    }
}

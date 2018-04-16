/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author hp
 */
@Embeddable
public class DetailPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "KD_JABATAN")
    private String kdJabatan;
    @Basic(optional = false)
    @Column(name = "KD_LEMBUR")
    private String kdLembur;

    public DetailPK() {
    }

    public DetailPK(String kdJabatan, String kdLembur) {
        this.kdJabatan = kdJabatan;
        this.kdLembur = kdLembur;
    }

    public String getKdJabatan() {
        return kdJabatan;
    }

    public void setKdJabatan(String kdJabatan) {
        this.kdJabatan = kdJabatan;
    }

    public String getKdLembur() {
        return kdLembur;
    }

    public void setKdLembur(String kdLembur) {
        this.kdLembur = kdLembur;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (kdJabatan != null ? kdJabatan.hashCode() : 0);
        hash += (kdLembur != null ? kdLembur.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DetailPK)) {
            return false;
        }
        DetailPK other = (DetailPK) object;
        if ((this.kdJabatan == null && other.kdJabatan != null) || (this.kdJabatan != null && !this.kdJabatan.equals(other.kdJabatan))) {
            return false;
        }
        if ((this.kdLembur == null && other.kdLembur != null) || (this.kdLembur != null && !this.kdLembur.equals(other.kdLembur))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.DetailPK[ kdJabatan=" + kdJabatan + ", kdLembur=" + kdLembur + " ]";
    }
    
}

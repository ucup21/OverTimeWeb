/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author hp
 */
@Entity
@Table(name = "DETAIL_LEMBUR")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DetailLembur.findAll", query = "SELECT d FROM DetailLembur d")
    , @NamedQuery(name = "DetailLembur.findByKdDetailLembur", query = "SELECT d FROM DetailLembur d WHERE d.kdDetailLembur = :kdDetailLembur")
    , @NamedQuery(name = "DetailLembur.findByTglLembur", query = "SELECT d FROM DetailLembur d WHERE d.tglLembur = :tglLembur")})
public class DetailLembur implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "KD_DETAIL_LEMBUR")
    private String kdDetailLembur;
    @Column(name = "TGL_LEMBUR")
    @Temporal(TemporalType.TIMESTAMP)
    private Date tglLembur;
    @JoinColumn(name = "KD_LEMBUR", referencedColumnName = "KD_LEMBUR")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private JenisLembur kdLembur;
    @JoinColumn(name = "NIP", referencedColumnName = "NIP")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private PegawaiMii nip;

    public DetailLembur() {
    }

    public DetailLembur(String kdDetailLembur) {
        this.kdDetailLembur = kdDetailLembur;
    }

    public String getKdDetailLembur() {
        return kdDetailLembur;
    }

    public void setKdDetailLembur(String kdDetailLembur) {
        this.kdDetailLembur = kdDetailLembur;
    }

    public Date getTglLembur() {
        return tglLembur;
    }

    public void setTglLembur(Date tglLembur) {
        this.tglLembur = tglLembur;
    }

    public JenisLembur getKdLembur() {
        return kdLembur;
    }

    public void setKdLembur(JenisLembur kdLembur) {
        this.kdLembur = kdLembur;
    }

    public PegawaiMii getNip() {
        return nip;
    }

    public void setNip(PegawaiMii nip) {
        this.nip = nip;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (kdDetailLembur != null ? kdDetailLembur.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DetailLembur)) {
            return false;
        }
        DetailLembur other = (DetailLembur) object;
        if ((this.kdDetailLembur == null && other.kdDetailLembur != null) || (this.kdDetailLembur != null && !this.kdDetailLembur.equals(other.kdDetailLembur))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.DetailLembur[ kdDetailLembur=" + kdDetailLembur + " ]";
    }
    
}

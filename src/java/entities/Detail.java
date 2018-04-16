/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author hp
 */
@Entity
@Table(name = "DETAIL")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Detail.findAll", query = "SELECT d FROM Detail d")
    , @NamedQuery(name = "Detail.findByKdJabatan", query = "SELECT d FROM Detail d WHERE d.detailPK.kdJabatan = :kdJabatan")
    , @NamedQuery(name = "Detail.findByKdLembur", query = "SELECT d FROM Detail d WHERE d.detailPK.kdLembur = :kdLembur")
    , @NamedQuery(name = "Detail.findByTarif", query = "SELECT d FROM Detail d WHERE d.tarif = :tarif")})
public class Detail implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected DetailPK detailPK;
    @Column(name = "TARIF")
    private Long tarif;
    @JoinColumn(name = "KD_JABATAN", referencedColumnName = "KD_JABATAN", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Jabatan jabatan;
    @JoinColumn(name = "KD_LEMBUR", referencedColumnName = "KD_LEMBUR", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private JenisLembur jenisLembur;

    public Detail() {
    }

    public Detail(DetailPK detailPK) {
        this.detailPK = detailPK;
    }

    public Detail(String kdJabatan, String kdLembur) {
        this.detailPK = new DetailPK(kdJabatan, kdLembur);
    }

    public DetailPK getDetailPK() {
        return detailPK;
    }

    public void setDetailPK(DetailPK detailPK) {
        this.detailPK = detailPK;
    }

    public Long getTarif() {
        return tarif;
    }

    public void setTarif(Long tarif) {
        this.tarif = tarif;
    }

    public Jabatan getJabatan() {
        return jabatan;
    }

    public void setJabatan(Jabatan jabatan) {
        this.jabatan = jabatan;
    }

    public JenisLembur getJenisLembur() {
        return jenisLembur;
    }

    public void setJenisLembur(JenisLembur jenisLembur) {
        this.jenisLembur = jenisLembur;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (detailPK != null ? detailPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Detail)) {
            return false;
        }
        Detail other = (Detail) object;
        if ((this.detailPK == null && other.detailPK != null) || (this.detailPK != null && !this.detailPK.equals(other.detailPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Detail[ detailPK=" + detailPK + " ]";
    }
    
}

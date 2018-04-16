/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author hp
 */
@Entity
@Table(name = "JENIS_LEMBUR")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "JenisLembur.findAll", query = "SELECT j FROM JenisLembur j")
    , @NamedQuery(name = "JenisLembur.findByKdLembur", query = "SELECT j FROM JenisLembur j WHERE j.kdLembur = :kdLembur")
    , @NamedQuery(name = "JenisLembur.findByLamaLembur", query = "SELECT j FROM JenisLembur j WHERE j.lamaLembur = :lamaLembur")})
public class JenisLembur implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "KD_LEMBUR")
    private String kdLembur;
    @Column(name = "LAMA_LEMBUR")
    private Short lamaLembur;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "kdLembur", fetch = FetchType.LAZY)
    private List<DetailLembur> detailLemburList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "jenisLembur", fetch = FetchType.LAZY)
    private List<Detail> detailList;

    public JenisLembur() {
    }

    public JenisLembur(String kdLembur) {
        this.kdLembur = kdLembur;
    }

    public String getKdLembur() {
        return kdLembur;
    }

    public void setKdLembur(String kdLembur) {
        this.kdLembur = kdLembur;
    }

    public Short getLamaLembur() {
        return lamaLembur;
    }

    public void setLamaLembur(Short lamaLembur) {
        this.lamaLembur = lamaLembur;
    }

    @XmlTransient
    public List<DetailLembur> getDetailLemburList() {
        return detailLemburList;
    }

    public void setDetailLemburList(List<DetailLembur> detailLemburList) {
        this.detailLemburList = detailLemburList;
    }

    @XmlTransient
    public List<Detail> getDetailList() {
        return detailList;
    }

    public void setDetailList(List<Detail> detailList) {
        this.detailList = detailList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (kdLembur != null ? kdLembur.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof JenisLembur)) {
            return false;
        }
        JenisLembur other = (JenisLembur) object;
        if ((this.kdLembur == null && other.kdLembur != null) || (this.kdLembur != null && !this.kdLembur.equals(other.kdLembur))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.JenisLembur[ kdLembur=" + kdLembur + " ]";
    }
    
}

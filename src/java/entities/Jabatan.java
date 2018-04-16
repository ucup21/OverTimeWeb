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
@Table(name = "JABATAN")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Jabatan.findAll", query = "SELECT j FROM Jabatan j")
    , @NamedQuery(name = "Jabatan.findByKdJabatan", query = "SELECT j FROM Jabatan j WHERE j.kdJabatan = :kdJabatan")
    , @NamedQuery(name = "Jabatan.findByNamaJabatan", query = "SELECT j FROM Jabatan j WHERE j.namaJabatan = :namaJabatan")})
public class Jabatan implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "KD_JABATAN")
    private String kdJabatan;
    @Column(name = "NAMA_JABATAN")
    private String namaJabatan;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "kdJabatan", fetch = FetchType.LAZY)
    private List<PegawaiMii> pegawaiMiiList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "jabatan", fetch = FetchType.LAZY)
    private List<Detail> detailList;

    public Jabatan() {
    }

    public Jabatan(String kdJabatan) {
        this.kdJabatan = kdJabatan;
    }

    public String getKdJabatan() {
        return kdJabatan;
    }

    public void setKdJabatan(String kdJabatan) {
        this.kdJabatan = kdJabatan;
    }

    public String getNamaJabatan() {
        return namaJabatan;
    }

    public void setNamaJabatan(String namaJabatan) {
        this.namaJabatan = namaJabatan;
    }

    @XmlTransient
    public List<PegawaiMii> getPegawaiMiiList() {
        return pegawaiMiiList;
    }

    public void setPegawaiMiiList(List<PegawaiMii> pegawaiMiiList) {
        this.pegawaiMiiList = pegawaiMiiList;
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
        hash += (kdJabatan != null ? kdJabatan.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Jabatan)) {
            return false;
        }
        Jabatan other = (Jabatan) object;
        if ((this.kdJabatan == null && other.kdJabatan != null) || (this.kdJabatan != null && !this.kdJabatan.equals(other.kdJabatan))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Jabatan[ kdJabatan=" + kdJabatan + " ]";
    }
    
}

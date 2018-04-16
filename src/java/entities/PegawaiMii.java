/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author hp
 */
@Entity
@Table(name = "PEGAWAI_MII")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PegawaiMii.findAll", query = "SELECT p FROM PegawaiMii p")
    , @NamedQuery(name = "PegawaiMii.findByNip", query = "SELECT p FROM PegawaiMii p WHERE p.nip = :nip")
    , @NamedQuery(name = "PegawaiMii.findByNama", query = "SELECT p FROM PegawaiMii p WHERE p.nama = :nama")
    , @NamedQuery(name = "PegawaiMii.findByJk", query = "SELECT p FROM PegawaiMii p WHERE p.jk = :jk")
    , @NamedQuery(name = "PegawaiMii.findByAlamat", query = "SELECT p FROM PegawaiMii p WHERE p.alamat = :alamat")
    , @NamedQuery(name = "PegawaiMii.findByTglLahir", query = "SELECT p FROM PegawaiMii p WHERE p.tglLahir = :tglLahir")
    , @NamedQuery(name = "PegawaiMii.findByTmptLahir", query = "SELECT p FROM PegawaiMii p WHERE p.tmptLahir = :tmptLahir")})
public class PegawaiMii implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "NIP")
    private Long nip;
    @Column(name = "NAMA")
    private String nama;
    @Column(name = "JK")
    private String jk;
    @Column(name = "ALAMAT")
    private String alamat;
    @Column(name = "TGL_LAHIR")
    @Temporal(TemporalType.TIMESTAMP)
    private Date tglLahir;
    @Column(name = "TMPT_LAHIR")
    private String tmptLahir;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "nip", fetch = FetchType.LAZY)
    private List<DetailLembur> detailLemburList;
    @JoinColumn(name = "KD_JABATAN", referencedColumnName = "KD_JABATAN")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Jabatan kdJabatan;

    public PegawaiMii() {
    }

    public PegawaiMii(Long nip) {
        this.nip = nip;
    }

    public Long getNip() {
        return nip;
    }

    public void setNip(Long nip) {
        this.nip = nip;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getJk() {
        return jk;
    }

    public void setJk(String jk) {
        this.jk = jk;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public Date getTglLahir() {
        return tglLahir;
    }

    public void setTglLahir(Date tglLahir) {
        this.tglLahir = tglLahir;
    }

    public String getTmptLahir() {
        return tmptLahir;
    }

    public void setTmptLahir(String tmptLahir) {
        this.tmptLahir = tmptLahir;
    }

    @XmlTransient
    public List<DetailLembur> getDetailLemburList() {
        return detailLemburList;
    }

    public void setDetailLemburList(List<DetailLembur> detailLemburList) {
        this.detailLemburList = detailLemburList;
    }

    public Jabatan getKdJabatan() {
        return kdJabatan;
    }

    public void setKdJabatan(Jabatan kdJabatan) {
        this.kdJabatan = kdJabatan;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (nip != null ? nip.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PegawaiMii)) {
            return false;
        }
        PegawaiMii other = (PegawaiMii) object;
        if ((this.nip == null && other.nip != null) || (this.nip != null && !this.nip.equals(other.nip))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.PegawaiMii[ nip=" + nip + " ]";
    }
    
}

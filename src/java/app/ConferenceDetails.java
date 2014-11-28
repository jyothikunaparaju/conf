/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;
import java.util.*;
import javax.xml.bind.annotation.XmlTransient;
/**
 *
 *     @NamedQuery(name = "ConferenceDetails.findAll", query = "SELECT c FROM ConferenceDetails c"),
    @NamedQuery(name = "ConferenceDetails.findByConfId", query = "SELECT c FROM ConferenceDetails c WHERE c.confId = :confId"),
    @NamedQuery(name = "ConferenceDetails.findByConfDetails", query = "SELECT c FROM ConferenceDetails c WHERE c.confDetails = :confDetails"),
    @NamedQuery(name = "ConferenceDetails.findByOraganization", query = "SELECT c FROM ConferenceDetails c WHERE c.oraganization = :oraganization"),
    @NamedQuery(name = "ConferenceDetails.findByContact", query = "SELECT c FROM ConferenceDetails c WHERE c.contact = :contact"),
    @NamedQuery(name = "ConferenceDetails.findByFromdate", query = "SELECT c FROM ConferenceDetails c WHERE c.fromdate = :fromdate"),
    @NamedQuery(name = "ConferenceDetails.findByTodate", query = "SELECT c FROM ConferenceDetails c WHERE c.todate = :todate"),
    @NamedQuery(name = "ConferenceDetails.findByEmail", query = "SELECT c FROM ConferenceDetails c WHERE c.email = :email"),
    @NamedQuery(name = "ConferenceDetails.findByAddress", query = "SELECT c FROM ConferenceDetails c WHERE c.address = :address"),
    @NamedQuery(name = "ConferenceDetails.findByPhone", query = "SELECT c FROM ConferenceDetails c WHERE c.phone = :phone"),
    @NamedQuery(name = "ConferenceDetails.findByDescription", query = "SELECT c FROM ConferenceDetails c WHERE c.description = :description")})
public class ConferenceDetails implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "CONF_ID")
    private Integer confId;
    @Size(max = 30)
    @Column(name = "CONF_DETAILS")
    private String confDetails;
    @Size(max = 30)
    @Column(name = "ORAGANIZATION")
    private String oraganization;
    @Size(max = 30)
    @Column(name = "CONTACT")
    private String contact;
    @Column(name = "FROMDATE")
    @Temporal(TemporalType.DATE)
    private Date fromdate;
    @Column(name = "TODATE")
    @Temporal(TemporalType.DATE)
    private Date todate;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 40)
    @Column(name = "EMAIL")
    private String email;
    @Size(max = 50)
    @Column(name = "ADDRESS")
    private String address;
    @Column(name = "PHONE")
    private Integer phone;
    @Size(max = 150)
    @Column(name = "DESCRIPTION")
    private String description;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "confId")
    private Collection<ConfMember> confMemberCollection;


 */
public class ConferenceDetails {
     public ConferenceDetails() {
    }
 int confId ;
 String confDetails;
 String oraganization;
 Date fromdate;
 Date todate;
 String email;
 String address;
 int phone;
 String contact;
 String description;
 Collection <ConfMember> confMemberCollection;
    public ConferenceDetails(Integer confId) {
        this.confId = confId;
    }

    public Integer getConfId() {
        return confId;
    }

    public void setConfId(Integer confId) {
        this.confId = confId;
    }

    public String getConfDetails() {
        return confDetails;
    }

    public void setConfDetails(String confDetails) {
        this.confDetails = confDetails;
    }

    public String getOraganization() {
        return oraganization;
    }

    public void setOraganization(String oraganization) {
        this.oraganization = oraganization;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public Date getFromdate() {
        return fromdate;
    }

    public void setFromdate(Date fromdate) {
        this.fromdate = fromdate;
    }

    public Date getTodate() {
        return todate;
    }

    public void setTodate(Date todate) {
        this.todate = todate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getPhone() {
        return phone;
    }

    public void setPhone(Integer phone) {
        this.phone = phone;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @XmlTransient
    public Collection<ConfMember> getConfMemberCollection() {
        return confMemberCollection;
    }

    public void setConfMemberCollection(Collection<ConfMember> confMemberCollection) {
        this.confMemberCollection = confMemberCollection;
    }


    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ConferenceDetails)) {
            return false;
        }
        ConferenceDetails other = (ConferenceDetails) object;
        if ((this.confId == 0 && other.confId != 0) || (this.confId != 0 && this.confId != other.confId)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.myapp.struts.ConferenceDetails[ confId=" + confId + " ]";
    }
    
}


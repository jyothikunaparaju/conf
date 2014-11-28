/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app;

import java.util.Date;
import java.util.List;

/**
 *
 * @author Ravi
 *
 * @Entity
 * @Table(name = "member")
 * @XmlRootElement
 * @NamedQueries({
 * @NamedQuery(name = "Member1.findAll", query = "SELECT m FROM Member1 m"),
 * @NamedQuery(name = "Member1.findByEmail", query = "SELECT m FROM Member1 m
 * WHERE m.email = :email"),
 * @NamedQuery(name = "Member1.findByName", query = "SELECT m FROM Member1 m
 * WHERE m.name = :name"),
 * @NamedQuery(name = "Member1.findByPassword", query = "SELECT m FROM Member1 m
 * WHERE m.password = :password"),
 * @NamedQuery(name = "Member1.findByRegDate", query = "SELECT m FROM Member1 m
 * WHERE m.regDate = :regDate"),
 * @NamedQuery(name = "Member1.findByPhone", query = "SELECT m FROM Member1 m
 * WHERE m.phone = :phone"),
 * @NamedQuery(name = "Member1.findByAddress", query = "SELECT m FROM Member1 m
 * WHERE m.address = :address"),
 * @NamedQuery(name = "Member1.findByDesignation", query = "SELECT m FROM
 * Member1 m WHERE m.designation = :designation"),
 * @NamedQuery(name = "Member1.findByActive", query = "SELECT m FROM Member1 m
 * WHERE m.active = :active")}) public class Member1 implements Serializable {
 * private static final long serialVersionUID = 1L; //
 * @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
 * message="Invalid email")//if the field contains email address consider using
 * this annotation to enforce field validation
 * @Id
 * @Basic(optional = false)
 * @NotNull
 * @Size(min = 1, max = 40)
 * @Column(name = "EMAIL") private String email;
 * @Basic(optional = false)
 * @NotNull
 * @Size(min = 1, max = 30)
 * @Column(name = "NAME") private String name;
 * @Basic(optional = false)
 * @NotNull
 * @Size(min = 1, max = 20)
 * @Column(name = "PASSWORD") private String password;
 * @Basic(optional = false)
 * @NotNull
 * @Column(name = "REG_DATE")
 * @Temporal(TemporalType.DATE) private Date regDate;
 * @Column(name = "PHONE") private Integer phone;
 * @Size(max = 50)
 * @Column(name = "ADDRESS") private String address;
 * @Size(max = 30)
 * @Column(name = "DESIGNATION") private String designation;
 * @Column(name = "ACTIVE") private Short active;
 * @OneToMany(cascade = CascadeType.ALL, mappedBy = "eventCreater") private
 * Collection<Event> eventCollection;
 * @OneToMany(cascade = CascadeType.ALL, mappedBy = "email") private
 * Collection<Event> eventCollection1;
 * @OneToMany(cascade = CascadeType.ALL, mappedBy = "memEmail") private
 * Collection<ConfMember> confMemberCollection;
 */
public class Member {

    public Member() {
    }

    public Member(String email) {
        this.email = email;
    }

    public Member(String email, String name, String password, Date regDate) {
        this.email = email;
        this.name = name;
        this.password = password;
        this.regDate = regDate;

    }
    private int memberId;

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }
    private String email;
    private String name;
    private String password;
    private Date regDate;
    private int phone;
    private String address;
    private short active;
    private String designation;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public Integer getPhone() {
        return phone;
    }

    public void setPhone(Integer phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
        
    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public Short getActive() {
        return active;
    }

    public void setActive(Short active) {
        this.active = active;
    }
    
    public void setPhone(int phone) {
        this.phone = phone;
    }


    public void setActive(short active) {
        this.active = active;
    }
    
    // Events memeber signed in 
    List <Event> events;
    
    public List<Event> getEvents() {
        return events;
    }

    public void setEvents(List<Event> events) {
        this.events = events;
    }

    @Override
    public String toString() {
        return "com.myapp.struts.Member1[ email=" + email + " ]";
    }

}

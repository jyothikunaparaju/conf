/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

/**
 *
 * @author Ravi
 
@Entity
@Table(name = "conf_member")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ConfMember.findAll", query = "SELECT c FROM ConfMember c"),
    @NamedQuery(name = "ConfMember.findByConfMemId", query = "SELECT c FROM ConfMember c WHERE c.confMemId = :confMemId")})
 implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "CONF_MEM_ID")
    private Integer confMemId;
    @JoinColumn(name = "CONF_ID", referencedColumnName = "CONF_ID")
    @ManyToOne(optional = false)
    private ConferenceDetails confId;
    @JoinColumn(name = "MEM_EMAIL", referencedColumnName = "EMAIL")
    @ManyToOne(optional = false)
    private Member1 memEmail;*/
public class ConfMember {

    public ConfMember() {
    }
    
    private ConferenceDetails conf;

    public ConferenceDetails getConf() {
        return conf;
    }

    public void setConf(ConferenceDetails conf) {
        this.conf = conf;
    }
  private Member member ;
    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }
    

   int confMemId ;

    public int getConfMemId() {
        return confMemId;
    }

    public void setConfMemId(int confMemId) {
        this.confMemId = confMemId;
    }
   
      
    @Override
    public String toString() {
        return ""+ confMemId ;
    }
    
}

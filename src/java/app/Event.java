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
 * @Table(name = "event")
 * @XmlRootElement
 * @NamedQueries({
 * @NamedQuery(name = "Event.findAll", query = "SELECT e FROM Event e"),
 * @NamedQuery(name = "Event.findByEventId", query = "SELECT e FROM Event e
 * WHERE e.eventId = :eventId"),
 * @NamedQuery(name = "Event.findByConference", query = "SELECT e FROM Event e
 * WHERE e.conference = :conference"),
 * @NamedQuery(name = "Event.findByEventDetails", query = "SELECT e FROM Event e
 * WHERE e.eventDetails = :eventDetails"),
 * @NamedQuery(name = "Event.findByLocation", query = "SELECT e FROM Event e
 * WHERE e.location = :location"),
 * @NamedQuery(name = "Event.findByPhone", query = "SELECT e FROM Event e WHERE
 * e.phone = :phone"),
 * @NamedQuery(name = "Event.findByDate", query = "SELECT e FROM Event e WHERE
 * e.date = :date"),
 * @NamedQuery(name = "Event.findByTime", query = "SELECT e FROM Event e WHERE
 * e.time = :time")}) public class Event implements Serializable { private
 * static final long serialVersionUID = 1L;
 * @Id
 * @GeneratedValue(strategy = GenerationType.IDENTITY)
 * @Basic(optional = false)
 * @Column(name = "EVENT_ID") private Integer eventId;
 * @Basic(optional = false)
 * @NotNull
 * @Size(min = 1, max = 40)
 * @Column(name = "CONFERENCE") private String conference;
 * @Size(max = 40)
 * @Column(name = "EVENT_DETAILS") private String eventDetails;
 * @Size(max = 50)
 * @Column(name = "LOCATION") private String location;
 * @Column(name = "PHONE") private Integer phone;
 * @Basic(optional = false)
 * @NotNull
 * @Column(name = "DATE")
 * @Temporal(TemporalType.DATE) private Date date;
 * @Basic(optional = false)
 * @NotNull
 * @Column(name = "TIME") private double time;
 * @JoinColumn(name = "EVENT_CREATER", referencedColumnName = "NAME")
 * @ManyToOne(optional = false) private Member1 eventCreater;
 * @JoinColumn(name = "EMAIL", referencedColumnName = "EMAIL")
 * @ManyToOne(optional = false) private Member1 email;
 */
public class Event {

    public static Event create(Integer eventId) {
        return new Event(eventId);
    }

    public Event(Integer eventId, ConferenceDetails conference, Date date, double time) {
        this.eventId = eventId;
        this.conference = conference;
        this.date = date;
        this.time = time;
    }

    public Event() {
    }

    private Event(Integer eventId) {
        this.eventId = eventId;
    }

    public Integer getEventId() {
        return eventId;
    }

    Integer eventId;
    ConferenceDetails conference;
    Date date;
    Double time;
    String eventDetails;
    String location;
    Member eventCreater;
    List<Member> members;
    
    //Session user to display Resitedred 
    Member user;

    public Member getUser() {
        return user;
    }

    public void setUser(Member user) {
        this.user = user;
    }

    public Double getTime() {
        return time;
    }

    public void setTime(Double time) {
        this.time = time;
    }

    public void setEventId(Integer eventId) {
        this.eventId = eventId;
    }

    public List<Member> getMembers() {
        return members;
    }

    public void setMembers(List<Member> members) {
        this.members = members;
    }

    public ConferenceDetails getConference() {
        return conference;
    }

    public void setConference(ConferenceDetails conference) {
        this.conference = conference;
    }

    public String getEventDetails() {
        return eventDetails;
    }

    public void setEventDetails(String eventDetails) {
        this.eventDetails = eventDetails;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Member getEventCreater() {
        return eventCreater;
    }

    public void setEventCreater(Member eventCreater) {
        this.eventCreater = eventCreater;
    }
 boolean signin ;

    public boolean isSignin() {
        return signin;
    }

    public void setSignin(boolean signin) {
        this.signin = signin;
    }
    @Override
    public String toString() {
        return "com.myapp.struts.Event[ eventId=" + eventId + " ]";
    }

}

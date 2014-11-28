/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

/**
 *
 * @author Ravi
 */
public class EventMember {
    int eventMemId;
    Event event;
    Member member;
    short leadBy;

    public int getEventMemId() {
        return eventMemId;
    }

   
    public void setEventMemId(int eventMemId) {
        this.eventMemId = eventMemId;
    }

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public short getLeadBy() {
        return leadBy;
    }

    public void setLeadBy(short leadBy) {
        this.leadBy = leadBy;
    }
   
     @Override
    public String toString() {
        return "EventMember{" + "eventMemId=" + eventMemId + ", event=" + event + ", member=" + member + ", leadBy=" + leadBy + '}';
    }

}

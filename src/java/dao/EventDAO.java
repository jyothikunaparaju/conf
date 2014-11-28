/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import app.ConferenceDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import util.DBUtil;
import app.Event;
import app.EventMember;
import app.Member;

/**
 *
 * @author Ravi
 */
public class EventDAO {

    private Connection connection;

    public EventDAO() {
        connection = DBUtil.getConnection();
    }

    public void checkEvent(Event event) {
        try {
            if (event.getEventId() != 0) {
                System.out.println("eventid " + event.getEventId());
                updateEvent(event);
            } else {
                addEvent(event);
            }
        } catch (Exception ex) {
            System.out.println("Error in check() -->" + ex.getMessage());
        }

    }

    public boolean addEvent(Event event) {
        try {

            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO event(EVENT_ID,"
                    + "CONFERENCE  ,EVENT_DETAILS  ,MEMBER_ID  ,"
                    + "LOCATION  ,DATE  ,TIME) "
                    + "values ( ?,?, ?, ? ,?,?,?)");
            /* INSERT INTO conference.event(
             EVENT_ID  ,CONFERENCE  ,EVENT_DETAILS  ,EVENT_CREATER  ,LOCATION  ,EMAIL  ,PHONE  ,`DATE`  ,`TIME`) VALUES (
             EVENT_ID  ,CONFERENCE  ,EVENT_DETAILS  ,EVENT_CREATER  ,LOCATION  ,EMAIL  ,PHONE  ,DATE  ,TIME)*/
            // event.setEventId(getNextEventid());
            System.out.println("eventid in db ..." + event.getEventId());
            preparedStatement.setInt(1, 0);
            preparedStatement.setString(2, event.getConference().getConfDetails());
            preparedStatement.setString(3, event.getEventDetails());
            preparedStatement.setInt(4, event.getEventCreater().getMemberId());
            preparedStatement.setString(5, event.getLocation());
            preparedStatement.setDate(6, new java.sql.Date(event.getDate().getTime()));
            preparedStatement.setDouble(7, event.getTime());
            preparedStatement.executeUpdate();
            event.setEventId(getNextEventid());
            int lead = 1;
            EventMember em = addEventMember(event.getEventId(), event.getEventCreater().getMemberId(), lead);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    public EventMember addEventMember(int eventid, int memberid, int lead) {
        System.out.println(" in eventmember insert " + eventid +"ggg" + memberid + lead );
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO event_member (EVENT_MEM_ID ,EVENT_ID , MEMBER_ID ,LEADBY )  values (?, ? , ? ,?  )");
            preparedStatement.setInt(1, 0);                
            preparedStatement.setInt(2, eventid);
             preparedStatement.setInt(3, memberid );
               preparedStatement.setInt(4, lead);
                  preparedStatement.executeUpdate();
         
           
          
        } catch (Exception e) {
            System.out.println("Exception evenrt member ");
        }
        return new EventMember();
    }

    public int getNextEventid() {
        System.out.println(" IN GET NEXT EVENT ID ...");
        int id = 0;
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select max(EVENT_ID) from EVENT");
            if (rs.next()) {
                id = rs.getInt(1);
                System.out.println("In in ,,,,," + id);
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    public boolean  deleteEvent(int eventId) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("delete from event where EVENT_ID=?");
            // Parameters start with 1
            preparedStatement.setInt(1, eventId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false ;
        }
        return true;
    }
public boolean deleteEventMember ( int eventid){
     try {
            PreparedStatement preparedStatement = connection.prepareStatement("delete  * from event_member  where EVENT_ID=?");
            // Parameters start with 1
            preparedStatement.setInt(1, eventid);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false ;
        }
     return true;
}
    public void updateEvent(Event event) {
        try {
            System.out.println("event > ...." + event);
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE event SET  CONFERENCE =  ?    ,EVENT_DETAILS = ?   ,MEMBER_ID=?  ,LOCATION = ? ,DATE =?, TIME =  ?,EVENT_DETAILS = ?   WHERE EVENT_ID = ? ");
            preparedStatement.setString(1, event.getConference().getConfDetails());
            preparedStatement.setString(2, event.getEventDetails());
            preparedStatement.setInt(3, event.getEventCreater().getMemberId());
            preparedStatement.setString(4, event.getLocation());
            preparedStatement.setDate(5, new java.sql.Date(event.getDate().getTime()));
            preparedStatement.setDouble(6, event.getTime());
                preparedStatement.setString(7, event.getEventDetails());
        
            preparedStatement.setInt(8, event.getEventId());
            
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
   public Event  updateEventSignIn(Event event , int memberid){
      if (checkSignIn(event.getEventId (), memberid)){
          event.setSignin(true);
      }
       
       return event; 
   }
   public boolean checkSignIn(int eventid , int memberid){
       System.out.println("this gettinf sign in status");
   
         try {
              PreparedStatement preparedStatement = connection.prepareStatement("select *  from event_member  where EVENT_ID=? and member_id = ?  and leadby= 0 ");
            // Parameters start with 1
            preparedStatement.setInt(1, eventid);
            preparedStatement.setInt(2, memberid);            
          ResultSet rs =   preparedStatement.executeQuery();
              if (rs.next()) {
                  System.out.println("returning true");
               return true;
              }
         } catch(Exception e){
                 System.out.println("Exception in sing update ");
                 }
      
       return false;
   }
   
    public List<Event> getAllEvents() {
        System.out.println("GET ALL EVENTS dao ");
        List<Event> events = new ArrayList<Event>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from EVENT");
            ConferenceDetails cd = null;
            Event event = null;
            Member member = null;
            System.out.println("dggdfgdfg");
            while (rs.next()) {
                System.out.println("wewegekGLDSGLKSLGS");
                cd = new ConferenceDetails();
                event = new Event();
                event.setEventId(rs.getInt("EVENT_ID"));
                cd.setConfDetails(rs.getString("CONFERENCE"));
                event.setConference(cd);
                event.setEventDetails(rs.getString("EVENT_DETAILS"));
                MemberDAO mdao = new MemberDAO();
                member = mdao.getMemberById("" + rs.getInt("MEMBER_ID"));
                event.setEventCreater(member);
                event.setLocation(rs.getString("LOCATION"));
                System.out.println("Location ......." + event.getLocation());
                event.setDate(rs.getDate("DATE"));
                event.setTime(rs.getDouble("TIME"));
             //   List <Member> members = mdao.getMembersbyEventId(event.getEventId());
                //   event.setMembers(members);
                events.add(event);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return events;
    }
      public List<Event> getEventsWithSignin(int memberid) {
        System.out.println("GET ALL EVENTS dao ");
        List<Event> events = new ArrayList<Event>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from EVENT");
            ConferenceDetails cd = null;
            Event event = null;
            Member member = null;
            System.out.println("dggdfgdfg");
            while (rs.next()) {
                System.out.println("wewegekGLDSGLKSLGS");
                cd = new ConferenceDetails();
                event = new Event();
                event.setEventId(rs.getInt("EVENT_ID"));
                cd.setConfDetails(rs.getString("CONFERENCE"));
                event.setConference(cd);
                event.setEventDetails(rs.getString("EVENT_DETAILS"));
                MemberDAO mdao = new MemberDAO();
                member = mdao.getMemberById("" + rs.getInt("MEMBER_ID"));
                event.setEventCreater(member);
                event.setLocation(rs.getString("LOCATION"));
                System.out.println("Location ......." + event.getLocation());
                event.setDate(rs.getDate("DATE"));
                event.setTime(rs.getDouble("TIME"));
             //   List <Member> members = mdao.getMembersbyEventId(event.getEventId());
                //   event.setMembers(members);
                events.add(event);
                events = updateEventSignIn(events , memberid);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return events;
    }
       public List updateEventSignIn(List events, int memberid) {
        EventDAO dao = new EventDAO();
        Event event = null;
        List eventslist = new ArrayList();
        for (Object item : events) {
            event = dao.updateEventSignIn((Event) item, memberid);
            System.out.println("item................" + event.isSignin());
            eventslist.add(event);

        }

        return eventslist;
    }


    public Event getEventById(int eventId) {
        Event event = new Event();
        System.out.println("in db ...  eventid " + eventId);
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from event where EVENT_ID=?");
            preparedStatement.setInt(1, eventId);
            ResultSet rs = preparedStatement.executeQuery();
            ConferenceDetails cd = null;
            Member member = null;
            if (rs.next()) {
                cd = new ConferenceDetails();
                event = new Event();
                event.setEventId(rs.getInt("EVENT_ID"));
                cd.setConfDetails(rs.getString("CONFERENCE"));
                event.setConference(cd);
                event.setEventDetails(rs.getString("EVENT_DETAILS"));
                MemberDAO mdao = new MemberDAO();
                member = mdao.getMemberById("" + rs.getInt("MEMBER_ID"));
                event.setEventCreater(member);
                event.setLocation(rs.getString("LOCATION"));
                event.setDate(rs.getDate("DATE"));
                event.setTime(rs.getDouble("TIME"));
                List<Member> members = mdao.getMembersbyEventId(event.getEventId());
                event.setMembers(members);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return event;
    }

    public Event getEventByCreater(int memberId) {
        Event event = new Event();
        System.out.println("in db ...getEventByCreater....................  eventid " + memberId);
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from event where member_ID=?");
            preparedStatement.setInt(1, memberId);
            ResultSet rs = preparedStatement.executeQuery();
            ConferenceDetails cd = null;
            Member member = null;
            if (rs.next()) {
                cd = new ConferenceDetails();
                event = new Event();
                event.setEventId(rs.getInt("EVENT_ID"));
                cd.setConfDetails(rs.getString("CONFERENCE"));
                event.setConference(cd);
                event.setEventDetails(rs.getString("EVENT_DETAILS"));
                MemberDAO mdao = new MemberDAO();
                member = mdao.getMemberById("" + rs.getInt("MEMBER_ID"));
                event.setEventCreater(member);
                event.setLocation(rs.getString("LOCATION"));
                event.setDate(rs.getDate("DATE"));
                event.setTime(rs.getDouble("TIME"));
               // List <Member> members = mdao.getMembersbyEventId(event.getEventId());
                // event.setMembers(members);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return event;
    }
}

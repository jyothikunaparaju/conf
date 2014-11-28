/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import app.Event;
import app.EventMember;
import app.Member;
import java.sql.*;
import java.util.*;

import util.*;

public class MemberDAO {

    private Connection connection;

    public MemberDAO() {
        connection = DBUtil.getConnection();
    }

    public void checkMember(Member member) {
        try {
            PreparedStatement ps = connection.prepareStatement("select EMAIL    from member where EMAIL = ?");
            ps.setString(1, member.getEmail());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) // found
            {
                updateMember(member);
            } else {
                addMember(member);
            }
        } catch (Exception ex) {
            System.out.println("Error in check() -->" + ex.getMessage());
        }
    }

    public void addMember(Member member) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("insert into member (MEMBER_ID ,EMAIL  ,NAME   ,PASSWORD  ,REG_DATE  ,PHONE  ,ADDRESS  ,DESIGNATION  ,ACTIVE ) values (?, ?, ?, ?, ? ,?,?,?,?)");
            /*INSERT INTO conference.member(EMAIL  ,NAME   ,PASSWORD  ,REG_DATE  ,PHONE  ,ADDRESS  ,DESIGNATION  ,ACTIVE ) VALUES (  */
            preparedStatement.setInt(1, member.getMemberId());            
            preparedStatement.setString(2, member.getEmail());
            preparedStatement.setString(3, member.getName());
            preparedStatement.setString(4, member.getPassword());
            preparedStatement.setDate(5, new java.sql.Date(member.getRegDate().getTime()));
            preparedStatement.setInt(6, member.getPhone());
            preparedStatement.setString(7, member.getAddress());
            preparedStatement.setString(8, member.getDesignation());
            preparedStatement.setInt(9, member.getActive());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteMember(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("delete from member where member_id=?");
            // Parameters start with 1
            preparedStatement.setInt(1, id );
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

  /*  public void updateMealId(Member member) {
        System.out.println("Memeber Uname =" + member.getEmail() + "member Meal id " + member.getMealId());
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("update users set mealId=? where uname=?");
            // Parameters start with 1
            System.out.println(member.getMealId() + member.getUname());
            preparedStatement.setInt(1, member.getMealId());
            preparedStatement.setString(2, member.getUname());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
*/
    public void updateMember(Member member) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE member SET EMAIL=?,NAME=?,PASSWORD = ?  ,REG_DATE = ?  ,PHONE = ?  ,ADDRESS = ? EMAIL=?,NAME=?,PASSWORD = ?,REG_DATE = ?  ,PHONE = ? ,ADDRESS = ? ,DESIGNATION = ?  ,ACTIVE = ? WHERE MEMBER_ID = ?");
           // Parameters start with 1
              preparedStatement.setString(1, member.getEmail());
            preparedStatement.setString(2, member.getName());
            preparedStatement.setString(3, member.getPassword());
            preparedStatement.setDate(4, new java.sql.Date(member.getRegDate().getTime()));
            preparedStatement.setInt(5, member.getPhone());
            preparedStatement.setString(6, member.getAddress());
            preparedStatement.setString(7, member.getDesignation());
            preparedStatement.setInt(8, member.getActive());
            preparedStatement.setInt(9, member.getMemberId());            
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public EventMember addEventMember(EventMember em){
        return em;
    }

    public void updateStatus(Member member) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("update member set Active =? where member_id=?");
            System.out.println("STATUS " + member.getActive());
            preparedStatement.setInt(1, member.getActive());
            preparedStatement.setInt(2, member.getMemberId());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Member> getMembersbyEventId(int eventId) {
        System.out.println("EVENT ID........  " + eventId);
        List<Member> members = new ArrayList<Member>();
        try {
     //       PreparedStatement preparedStatement = connection.prepareStatement("SELECT MEMBER_ID, EMAIL, NAME, PASSWORD, REG_DATE, PHONE, ADDRESS, DESIGNATION, ACTIVE \n" +
// "FROM conference.member; where mealid=?"
            PreparedStatement preparedStatement = 
                    connection.prepareStatement(" SELECT  member.MEMBER_ID,  "
                            + " member.EMAIL, member.NAME, member.PASSWORD, member.REG_DATE, "
                            + "member.PHONE, member.ADDRESS, "
                            + "member.DESIGNATION, member.ACTIVE "                            
                            +"FROM  member , event_member where  "
                            + "event_member.MEMBER_ID = member.MEMBER_ID and event_member.EVENT_ID = ? " ) ;
            preparedStatement.setInt(1, eventId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Member member = new Member();
                member.setMemberId(rs.getInt("MEMBER_ID"));
                System.out.println("member vdvssdsdgsdg........"+ member.getMemberId());
                member.setEmail(rs.getString("EMAIL"));
                member.setName(rs.getString("NAME"));
                member.setPassword(rs.getString("PASSWORD"));
                member.setRegDate(rs.getDate("REG_DATE"));
                member.setPhone(rs.getInt("PHONE"));
                member.setAddress(rs.getString("ADDRESS"));
                member.setDesignation(rs.getString("DESIGNATION"));
                member.setActive(rs.getShort("ACTIVE")); 
                members.add(member);
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return members;
    }

    public List<Member> getAllMembers() {
        List<Member> members = new ArrayList<Member>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from member");
            while (rs.next()) {
                while (rs.next()) {
                Member member = new Member();
                member.setMemberId(rs.getInt("MEMBER_ID"));
                member.setEmail(rs.getString("EMAIL"));
                member.setName(rs.getString("NAME"));
                member.setPassword(rs.getString("PASSWORD"));
                member.setRegDate(rs.getDate("REG_DATE"));
                member.setPhone(rs.getInt("PHONE"));
                member.setAddress(rs.getString("ADDRESS"));
                member.setDesignation(rs.getString("DESIGNATION"));
                member.setActive(rs.getShort("ACTIVE"));           
                members.add(member);
            }
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return members;
    }
  
    
   public Member getMemberById(String memberId) {
       int id = Integer.parseInt(memberId);
        Member member = new Member();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from member where member_id=?");
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                member.setMemberId(rs.getInt("MEMBER_ID"));
                member.setEmail(rs.getString("EMAIL"));
                member.setName(rs.getString("NAME"));
                member.setPassword(rs.getString("PASSWORD"));
                member.setRegDate(rs.getDate("REG_DATE"));
                member.setPhone(rs.getInt("PHONE"));
                member.setAddress(rs.getString("ADDRESS"));
                member.setDesignation(rs.getString("DESIGNATION"));
                member.setActive(rs.getShort("ACTIVE"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return member;
    }
    public Member getMemberByEmail(String email , String password) {
        Member member = new Member();
        System.out.println("in dao vvdbdfbdfbdfbdfgfngfnfgfgfghfghfghfg");
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from member where email=? and password=? ");
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                System.out.println("fggfjgjghjjhjjjjjjjjjjjjjjjjjjj");
                member.setMemberId(rs.getInt("MEMBER_ID"));
                member.setEmail(rs.getString("EMAIL"));
                member.setName(rs.getString("NAME"));
                member.setPassword(rs.getString("PASSWORD"));
                member.setRegDate(rs.getDate("REG_DATE"));
                member.setPhone(rs.getInt("PHONE"));
                member.setAddress(rs.getString("ADDRESS"));
                member.setDesignation(rs.getString("DESIGNATION"));
                member.setActive(rs.getShort("ACTIVE"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(" memeber erere" + member.getPassword());
        return member;
    }
}

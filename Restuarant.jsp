<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<header>
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdrQ7Ly9pqZ6F06bzC5H8hu1Bl7scJF-1IGw&s" alt="food-image">
<ul>
<li><a href="home">HOME</a></li>
<li><a href="about us">ABOUT US</a></li>
<li><a href="restuarant">RESTUARANTS</a></li>
<li><a href="login">LOGIN</a></li>
</ul>
</header>
<% 
 String jdbcURL = "jdbc:mysql://localhost:3306/Restuarant";
    String jdbcUsername = "root";
    String jdbcPassword = "Root@123";

    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
    
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        statement = con.createStatement();
        String sql = "SELECT res_id,res_name,address,location,open_time,close_time,gst_number,cuisines_list,contact_num,bank_account_num,email,login_password,avg_rating,curr_order_accepting_status FROM restaurant_owner";
         resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
            String res_id = resultSet.getString("res_id");
            String res_name = resultSet.getString("res_name");
            String address = resultSet.getString("address");
            String location = resultSet.getString("location");
            String open_time = resultSet.getString("open_time");
            String close_time = resultSet.getString("close_time");
            Integer gst_number =  resultSet.getInt("gst_number");
            String cuisines_list = resultSet.getString("cuisines_list");
            Double contact_num = resultSet.getDouble("contact_num");
            Double bank_account_num = resultSet.getDouble("bank_account_num");
            String email = resultSet.getString("email");
            String login_password = resultSet.getString("login_password");
            Integer avg_rating = resultSet.getInt("avg_rating");
            String curr_order_accepting_status = resultSet.getString("curr_order_accepting_status");
            %>
            <h3><%= res_id %></h3>
            <h4><%= res_name %></h4>
            <h4><%= address %></h4>
            <h4><%= location %></h4>
            <h4><%= open_time %></h4>
            <h4><%= close_time %></h4>
            <h4><%= gst_number %></h4>
            <h4><%= cuisines_list %></h4>
            <h4><%= contact_num %></h4>
            <h4><%= bank_account_num %></h4>
            <h4><%= email %></h4>
            <h4><%= login_password %></h4>
            <h4><%= avg_rating %></h4>
            <h4><%= curr_order_accepting_status%></h4>
    <%
            } 
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            
           
            if (con != null) try { con.close(); } catch (SQLException ignore) {}
        }
    %>
</body>
</html>

<%@include file="../basedados/basedados.h"%>
<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
	
    String user = request.getParameter("nomeUtilizador");
    String mail = request.getParameter("email");
    String passwd = request.getParameter("password_2");
	
    try {
   	    sql_cmd="INSERT INTO rest_user(nome,email,user_type,password,validado) VALUES(?,?,?,?,0)";
		
		psInsertRecord=con.prepareStatement(sql_cmd);
		psInsertRecord.setString(1, user);
		psInsertRecord.setString(2, mail);
        psInsertRecord.setString(3,"cliente");
		psInsertRecord.setString(4, passwd);
		psInsertRecord.executeUpdate();
		
		response.sendRedirect("menu.jsp");
	
    } catch (Exception e) {
		out.println(e);
    } 
	
%>

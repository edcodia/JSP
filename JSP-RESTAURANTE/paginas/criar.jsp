<%@include file="../basedados/basedados.h"%>
<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>

 <!-- Controle de sessão, só utilizadores autorizados têm acesso à página tem acesso a página -->

 <% 
 if ((session.getAttribute("nome") == null) && (session.getAttribute("user_type")!="administrador")) 
    {
    response.sendRedirect("pagina_inicial.jsp");
    }    
%>


<%
	
    String cr_nomeUtilizador = request.getParameter("cr_nomeUtilizador");
    String cr_email = request.getParameter("cr_email");
    String cr_password_1 = request.getParameter("cr_password_1");
    String cr_perfil = request.getParameter("cr_perfil");
	
    try {
   	    sql_cmd="INSERT INTO rest_user(nome,email,user_type,password,validado) VALUES(?,?,?,?,0)";
		
		psInsertRecord=con.prepareStatement(sql_cmd);
		psInsertRecord.setString(1, cr_nomeUtilizador);
		psInsertRecord.setString(2, cr_email);
        psInsertRecord.setString(3,cr_perfil);
		psInsertRecord.setString(4, cr_password_1);
		psInsertRecord.executeUpdate();
		
		response.sendRedirect("registos_pendentes.jsp");
	
    } catch (Exception e) {
		out.println(e);
    } 
	
%>

<%@include file="../basedados/basedados.h"%>
<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
    
<%
if ((session.getAttribute("nome") == null) && (session.getAttribute("user_type")!="cliente")) 
{
   response.sendRedirect("pagina_inicial.html");
}    
%>

<%
	
	try{
	
        int id = Integer.parseInt(request.getParameter("id"));
   
		sql_cmd = "DELETE FROM reserva WHERE id=?";
        psInsertRecord=con.prepareStatement(sql_cmd);
        psInsertRecord.setInt(1,id);
        psInsertRecord.executeUpdate();
   
        if(session.getAttribute("user_type").equals("administrador"))
        response.sendRedirect("adm_res.jsp");
      else if(session.getAttribute("user_type").equals("cliente"))
        response.sendRedirect("minhas_res.jsp");
    
	
    }catch(Exception e) {
		out.println(e);
    } 
	
%>
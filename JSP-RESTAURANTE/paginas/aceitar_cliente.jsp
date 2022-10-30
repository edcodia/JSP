<%@ page contentType="text/html; charset=UTF-8" %>	
<%@ page import ="java.sql.Statement"%>
<%@ include file ="../basedados/basedados.h" %>
    
<%
if((session==null) && (session.getAttribute("user_type")!="administrador")) 
{
   response.sendRedirect("pagina_inicial.jsp");
}    
%>

<%   
	try {

        int id = Integer.parseInt(request.getParameter("id"));

        sql_cmd = "UPDATE rest_user SET validado=1 where id=?";
        psInsertRecord=con.prepareStatement(sql_cmd);
        psInsertRecord.setInt(1,id);
        psInsertRecord.executeUpdate();
		
		response.sendRedirect("registos_pendentes.jsp");
	
    } catch (Exception e) {
		out.println(e);
	
    } 
	
%>
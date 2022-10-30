<%@ page contentType="text/html; charset=UTF-8" %>	
<%@ page import ="java.sql.Statement"%>
<%@ include file ="../basedados/basedados.h" %>

<%
if((session==null) && (session.getAttribute("user_type")!="administrador")) 
{
   response.sendRedirect("pagina_inicial.html");
}    
%>

<%   
	try {
   
        int id = Integer.parseInt(request.getParameter("id"));

        sql_cmd = " UPDATE reserva SET estado = 'Aceite' WHERE id = ? "; 
        psInsertRecord=con.prepareStatement(sql_cmd);
        psInsertRecord.setInt(1,id);
        psInsertRecord.executeUpdate();
		
		response.sendRedirect("adm_res.jsp");
	
    } catch (Exception e) {
		out.println(e);
	
    } 
	
%>
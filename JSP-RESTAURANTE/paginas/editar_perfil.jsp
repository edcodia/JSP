<%@ page contentType="text/html; charset=UTF-8" %>	
<%@ page import ="java.sql.Statement"%>
<%@ include file ="../basedados/basedados.h" %>
    
<%
if((session==null) && (session.getAttribute("user_type")=="chefe_mesa")) 
{
   response.sendRedirect("index.html");
}    
%>

<%   
   
	try {
   
        int prf_id = Integer.parseInt(request.getParameter("prf_id"));
        String prf_nome = request.getParameter("prf_nome");
        String prf_email = request.getParameter("prf_email");
        String prf_password1 = request.getParameter("prf_password1");
        String prf_user = request.getParameter("prf_user");

        sql_cmd = "UPDATE rest_user SET nome=?, email=?, password=?, user_type=? where id=?";
        psInsertRecord=con.prepareStatement(sql_cmd);
        psInsertRecord.setString(1,prf_nome);
        psInsertRecord.setString(2,prf_email);
        psInsertRecord.setString(3,prf_password1);
        psInsertRecord.setString(4,prf_user);
        psInsertRecord.setInt(5,prf_id);
        psInsertRecord.executeUpdate();
   
   
        if(session.getAttribute("user_type").equals("administrador"))
		    	response.sendRedirect("adm_index.jsp");
	      else if(session.getAttribute("user_type").equals("cliente"))
		    	response.sendRedirect("cliente_index.jsp");
      
	
    } catch (Exception e) {
		out.println(e);
	
    } 
	
%>
<%@ page contentType="text/html; charset=UTF-8" %>	
<%@ page import ="java.sql.Statement"%>
<%@ include file ="../basedados/basedados.h" %>
    
<%
if((session==null) && (session.getAttribute("user_type")!="cliente")) 
{
   response.sendRedirect("pagina_inicial.jsp");
}    
%>

<%   
  
        String ed_user = request.getParameter("ed_user_id");
        String id = request.getParameter("ed_id");
        String data = request.getParameter("edit_data_res");
        String hora = request.getParameter("edit_hora_res");
        int lugares = Integer.parseInt(request.getParameter("edit_lugar_res")); 
        String pedido = request.getParameter("edit_pedido_res");
    try { 
          
   
        sql_cmd = "UPDATE reserva SET user_id=?, lugares=?, data=?, hora=?, pedido=? where id=?";
        psInsertRecord=con.prepareStatement(sql_cmd);
        psInsertRecord.setString(1,ed_user);
        psInsertRecord.setInt(2,lugares);
        psInsertRecord.setString(3,data);
        psInsertRecord.setString(4,hora);
        psInsertRecord.setString(5,pedido);
        psInsertRecord.setString(6,id);
        psInsertRecord.executeUpdate();

        
        response.sendRedirect("minhas_res.jsp");
       
	
    } catch (Exception e) {
		out.println(e);
       
	
    } 
	
%>
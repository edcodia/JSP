
<%@ page contentType="text/html; charset=UTF-8" %>			
<%@ include file ="../basedados/basedados.h" %>
<%@ page import ="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
<% 
	if ((session.getAttribute("nome") == null)  && (session.getAttribute("user_type")!="administrador")) 
	{
			out.println("Acesso proibido");
			response.sendRedirect("pagina_inicial.jsp");
	}
	
        int id_utilizador = Integer.parseInt(request.getParameter("id_utilizador"));
        int res_lugar = Integer.parseInt(request.getParameter("res_lugar")); 
        String date = request.getParameter("res_data");
        String time = request.getParameter("res_hora");
        String pedido = request.getParameter("res_pedido");
   
     try
	
	{
		sql_cmd="INSERT  INTO reserva  (user_id, estado, lugares, data,hora,pedido)VALUES(?,?,?,?,?,?)";
        psInsertRecord=con.prepareStatement(sql_cmd);
        
        psInsertRecord.setString(5,time);
        psInsertRecord.setString(4,date);
        psInsertRecord.setString(2,"Pendente");
        psInsertRecord.setInt(3,res_lugar);
        psInsertRecord.setInt(1,id_utilizador);
        psInsertRecord.setString(6,pedido);

        psInsertRecord.executeUpdate();
             
        response.sendRedirect("reservar.jsp");
	}
	catch(SQLException e)
	{
		out.println(e);
	    e.printStackTrace();
    }
%>		
			
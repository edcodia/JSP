
<%@ include file ="../basedados/basedados.h" %>
       
<%

String user = request.getParameter("nomeUtilizador"); 
String passwd = request.getParameter("password");
%>	
<%

	try{
	
        sqlSelectRecord ="SELECT * FROM rest_user WHERE nome='"+user+"'and password='"+passwd+"'and validado=1";
		psSelectRecord=con.prepareStatement(sqlSelectRecord);
		rsSelectRecord=psSelectRecord.executeQuery();
	
	

			if(rsSelectRecord.next()){
			
				session.setAttribute("id",rsSelectRecord.getString("id"));
				session.setAttribute("user_type",rsSelectRecord.getString("user_type"));
				
				if(rsSelectRecord.getString("user_type").equals("administrador")){
					session.setAttribute("nome",rsSelectRecord.getString("nome"));
					response.sendRedirect("adm_index.jsp");
	   
				}else  if(rsSelectRecord.getString("user_type").equals("cliente")) {
					session.setAttribute("nome",rsSelectRecord.getString("nome"));
					response.sendRedirect("cliente_index.jsp");
				}else{
					session.setAttribute("nome",rsSelectRecord.getString("nome"));
					response.sendRedirect("pagina_inicial.jsp"); 
				}
				
			}else
				response.sendRedirect("pagina_inicial.jsp");
	
	}catch(Exception e){
		out.println(e);
	}
	finally{
		try{
			rsSelectRecord.close();
		}catch(Exception e ){}
	}
	       
%>

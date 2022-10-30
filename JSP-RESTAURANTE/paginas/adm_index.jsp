<%@ include file ="../basedados/basedados.h" %>
<%@ page contentType="text/html; charset=UTF-8" %>	
<%@ page import ="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<script  type="text/javascript" src="style.js"> </script>
</head>
<body>
	
	<div class="conteudo">
		<!-- Controle de sessão, só utilizadores autorizados têm acesso à página tem acesso a página -->
        <% 
          if ((session.getAttribute("nome") == null)  && (session.getAttribute("user_type")!="administrador")) 
             {
             response.sendRedirect("pagina_inicial.jsp");
             }    
        %>
		<div class="header u_logado">
            <ul>
            <li><a href='adm_index.jsp'>Inicio</a></li>
            <li><a href='adm_res.jsp'>Reservas Pendentes</a></li>
            <li><a href='res_geral.jsp'>Todas Reservas </a></li>
            <li><a href='registos_pendentes.jsp'>Registos Pendentes</a></li>
            <li><a href='perfilAdm.jsp'>Perfil</a></li>
            <li><a href='logout.jsp' style='float:right' class='active'>Logout</a></li>
            </ul>
			
		</div>

			<div class="roww">
						<!-- Informações sobre o utilizador logado -->
				<div class="perfil_info">
                    <strong><% out.println(session.getAttribute("nome")); %></strong>

						<small>
							<i  style="color: #fff;"><% out.println(session.getAttribute("user_type")); %></i> 
							<br>
						</small>

				</div>
				<h2>Utilizadores registados</h2>
				<table border=1>
					<tr>
				   <th>Nome</th>
				   <th>Email</th>
				   <th>Perfil</th>
					<th olspan='2' align='center'>Operacao</th>
				  </tr>
				  <%
	  
					  sqlSelectRecord ="SELECT * FROM rest_user WHERE validado = 1 ";
					   psSelectRecord=con.prepareStatement(sqlSelectRecord);
					  rsSelectRecord=psSelectRecord.executeQuery();
				  %>
				   <%
						while(rsSelectRecord.next()) {
				   %>                   
				 
					<tr>
					  <td><%out.println (rsSelectRecord.getString("nome"));%> </td>
					  <td><%out.println (rsSelectRecord.getString("email"));%></td>
					  <td><%out.println (rsSelectRecord.getString("user_type"));%></td>
					  <td>  <a href='apagar_utilizador.jsp?id=<%=rsSelectRecord.getString("id")%>' class="btn btn-outline-info">Apagar</a></td>
					 </tr>
					  <%
				  } /// End of while loop %>
                <br>
				<ul>
					<li><a href="criar_user.jsp"> +add Utilizador </a></li>
				</ul>
			</div>	
		</div>

		<div class="roww adm_bt">

		
		</div>

		<div class="footer">
         
        </div>
	</div>
	
</body>
</html>
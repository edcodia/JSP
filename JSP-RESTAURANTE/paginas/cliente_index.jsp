<%@ include file ="../basedados/basedados.h" %>
<%@ page contentType="text/html; charset=UTF-8" %>	
<%@ page import ="java.sql.Statement"%>

<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	
	<div class="conteudo">
	<!-- Controle de sessão, só utilizadores autorizados têm acesso à página tem acesso a página -->
    <% 
       if ((session.getAttribute("nome") == null) && (session.getAttribute("user_type")!="cliente")) 
        {
         response.sendRedirect("pagina_inicial.jsp");
         }    
    %>
		<div class="header u_logado">
             <ul>
                 <li><a href='cliente_index.jsp'>Inicio</a></li>
                <li><a href='reservar.jsp'>Reservar</a></li>
                <li><a href='minhas_res.jsp'>Minhas Reservas</a></li>
                <li><a href='perfil_utilizador.jsp'>Perfil</a></li>
                <li><a href='logout.jsp' style='float:right' class='active'>Logout</a></li>
                </ul>
		</div>

		<!-- Informações do utilizador logado -->
		<div class="roww">
			<div class="perfil_info">
				<div>
						<strong><% out.println(session.getAttribute("nome")); %></strong>
						<small>
							<i  style="color: #fff;"><% out.println(session.getAttribute("user_type")); %></i> 
							<br>
						</small>
				</div>
			</div>
		</div>
		


		<div class="footer">
			
		</div>
	
	</div>
</body>
</html>
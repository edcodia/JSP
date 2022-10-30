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
    if ((session.getAttribute("nome") == null)  && (session.getAttribute("user_type")!="cliente")) 
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
			<!-- Mensagem de notificação -->

		</div>

		<div class="roww">
				<h2>Faça a sua reserva</h2>
                <%
                Statement st=null;
                ResultSet rs=null;

                st=con.createStatement();

                String sql="SELECT * FROM rest_user WHERE nome='"+session.getAttribute("nome")+"'";
                rs=st.executeQuery(sql);
                rs.next();
             %>
				<form action="reserv.jsp" method="post">
                    <input type="hidden" name="id_utilizador" value="<%=rs.getString("id")%>" readonly/>
					<div class="input-group">

						<input type="date" name="res_data"> 
					</div>

					<div class="input-group">
						<input type="time" name="res_hora"> <br>
					</div>

					<div class="input-group">
						<input type="text" name="res_lugar" placeholder="lugar"> <br>
					</div>

					<div class="input-group">
						<input type="text" name="res_pedido" placeholder="pedido"> <br>
					</div>

					<div class="int-group">
						<input type="submit" class="botao" value="Reservar" name="res_bt">
					</div>	

				</form>	
		</div>
		
		<div class="footer">
			
		</div>
		
	</div>
</body>
</html>
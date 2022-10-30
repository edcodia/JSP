<%@ include file ="../basedados/basedados.h" %>
<%@ page contentType="text/html; charset=UTF-8" %>	
<%@ page import ="java.sql.Statement"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
    
    <title>Document</title>
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

    <!-- Informação -->
    <div class="roww">
            <h2>Minhas Reservas</h2>
        
		<table border=1>
              <tr>
             <th>Nome</th>
             <th>Email</th>
             <th>Estado</th>
              <th olspan='2' align='center'>Operação</th>
            </tr>
            <%

                sqlSelectRecord ="SELECT * FROM rest_user WHERE validado = 0 ";
                 psSelectRecord=con.prepareStatement(sqlSelectRecord);
                rsSelectRecord=psSelectRecord.executeQuery();
            %>
             <%
                  while(rsSelectRecord.next()) {
             %>                   
           
              <tr>
                <td><%out.println (rsSelectRecord.getString("nome"));%> </td>
                <td><%out.println (rsSelectRecord.getString("email"));%></td>
                <td><%out.println (rsSelectRecord.getString("validado"));%></td>
                <form action='aceitar_cliente.jsp' method='post'>
                
                <td>  <a href='aceitar_cliente.jsp?id=<%=rsSelectRecord.getString("id")%>' class="btn btn-outline-info" >Aceitar</a></td>
                </form>
                </tr>
                <%
            } /// End of while loop %>
  
    </div>

    <div class="footer">
       
    </div>
    
</body>
</html>
<%@ include file ="../basedados/basedados.h" %>
<%@ page contentType="text/html; charset=UTF-8" %>	
<%@ page import ="java.sql.Statement"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css"/>

    <title>Document</title>
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


        <!-- Informação -->
    <div class="roww">
        <%
        int id = Integer.parseInt(request.getParameter("id"));
       
        sqlSelectRecord ="SELECT * FROM reserva WHERE id ='"+id+"'";
        psSelectRecord=con.prepareStatement(sqlSelectRecord);
        rsSelectRecord=psSelectRecord.executeQuery();
        rsSelectRecord.next();
    %>
            <form  method="post" action="atualizar_res.jsp">
            

                <div class="input-group">
                    <label>Data : <% out.println(rsSelectRecord.getString("data"));%> </label>
                    <input type="date" name="edit_data_res" placeholder=" <% out.println(rsSelectRecord.getString("data"));%>"><br>
                    <input type='hidden' name='ed_id' value="<%=rsSelectRecord.getString("id")%>">
                    <input type='hidden' name='ed_user_id' value="<%=rsSelectRecord.getString("user_id")%>">
                    
                </div>
                <div class="input-group">
                    <label>Hora: <% out.println(rsSelectRecord.getString("hora"));%></label>
                    <input type="time" name="edit_hora_res" placeholder=" <%out.println(rsSelectRecord.getString("hora"));%>"><br>
                </div>
                <div class="input-group">
                    <label>Lugares</label>
                    <input type="text" name="edit_lugar_res" placeholder=" <% out.println(rsSelectRecord.getString("lugares"));%>"><br>
                </div>

                <div class="input-group">
                    <label>Pedido</label>
                    <input type="text" name="edit_pedido_res" placeholder=" <% out.println(rsSelectRecord.getString("pedido"));%>"><br>
                </div>

                <input type="submit" class="botao" value="Reservar" name="edit_res_bt">

            </form>
    </div>
       
    <div class="footer">
    
    </div>
  

 </div>



</body>
</html>
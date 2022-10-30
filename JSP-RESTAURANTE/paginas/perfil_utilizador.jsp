<%@include file="../basedados/basedados.h"%>
<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
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
        <div class="header u_logado">
            <ul>
                <li><a href='cliente_index.jsp'>Inicio</a></li>
               <li><a href='reservar.jsp'>Reservar</a></li>
               <li><a href='minhas_res.jsp'>Minhas Reservas</a></li>
               <li><a href='perfil_utilizador.jsp'>Perfil</a></li>
               <li><a href='logout.jsp' style='float:right' class='active'>Logout</a></li>
               </ul>
              
        </div>
        <%     
        sqlSelectRecord ="SELECT * FROM rest_user WHERE id ='"+session.getAttribute("id")+"'";
        psSelectRecord=con.prepareStatement(sqlSelectRecord);
        rsSelectRecord=psSelectRecord.executeQuery();
        rsSelectRecord.next();
    %>

        <div class="roww">
            <form action="editar_perfil.jsp" method="post">
              

                <div class="input-group">
                    <label>Nome</label>
                    <input type='hidden' name='prf_id' value="<%=rsSelectRecord.getString("id")%>"> 
                    <input type='hidden' name='prf_user' value="<%=rsSelectRecord.getString("user_type")%>"> 
                    <input type="text" name="prf_nome" value="<%=rsSelectRecord.getString("nome")%> ">
                </div>

                <div class="input-group">
                    <label>Email</label>
                    <input type="email" name="prf_email" value="<%=rsSelectRecord.getString("email")%>" >
                </div>

                <div class="input-group">
                    <label>Password</label>
                    <input type="password" name="prf_password1" value="<%=rsSelectRecord.getString("password")%> ">
                </div>

                <div class="input-group">
                    <label>Confirmar Password</label>
                    <input type="password" name="prf_password2" value="<%=rsSelectRecord.getString("password")%> "> 
                </div>

                <div class="int-group">
                    <input type="submit" class="botao" value="Submit" name="prf_bt">
                </div>

            </form>
        </div>
        

        <div class="footer">
         
        </div>

    </div>
    
</body>
</html>
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


                <form method="post" action="criar.jsp">
                  
                    <div class="input-group">
                        <label>Nome do Utilizador</label>
                        <input type="text" name="cr_nomeUtilizador" >
                    </div>
                    <div class="input-group">
                        <label>Email</label>
                        <input type="email" name="cr_email" >
                    </div>
                    <div class="input-group">
                        <label>Perfil</label>
                        <input type="text" name="cr_perfil" >
                    </div>
                  
                    <div class="input-group">
                        <label>Password</label>
                        <input type="password" name="cr_password_1">
                    </div>
                    <div class="input-group">
                        <label>Confirmar a password</label>
                        <input type="password" name="cr_password_2">
                    </div>

                    <div class="input-group">
                        <button type="submit" class="botao" name="cr_utlzr_bt">+Criar</button>
                    </div>
                </form>

        </div>
      

        <div class="footer">
          
        </div>

       


    </div>
    
</body>
</html>
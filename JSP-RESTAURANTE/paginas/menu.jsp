<%@ include file ="../basedados/basedados.h"%>
<%@ page contentType="text/html; charset=UTF-8" %>	
<%@ page import ="java.sql.Statement"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login de utilizadores</title>
    <link rel="stylesheet" href="style.css"/>
</head>
<body>
	<div class="conteudo">
		<div class="header">
			<ul>
                <li><a href="pagina_inicial.jsp">Home</a></li>
				<li><a href="menu.jsp">Menu</a></li>
				<li><a href="pagina_inicial.jsp?id=contactos">Contatos</a></li>
				<li><a href="pagina_inicial.jsp?id=horario">Horarios</a></li>
				<li><a href="login.jsp" class="botao">Login</a></li>

			</ul>
		</div>
		<div class="row_menu">
			<ul class='cartaos'>
	<% 
				sqlSelectRecord="SELECT * FROM menu "; 
				psSelectRecord=con.prepareStatement(sqlSelectRecord);
				rsSelectRecord=psSelectRecord.executeQuery();
			   
				while(rsSelectRecord.next()){
	%>  	
					<li>
					<div class='cartao_spc'>
					<a href='' class='cartao'>
					<img src="<%=rsSelectRecord.getString("imagem")%>" class='cartao__image' alt='' />		
					<div class='cartao__header'>		
					<div class='cartao__header-text'>
					<h3 class='cartao__title'>Nome:"<%=rsSelectRecord.getString("nome")%>"</h3> 			           
					<span class='cartao__status'>Preco:"<%=rsSelectRecord.getString("preco")%>"</span>
					</div>
					</div>
					<p class='cartao__description'> Descricao:"<%=rsSelectRecord.getString("descricao")%>"</p>		
					</a>  
					</div>
					</li>
					
					<% 
  
				}

				%> 
			</ul>
			
		</div>

	<div class="footer">

</div>
	</div>

</body>
</html>
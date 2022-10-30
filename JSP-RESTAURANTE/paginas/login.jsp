
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
		<div class="roww">
			<form method="post" action="Validacao.jsp">
				
				<div class="input-group">
					<label>Nome do Utilizador</label>
					<input type="text" name="nomeUtilizador" >
				</div>
				<div class="input-group">
					<label>Password</label>
					<input type="password" name="password">
				</div>
				<div class="input-group">
					<button type="submit" class="botao" name="login_btn">Login</button>
				</div>
				<p class="in-lnk">
					Ainda nao e' membro? <a href="registo.jsp">Registar</a>
				</p>
			</form>
		</div>


	<div class="footer">

</div>
	</div>

</body>
<footer class="footer">
    <div class=" container-fluid ">
        <p>Copyright &copy; 2022 - All Rights Reserved - Eduardo-Codia</p>;
    </div>
</footer>

</html>
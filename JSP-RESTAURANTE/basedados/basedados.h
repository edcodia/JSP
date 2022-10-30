<%@ page language="java" import="java.sql.*" %>
<%!
	final String USER_BD="root";
	final String PASS_BD="";
	final String NOME_BD="criar_bd";
	Connection con;
	PreparedStatement psSelectRecord=null,psInsertRecord=null;
	ResultSet rsSelectRecord=null;
	String sqlSelectRecord=null,sql_cmd=null;
%>
<%
	// Conectamos ao nosso servidor MySQL
	try  
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+NOME_BD,USER_BD,PASS_BD);
	}
	// Selecionamos nossa base de dados MySQL
	catch(Exception e) 
	{
	//   out.println(ligacao falhou);
	}

%>
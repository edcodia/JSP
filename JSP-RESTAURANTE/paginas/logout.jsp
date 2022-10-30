<%
	session.setAttribute("nome", null);
	session.invalidate();
	response.sendRedirect("pagina_inicial.jsp");
%>
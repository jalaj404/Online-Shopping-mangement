<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h1>this is our first jsp page</h1>
<%!String a="global variable"; %>
<%
String s="hello";
out.println(s);
%>
<h1><%=a %></h1>
</body>
</html>
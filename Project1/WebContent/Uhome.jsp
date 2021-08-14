<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page errorPage="error.jsp" %>
<%@include file="db.jsp" %>
<%
String email=(String) session.getAttribute("id");
%>
WELCOME : <%=email%>
<a href="viewcart.jsp">VIEW CART</a>
<a href="Logout">Logout</a>
<br><br>
<%
String qr="select * from product";
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(qr);
if(rs.next())
{
	do
	{
		String name=rs.getString("name");
		String price=rs.getString("price");
		String cat=rs.getString("cat");
		String cmp=rs.getString("cmp");
		%>
		<div style="height: 120px;width: 100%;background-color: pink;text-align: center;">
		NAME : <%=name %><br>
		PRICE : <%=price %><br>
		CATEGORY : <%=cat %><br>
		COMPANY : <%=cmp %><br>
		<a href="https://www.paypal.com/in/signin">BUY NOW</a>
		<a href="AddCart?name=<%=name %>&price=<%=price %>&cat=<%=cat %>&cmp=<%=cmp %>&email=<%=email %>">ADD TO CART</a>
		</div>
		<hr>
		<%
	}while(rs.next());
}
else
{
	out.println("no records found");
}
con.close();
%>

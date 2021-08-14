<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page errorPage="error.jsp" %>
<%@include file="db.jsp" %>
<%
String email=(String) session.getAttribute("id");
%>
WELCOME : <%=email%>
<a href="Logout">Logout</a>
<br><br>
<%
String qr="select distinct name,price,cat,cmp from cart where email=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, email);
ResultSet rs=ps.executeQuery();
int q=0;
if(rs.next())
{
	do
	{
		String name=rs.getString("name");
		String price=rs.getString("price");
		String cat=rs.getString("cat");
		String cmp=rs.getString("cmp");
		q=0;
		String qr1="select * from cart where name=? and email=?";
		PreparedStatement ps1=con.prepareStatement(qr1);
		ps1.setString(1, name);
		ps1.setString(2, email);
		ResultSet rs1=ps1.executeQuery();
		while(rs1.next())
		{
			q++;
		}
		%>
		<div style="height: 120px;width: 100%;background-color: pink;text-align: center;">
		NAME : <%=name %><br>
		PRICE : <%=price %><br>
		CATEGORY : <%=cat %><br>
		COMPANY : <%=cmp %><br>
		QTY : <%=q %>
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
<a href="https://www.paypal.com/in/signin">CHECKOUT</a>
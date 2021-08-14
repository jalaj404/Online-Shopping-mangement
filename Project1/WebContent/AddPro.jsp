<%@include file="db.jsp" %>
<%@page errorPage="error.jsp" %>
<%
String iname=request.getParameter("iname");
String name=(String)session.getAttribute("name");
String price=(String)session.getAttribute("price");
String cat=(String)session.getAttribute("cat");
String cmp=(String)session.getAttribute("cmp");
String qr="insert into product values(?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, name);
ps.setString(2, price);
ps.setString(3, cat);
ps.setString(4, cmp);
ps.setString(5, iname);
int i=ps.executeUpdate();
if(i>0)
{
	out.println(i+" adde");
}
else
{
	out.println("not added");
}
con.close();
%>
<%
String name=request.getParameter("name");
String price=request.getParameter("price");
String cat=request.getParameter("cat");
String cmp=request.getParameter("cmp");
%>
<form action="Update" method="post">
<%=name %>
<input type="hidden" name="name" value="<%=name %>" />
<pre>
PRICE<input type="number" name="price" value="<%=price %>" />
CATEGORY<select name="cat">
<option><%=cat %></option>
<option>LAPTOP</option>
</select>
COMAPNY<input type="text" name="cmp" value="<%=cmp %>" />
<input type="submit" value="Update" />
</pre>
</form>
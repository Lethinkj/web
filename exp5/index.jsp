<%@ page import="java.sql.*"%>

<html>
<body>

<%

Class.forName("com.mysql.jdbc.Driver");

Connection con=
DriverManager.getConnection(
"jdbc:mysql://localhost:3306/student",
"root",
"password");

Statement st=con.createStatement();

ResultSet rs=
st.executeQuery("select * from student");

while(rs.next())
{
out.println(rs.getInt(1)+" ");
out.println(rs.getString(2));
out.println("<br>");
}

con.close();

%>

</body>
</html>

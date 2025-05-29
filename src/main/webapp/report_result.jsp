<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Report Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 40px;
            background-color: #f9f5f0; /* light background */
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin: auto;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(120, 72, 0, 0.1);
        }

        th, td {
            border: 1px solid #a1887f; /* soft brown border */
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #8B4513; /* saddle brown */
            color: white;
        }

        h2 {
            text-align: center;
            color: #5d4037; /* dark brown */
        }

        tr:nth-child(even) {
            background-color: #f1ebe6; /* light brownish */
        }

        tr:hover {
            background-color: #e0d3c2; /* hover effect */
        }
    </style>
</head>
<body>

<%
String reportType = request.getParameter("reportType");
String value = request.getParameter("value");

String url = "jdbc:mysql://localhost:3306/Employee";
String user = "root";
String pass = "";

String sql = "";

if ("namePrefix".equals(reportType)) {
    sql = "SELECT * FROM Employee WHERE EmpName LIKE '" + value + "%'";
} else if ("years".equals(reportType)) {
    sql = "SELECT * FROM Employee WHERE YEAR(CURDATE()) - YEAR(DoJ) >= " + value;
} else if ("salary".equals(reportType)) {
    sql = "SELECT * FROM Employee WHERE Bsalary > " + value;
}

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(url, user, pass);
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);

    boolean hasData = false;
%>
    <h2>Report Results</h2>
    <table>
        <tr>
            <th>Emp No</th>
            <th>Name</th>
            <th>DoJ</th>
            <th>Gender</th>
            <th>Salary</th>
        </tr>
<%
    while (rs.next()) {
        hasData = true;
%>
        <tr>
            <td><%= rs.getInt("Empno") %></td>
            <td><%= rs.getString("EmpName") %></td>
            <td><%= rs.getDate("DoJ") %></td>
            <td><%= rs.getString("Gender") %></td>
            <td><%= rs.getDouble("Bsalary") %></td>
        </tr>
<%
    }

    if (!hasData) {
        out.println("<p style='text-align:center;color:#8B0000;'>No matching records found.</p>");
    }

    con.close();
} catch (Exception e) {
    out.println("<p style='color:#8B0000;text-align:center;'>Error: " + e.getMessage() + "</p>");
}
%>

</table>
</body>
</html>

<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Display Employee</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 50px;
            text-align: center;
        }

        h2 {
            font-size: 36px;
            margin-bottom: 30px;
        }

        form {
            display: inline-block;
            background-color: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 0px 15px #ccc;
            font-size: 20px;
        }

        input[type="number"] {
            width: 320px;
            padding: 15px;
            font-size: 20px;
            margin: 20px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        input[type="submit"] {
            font-size: 22px;
            padding: 15px 30px;
            background-color: #5cb85c;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #4cae4c;
        }

        h3 {
            font-size: 30px;
            margin-top: 40px;
        }

        p {
            font-size: 22px;
            margin: 10px 0;
        }
    </style>
</head>
<body>

<h2>Display Employee</h2>
<form method="post">
    Enter Employee No:<br>
    <input type="number" name="empno" required><br><br>
    <input type="submit" value="Display">
</form>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String url = "jdbc:mysql://localhost:3306/Employee";
    String user = "root";
    String pass = "";

    int empno = Integer.parseInt(request.getParameter("empno"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, pass);
        String sql = "SELECT * FROM Employee WHERE Empno=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, empno);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
%>
        <h3>Employee Details:</h3>
        <p>Emp No: <%= rs.getInt("Empno") %></p>
        <p>Name: <%= rs.getString("EmpName") %></p>
        <p>DoJ: <%= rs.getDate("DoJ") %></p>
        <p>Gender: <%= rs.getString("Gender") %></p>
        <p>Salary: <%= rs.getDouble("Bsalary") %></p>
<%
        } else {
            out.println("<p style='color:red; font-size:20px;'>Employee not found.</p>");
        }
        con.close();
    } catch (Exception e) {
        out.println("<p style='color:red; font-size:20px;'>Error: " + e.getMessage() + "</p>");
    }
}
%>

</body>
</html>

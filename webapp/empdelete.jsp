<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Delete Employee</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            padding: 50px;
            text-align: center;
        }

        h2 {
            font-size: 32px;
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
            width: 300px;
            padding: 15px;
            font-size: 18px;
            margin: 15px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        input[type="submit"] {
            font-size: 20px;
            padding: 15px 30px;
            background-color: #d9534f;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #c9302c;
        }

        p {
            font-size: 20px;
        }
    </style>
</head>
<body>

<h2>Delete Employee</h2>
<form method="post">
    Enter Employee No:<br>
    <input type="number" name="empno" required><br><br>
    <input type="submit" value="Delete">
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
        String sql = "DELETE FROM Employee WHERE Empno=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, empno);
        int result = ps.executeUpdate();
        if (result > 0) {
            out.println("<p style='color:green;'>Employee Deleted</p>");
        } else {
            out.println("<p style='color:red;'>Employee Not Found</p>");
        }
        con.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
}
%>

</body>
</html>

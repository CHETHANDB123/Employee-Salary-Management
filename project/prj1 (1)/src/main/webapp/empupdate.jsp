<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Update Employee</title>
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
            font-size: 22px;
        }

        input[type="number"],
        input[type="text"],
        input[type="date"],
        select {
            width: 320px;
            padding: 15px;
            font-size: 20px;
            margin: 15px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        input[type="submit"] {
            font-size: 22px;
            padding: 15px 30px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        p {
            font-size: 20px;
        }
    </style>
</head>
<body>

<h2>Update Employee</h2>
<form method="post">
    Emp No: <br><input type="number" name="empno" required><br>
    New Name: <br><input type="text" name="empName"><br>
    New DoJ: <br><input type="date" name="doj"><br>
    New Gender: <br>
    <select name="gender">
        <option>Male</option>
        <option>Female</option>
    </select><br>
    New Salary: <br><input type="number" name="bsalary" step="0.01"><br>
    <input type="submit" value="Update">
</form>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String url = "jdbc:mysql://localhost:3306/Employee";
    String user = "root";
    String pass = "";

    int empno = Integer.parseInt(request.getParameter("empno"));
    String empName = request.getParameter("empName");
    String doj = request.getParameter("doj");
    String gender = request.getParameter("gender");
    double bsalary = Double.parseDouble(request.getParameter("bsalary"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, pass);
        String sql = "UPDATE Employee SET EmpName=?, DoJ=?, Gender=?, Bsalary=? WHERE Empno=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, empName);
        ps.setDate(2, Date.valueOf(doj));
        ps.setString(3, gender);
        ps.setDouble(4, bsalary);
        ps.setInt(5, empno);

        int result = ps.executeUpdate();
        if (result > 0) {
            out.println("<p style='color:green;'>Employee Updated</p>");
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

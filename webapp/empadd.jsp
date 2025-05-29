<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Add Employee</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
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

        input[type="text"],
        input[type="number"],
        input[type="date"],
        select {
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
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #388E3C;
        }

        p {
            font-size: 20px;
        }
    </style>
</head>
<body>
<h2>Add Employee</h2>
<form method="post">
    Emp No:<br>
    <input type="number" name="empno" required><br>
    
    Name:<br>
    <input type="text" name="empName" required><br>
    
    Date of Joining:<br>
    <input type="date" name="doj" required><br>
    
    Gender:<br>
    <select name="gender">
        <option>Male</option>
        <option>Female</option>
    </select><br>
    
    Basic Salary:<br>
    <input type="number" name="bsalary" step="0.01" min="0.01" required><br><br>
    
    <input type="submit" value="Add Employee">
</form>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String url = "jdbc:mysql://localhost:3306/employee";
    String user = "root";
    String pass = "";

    int empno = Integer.parseInt(request.getParameter("empno"));
    String empName = request.getParameter("empName");
    String doj = request.getParameter("doj");
    String gender = request.getParameter("gender");
    double bsalary = Double.parseDouble(request.getParameter("bsalary"));

    if (bsalary <= 0) {
        out.println("<p style='color:red;'>Basic salary must be greater than 0</p>");
    } else {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement ps = con.prepareStatement("INSERT INTO Employee VALUES (?, ?, ?, ?, ?)");
            ps.setInt(1, empno);
            ps.setString(2, empName);
            ps.setDate(3, Date.valueOf(doj));
            ps.setString(4, gender);
            ps.setDouble(5, bsalary);

            int result = ps.executeUpdate();
            if (result > 0) {
                out.println("<p style='color:green;'>Employee Added Successfully</p>");
            } else {
                out.println("<p style='color:red;'>Error Adding Employee</p>");
            }
            con.close();
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    }
}
%>
</body>
</html>

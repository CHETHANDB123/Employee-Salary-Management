<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>Employee Management System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #e9f5e9;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            background: white;
            padding: 40px 50px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 128, 0, 0.2);
            text-align: center;
            width: 300px;
        }

        h1 {
            color: #006400; /* Dark Green */
            margin-bottom: 30px;
        }

        .nav a {
            display: block;
            margin: 10px 0;
            padding: 12px 0;
            background-color: #DAA520; /* GoldenRod */
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            transition: all 0.3s ease;
            border: 2px solid #006400;
        }

        .nav a:hover {
            background-color: #006400;
            color: #DAA520;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Employee Management</h1>
        <div class="nav">
            <a href="empadd.jsp">Add Employee</a>
            <a href="empupdate.jsp">Update Employee</a>
            <a href="empdelete.jsp">Delete Employee</a>
            <a href="empdisplay.jsp">Display Employee</a>
            <a href="report_form.jsp">Reports</a>
        </div>
    </div>

</body>
</html>

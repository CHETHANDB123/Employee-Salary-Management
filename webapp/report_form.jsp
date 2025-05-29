<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Reports</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f7f7f7;
            padding: 40px;
            text-align: center;
        }

        form {
            display: inline-block;
            background-color: #c62828; /* red background */
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #aaa;
            color: white; /* text color for better contrast on red */
        }

        select, input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 12px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #6a1b9a; /* purple */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #4a148c; /* darker purple on hover */
        }

        label {
            font-weight: bold;
        }
    </style>
</head>
<body>

<h2>Generate Employee Report</h2>
<form action="report_result.jsp" method="post">
    <label>Select Report Type:</label><br>
    <select name="reportType" required>
        <option value="namePrefix">Name starts with</option>
        <option value="years">More than N years of service</option>
        <option value="salary">Salary greater than</option>
    </select><br>

    <label>Enter Value:</label><br>
    <input type="text" name="value" required /><br>

    <input type="submit" value="Generate Report" />
</form>

</body>
</html>

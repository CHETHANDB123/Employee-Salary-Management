 package prj1;


import prj1.Employee;
import prj1.DBConnection;

import java.sql.*;
import java.util.*;

public class EmployeeDAO {

    public boolean addEmployee(Employee emp) throws SQLException {
        Connection con = DBConnection.getConnection();
        String sql = "INSERT INTO Employee VALUES (?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, emp.getEmpno());
        ps.setString(2, emp.getEmpName());
        ps.setDate(3, emp.getDoj());
        ps.setString(4, emp.getGender());
        ps.setDouble(5, emp.getBsalary());
        return ps.executeUpdate() > 0;
    }

    public boolean updateEmployee(Employee emp) throws SQLException {
        Connection con = DBConnection.getConnection();
        String sql = "UPDATE Employee SET EmpName=?, DoJ=?, Gender=?, Bsalary=? WHERE Empno=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, emp.getEmpName());
        ps.setDate(2, emp.getDoj());
        ps.setString(3, emp.getGender());
        ps.setDouble(4, emp.getBsalary());
        ps.setInt(5, emp.getEmpno());
        return ps.executeUpdate() > 0;
    }

    public boolean deleteEmployee(int empno) throws SQLException {
        Connection con = DBConnection.getConnection();
        String sql = "DELETE FROM Employee WHERE Empno=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, empno);
        return ps.executeUpdate() > 0;
    }

    public Employee getEmployee(int empno) throws SQLException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM Employee WHERE Empno=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, empno);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            Employee emp = new Employee();
            emp.setEmpno(rs.getInt("Empno"));
            emp.setEmpName(rs.getString("EmpName"));
            emp.setDoj(rs.getDate("DoJ"));
            emp.setGender(rs.getString("Gender"));
            emp.setBsalary(rs.getDouble("Bsalary"));
            return emp;
        }
        return null;
    }

    // Reports
    public List<Employee> getEmployeesByNamePrefix(String prefix) throws SQLException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM Employee WHERE EmpName LIKE ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, prefix + "%");
        ResultSet rs = ps.executeQuery();
        List<Employee> list = new ArrayList<>();
        while (rs.next()) {
            Employee emp = new Employee();
            emp.setEmpno(rs.getInt("Empno"));
            emp.setEmpName(rs.getString("EmpName"));
            emp.setDoj(rs.getDate("DoJ"));
            emp.setGender(rs.getString("Gender"));
            emp.setBsalary(rs.getDouble("Bsalary"));
            list.add(emp);
        }
        return list;
    }

    public List<Employee> getEmployeesByExperience(int years) throws SQLException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM Employee WHERE YEAR(CURDATE()) - YEAR(DoJ) >= ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, years);
        ResultSet rs = ps.executeQuery();
        List<Employee> list = new ArrayList<>();
        while (rs.next()) {
            Employee emp = new Employee();
            emp.setEmpno(rs.getInt("Empno"));
            emp.setEmpName(rs.getString("EmpName"));
            emp.setDoj(rs.getDate("DoJ"));
            emp.setGender(rs.getString("Gender"));
            emp.setBsalary(rs.getDouble("Bsalary"));
            list.add(emp);
        }
        return list;
    }

    public List<Employee> getEmployeesBySalary(double salary) throws SQLException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM Employee WHERE Bsalary > ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setDouble(1, salary);
        ResultSet rs = ps.executeQuery();
        List<Employee> list = new ArrayList<>();
        while (rs.next()) {
            Employee emp = new Employee();
            emp.setEmpno(rs.getInt("Empno"));
            emp.setEmpName(rs.getString("EmpName"));
            emp.setDoj(rs.getDate("DoJ"));
            emp.setGender(rs.getString("Gender"));
            emp.setBsalary(rs.getDouble("Bsalary"));
            list.add(emp);
        }
        return list;
    }
}

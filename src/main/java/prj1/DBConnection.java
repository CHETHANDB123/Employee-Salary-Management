 	package prj1;


 	import java.sql.*;

 	public class DBConnection {
 	    private static final String URL = "jdbc:mysql://localhost:3306/Employee";
 	    private static final String USER = "root";
 	    private static final String PASS = "";

 	    public static Connection getConnection() throws SQLException {
 	        try {
 	            Class.forName("com.mysql.cj.jdbc.Driver");
 	        } catch (ClassNotFoundException e) {
 	            e.printStackTrace();
 	        }
 	        return DriverManager.getConnection(URL, USER, PASS);
 	    }
 	}

package manager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConncetionDAO {
	
	public static Connection getConnection()
	{
		
		try
        {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException e)
        {
            System.out.println("MySQL JDBC Driver not found !!");
        }
        Connection connection = null;
        try {
            connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/college1", "rootuser1", "Welcome@01#");
        } 
        catch (SQLException e) 
        {
            System.out.println("Connection Failed! Check output console");
        }
		return connection;
	}
}

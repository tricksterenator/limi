

package edu.uh.cs.limi.dbase;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbManager {

	private static final String dbName			= "limi_db";
	private static final String dbUrlWithoutDbName		= "jdbc:mysql://localhost:3306/";
	//private static final String dbUrlWithoutDbName		= "jdbc:mysql://limi.cs.uh.edu:3306/";
	private static final String dbUsername			= "root";
	private static final String dbPassword			= "123qsc";
	//private static final String dbPassword			= "123qsc";
	
	static {
		try {
			try { 
				Class.forName("com.mysql.jdbc.Driver").newInstance();
			} catch (InstantiationException e1) {
				e1.printStackTrace();
			} catch (IllegalAccessException e1) {
				e1.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getDirectConnection(){
		Connection con = null;
		try {
			con = DriverManager.getConnection(dbUrlWithoutDbName+dbName,
			dbUsername, dbPassword);
		} catch (SQLException e) {
			edu.uh.cs.limi.util.Util.DoLogging("Connection",e.toString(), "error");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return con;
	} 
}

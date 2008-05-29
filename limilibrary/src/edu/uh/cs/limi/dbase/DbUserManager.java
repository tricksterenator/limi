package edu.uh.cs.limi.dbase;

import java.sql.*;

import edu.uh.cs.limi.main.*;
import edu.uh.cs.limi.user.*;

public class DbUserManager {
	private Connection sqlConnection;
	private Statement sqlStatement;
	private String sqlString;
	private ResultSet sqlResultSet;
	public DbUserManager()
	{
		
	}

	public int LoadUser(User objUser)
	{
		int success;
		try {
			sqlConnection=DbManager.getDirectConnection();
			sqlStatement = sqlConnection.createStatement();
			sqlString = "SELECT * FROM user WHERE lower(username) = '" + objUser.getUsername().toLowerCase() +"'";
			sqlResultSet = sqlStatement.executeQuery(sqlString);

			if(sqlResultSet.next()) {
				objUser.setUserId(sqlResultSet.getInt("userId"));
				objUser.setUsername(sqlResultSet.getString("username"));
				objUser.setPassword(sqlResultSet.getString("password"));
				objUser.setName(sqlResultSet.getString("name"));
				objUser.setSurname(sqlResultSet.getString("surname"));
				objUser.setEmail(sqlResultSet.getString("email"));
				success=Codes.Success;
			}
			else
			{
				success=Codes.NoUsername;
			}
			sqlStatement.close();
			sqlResultSet.close();
			sqlConnection.close();
		} catch(Exception e) {
			success=Codes.Exception;
		}
		finally
		{
				
		}
		return success;
	}
	public int SaveUser(User objUser)
	{
		int success; 
		try {
			sqlConnection=DbManager.getDirectConnection();
			sqlStatement = sqlConnection.createStatement();
			sqlString = "SELECT * FROM user WHERE lower(username) = '" + objUser.getUsername().toLowerCase() +"'";
			sqlResultSet = sqlStatement.executeQuery(sqlString);
			
			
			if(!sqlResultSet.next()) {
				sqlString="INSERT INTO user(name,surname,username,password,email,active) ";
				sqlString+="VALUES('"+objUser.getName()+"','"+objUser.getSurname()+"','";
				sqlString+=objUser.getUsername()+"','";
				sqlString+=objUser.getPassword()+"','"+objUser.getEmail()+"',1)";
				if(sqlStatement.executeUpdate(sqlString)>0) //if minimum one row updated,it means success
				{
					success=Codes.Success;
				}else
				{
					success=Codes.SqlFailure;
				}
			}
			else
			{
				success=Codes.UserNameConflict; //there is a user with the same name
			}
			sqlStatement.close();
			sqlResultSet.close();
			sqlConnection.close();
		} catch(Exception e) {
			edu.uh.cs.limi.util.Util.DoLogging("SaveUser",e.getMessage(), "error");
			success=Codes.Exception;
		}
		finally
		{
				
		}
		return success;
	}
}


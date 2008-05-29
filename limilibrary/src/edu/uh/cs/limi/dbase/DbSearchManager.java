package edu.uh.cs.limi.dbase;

import java.sql.*;
import java.util.ArrayList;

import edu.uh.cs.limi.main.*;

public class DbSearchManager {
	private Connection sqlConnection;
	private Statement sqlStatement;
	private String sqlString;
	private ResultSet sqlResultSet;
	
	public DbSearchManager()
	{
		
	}
	public ArrayList Search(String searchCommand)
	{
		ArrayList results=new ArrayList();
		try {
			sqlConnection=DbManager.getDirectConnection();
			sqlStatement = sqlConnection.createStatement();
			sqlString = searchCommand;
			sqlResultSet = sqlStatement.executeQuery(sqlString);
			Series objSearchResult;
			while(sqlResultSet.next()) {
				objSearchResult=new Series();
				objSearchResult.seriesid=sqlResultSet.getInt("seriesid");
				objSearchResult.to_studyid=sqlResultSet.getInt("to_studyid");
				objSearchResult.comments=sqlResultSet.getString("comments");
				results.add(objSearchResult);
			}
			sqlStatement.close();
			sqlResultSet.close();
			sqlConnection.close();
		} catch(Exception e) {
			edu.uh.cs.limi.util.Util.DoLogging("LoadSearchResult",e.toString(), "error");
		}
		finally
		{

		}
		return results;
	}
	
	public int LoadMediaforSeries(ArrayList images, ArrayList videos,int series_id)
	{
		int success=Codes.Success; //we assume its successful
		try {
			sqlConnection=DbManager.getDirectConnection();
			sqlStatement = sqlConnection.createStatement();
			sqlString = "SELECT videopath,imagepath FROM image WHERE to_seriesid="+String.valueOf(series_id);
			sqlResultSet = sqlStatement.executeQuery(sqlString);
			Series objSearchResult;
			while(sqlResultSet.next()) {
				images.add(sqlResultSet.getString("imagepath"));
				videos.add(sqlResultSet.getString("videopath"));
			}
			success=Codes.Success;
			sqlStatement.close();
			sqlResultSet.close();
			sqlConnection.close();
		} catch(Exception e) {
			success=Codes.Exception;
			edu.uh.cs.limi.util.Util.DoLogging("LoadMediaForSeries",e.toString(), "error");
		}
		finally
		{

		}
		return success;
	}
	
	public int LoadBasicInfoforSeries(Series objSeries)
	{
		int success=Codes.Success; //we assume its successful first then we check it
		try {
			sqlConnection=DbManager.getDirectConnection();
			sqlStatement = sqlConnection.createStatement();
			sqlString = "SELECT studyid,seriesid,lastname,series.comments as comments FROM patient, study, series WHERE to_patientid = patientid and series.to_studyid = studyid and seriesid="+String.valueOf(objSeries.seriesid);
			sqlResultSet = sqlStatement.executeQuery(sqlString);
			if(sqlResultSet.next()) {
				objSeries.seriesid=sqlResultSet.getInt("seriesid");
				objSeries.to_studyid=sqlResultSet.getInt("studyid");
				objSeries.comments=sqlResultSet.getString("comments");
				objSeries.patientslastname=sqlResultSet.getString("lastname");
			}
			success=Codes.Success;
			sqlStatement.close();
			sqlResultSet.close();
			sqlConnection.close();
		} catch(Exception e) {
			success=Codes.Exception;
			edu.uh.cs.limi.util.Util.DoLogging("LoadBasicInfoforSeries",e.toString(), "error");
		}
		finally
		{

		}
		return success;
	}
	
	//Do not forget to change it
	public int LoadMetaDataforSeries(Series objSeries)
	{
		int success=Codes.Success; //we assume its successful first then we check it
		try {
			sqlConnection=DbManager.getDirectConnection();
			sqlStatement = sqlConnection.createStatement();
			sqlString = "SELECT seriesid, to_studyid, comments FROM series seriesid="+String.valueOf(objSeries.seriesid);
			sqlResultSet = sqlStatement.executeQuery(sqlString);
			if(sqlResultSet.next()) {
				objSeries.seriesid=sqlResultSet.getInt("seriesid");
				objSeries.to_studyid=sqlResultSet.getInt("to_studyid");
				objSeries.comments=sqlResultSet.getString("comments");
			}
			success=Codes.Success;
			sqlStatement.close();
			sqlResultSet.close();
			sqlConnection.close();
		} catch(Exception e) {
			success=Codes.Exception;
			edu.uh.cs.limi.util.Util.DoLogging("LoadBasicInfoforSeries",e.toString(), "error");
		}
		finally
		{

		}
		return success;
	}
	
	public int GetParamsInStudy(ArrayList paramnames,ArrayList paramvalues,int seriesid)
	{
		int success=Codes.Success;
		try {
			sqlConnection=DbManager.getDirectConnection();
			sqlStatement = sqlConnection.createStatement();
			sqlString = "SELECT param_name,param_value FROM series,study,paramsinstudy where series.to_studyid = "+String.valueOf(seriesid)+" and study.studyid = series.to_studyid and paramsinstudy.to_studyid = studyid";
			sqlResultSet = sqlStatement.executeQuery(sqlString);
			Series objSearchResult;
			while(sqlResultSet.next()) {
				paramnames.add(sqlResultSet.getString("param_name"));
				paramvalues.add(sqlResultSet.getString("param_value"));
			}
			success=Codes.Success;
			sqlStatement.close();
			sqlResultSet.close();
			sqlConnection.close();
		} catch(Exception e) {
			success=Codes.Exception;
			edu.uh.cs.limi.util.Util.DoLogging("LoadSearchResult",e.toString(), "error");
		}
		finally
		{

		}
		return success;
	}
}

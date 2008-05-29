package edu.uh.cs.limi.main;

import java.util.ArrayList;

import edu.uh.cs.limi.dbase.DbSearchManager;

public class ParamsInStudy {
	private int seriesid;
	public ArrayList parameternames;
	public ArrayList parametervalues;
	private DbSearchManager objDbSearchManager;
	
	public ParamsInStudy(int series_id)
	{
		seriesid=series_id;
		parameternames=new ArrayList();
		parametervalues=new ArrayList();
		objDbSearchManager=new DbSearchManager();
	}
	
	public int GetParameters()
	{
		return objDbSearchManager.GetParamsInStudy(parameternames, parametervalues, seriesid);
	}
	
}

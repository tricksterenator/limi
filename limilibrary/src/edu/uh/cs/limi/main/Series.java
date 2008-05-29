package edu.uh.cs.limi.main;

import java.util.ArrayList;

import edu.uh.cs.limi.dbase.DbSearchManager;

public class Series {
	public int seriesid;
	public int to_studyid;
	public String comments;
	public String patientslastname;
	private ArrayList images;
	private ArrayList videos;
	private DbSearchManager objDbSearchManager;
	
	public Series()
	{
		images=new ArrayList();
		videos=new ArrayList();
		objDbSearchManager=new DbSearchManager();
	}
	
	public int LoadBasicInfo()
	{
		return objDbSearchManager.LoadBasicInfoforSeries(this);
	}
	
	public int LoadMedia()
	{
		return objDbSearchManager.LoadMediaforSeries(images, videos, seriesid);
	}
	public ArrayList GetImages()
	{
		return images;
	}
	
	public ArrayList GetVideos()
	{
		return videos;
	}
}

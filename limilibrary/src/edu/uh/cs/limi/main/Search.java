package edu.uh.cs.limi.main;

import java.util.ArrayList;

import edu.uh.cs.limi.dbase.DbSearchManager;

public class Search {
	private String keyword;
	private String searchCommand;
	private ArrayList searchResults;
	private DbSearchManager objDbSearchManager;
	
	public Search()
	{
		objDbSearchManager=new DbSearchManager();
	}
	
	public Search(String kw)
	{
		keyword=kw;
		this.ConvertToSqlCommand();
		objDbSearchManager=new DbSearchManager();
	}
	
	public String GetKeyword()
	{
		return keyword;
	}
	
	public void SetSearchCommand(String command)
	{
		searchCommand=command;
	}
	private void ConvertToSqlCommand()
	{
		String x = this.keyword;
        x = x.trim();
        String y = "Comments Like '%" + x.replace(" ", "%' And Comments Like '%");
        y = y.trim() + "%'";
        String cmd = " SELECT seriesid, to_studyid, comments FROM series WHERE ";
        cmd = cmd + y;
        searchCommand=cmd;
	}
	
	public ArrayList DoSearch()
	{
		return objDbSearchManager.Search(searchCommand);
	}
}

package edu.uh.cs.limi.util;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintStream;

public class Util {
	
	public static void  DoLogging(String logger,String logInfo,String logLevel)
	{
		try
		{
			PrintStream filewriter = new PrintStream(new FileOutputStream("F:/limilog.txt",true));
			filewriter.println("Log Method : "+logger);
			filewriter.println("Log Information : "+logInfo);
			filewriter.println("Log Level : "+logLevel);
			filewriter.println("-----------------------------------------------------------------");
			filewriter.close();
		}catch(Exception ex)
		{
			
		}
	}

}

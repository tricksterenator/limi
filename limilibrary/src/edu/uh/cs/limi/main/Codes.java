package edu.uh.cs.limi.main;

/****
 * This class represents enumaration for our most 
 * common messages from classes to other classes or
 * jsp interfaces
 * @author Yusuf
 *
 */
public class Codes {
	public static final int NoUsername=1;
	public static final int Exception=2;
	public static final int UserNameConflict=3;
	public static final int Success=4;
	public static final int SqlFailure=5;
	public static final int NoNews=6;
	
	public static String GetCodeName(int codeID)
	{
		String strResult="";
		switch (codeID) {
		case 1:
			strResult="NoUsername";
			break;
		case 2:
			strResult="Exception";
			break;
		case 3:
			strResult="UserNameConflict";
			break;
		case 4:
			strResult="Success";
			break;
		case 5:
			strResult="SqlFailure";
			break;
		case 6:
			strResult="Nonews";
			break;
		default:
			break;
		}
		return strResult;
	}

	/****
	 * Returns the value of integer as type of Codes
	 */
	/*
	public static Codes valueof(int value)
	{
		switch (value) {
		case 1:
			return this;
			break;
		case 2:
			return this;
			break;
		case 3:

			break;
		case 4:

			break;
		default:
			break;
		}
	}
	*/

}

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
 document.title='Limi Login';
</script>
<%@ include file="header.jsp" %>
<br><br><br><br><br>
<center>
<form action="logincheck.jsp" method="post">
<table border=0 cellpadding=0 cellspacing=0 width="100%">
	<tr><td align=center valign=middle>	
	
<table cellspacing="0" cellpadding="4" border="0" style="background-color:#F7F6F3;border-color:#E6E2D8;border-width:1px;border-style:Solid;border-collapse:collapse;">
	<tr>
		<td><table cellpadding="0" border="0" style="color:#333333;font-family:Verdana;font-size:0.8em;height:133px;width:264px;">
			<tr>
				<td align="center" colspan="2" style="color:White;background-color:#5D7B9D;font-size:0.9em;font-weight:bold;">Log In</td>
			</tr><tr>
				<td align="right"><label>User Name:</label></td><td><input type="text" name="username" style="font-size:0.8em;" /></td>
			</tr><tr>
				<td align="right"><label>Password:</label></td><td><input type="password" name="password" style="font-size:0.8em;" /></td>
			</tr><tr>
				<td colspan="2"><input type="checkbox" name="remember_me" /><label>Remember me next time.</label></td>
			</tr><tr>
				<td align="right" colspan="2"><a href='register.jsp' style="visibility:hidden;">Sign Up</a>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Log In" style="color:#284775;background-color:#FFFBFF;border-color:#CCCCCC;border-width:1px;border-style:Solid;font-family:Verdana;font-size:0.8em;" /></td>
				
			</tr>
		</table></td>
	</tr>
</table>        
    </td></tr></table>
    </form>
 </center>
<%@ include file="footer.jsp" %>
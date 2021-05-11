<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page  import="javax.servlet.http.*" %> 
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;  
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
String dataPoints = null;
String dataPoints1 = null;

 
try{
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/snega10","root", "snegaa@12");
	Statement statement = connection.createStatement();
	Float xVal;
	String yVal=null;
	int avg1,avg2,avg3,avg4,avg5;
	String name=request.getParameter("user");
	System.out.println(name);
	    ResultSet res=statement.executeQuery("select * from student1 where name='"+name+"'");
	  while(res.next())
	  {
	  
		  out.println("<html>");
	        out.println("<head>");
	        out.println("<style>");
	        out.println("header{");
	        out.println("padding:25px;");
	        out.println("text-align:center;");
	        out.println("background:#2CC185 ;");
	        out.println("color:white;");
	        out.println("font-size:25px;");
	        out.println("word-spacing:10px;");
	        out.println("font-family: 'Satisfy', cursive;");
	        out.println("}");
	        out.println("</head>");
	        out.println("</style>");
	        out.println("<body>");
	        out.println("<header>The Prediction.com");
	        out.println("</header>");
	        out.println("<tr><td>");
            out.print("Name");
	        out.println("<td>");
		    out.print(res.getString(1));
		    out.println("</td></tr>");
		    out.println("<br>");
		    out.println("<tr><td>");
		    out.print("Rollno");
		    out.println("</td>");
	        out.println("<td>");
		    out.println(res.getString(2));
		    out.println("</td></tr>");
		    out.println("<br>");
		    out.println("<tr><td>");
		    out.print("CAT1 MARKS");
		    out.println("</td></tr>");
	        out.println("<td>");
	        out.println("<br>");
		    out.println("<tr><td>");
		    out.print("Subject1");
		    out.println("</td>");
		    out.println("<td>");
            out.println(res.getString(3));
		    out.println("</td></tr>");
		    out.println("<br>");
		    out.println("<tr><td>");
		    out.print("Subject2");
		    out.println("</td>");
		    out.println("<td>");
            out.println(res.getString(4));
		    out.println("</td></tr>");
		    out.println("<br>");
		    out.println("<tr><td>");
		    out.print("Subject3");
		    out.println("</td>");
		    out.println("<td>");
            out.println(res.getString(5));
		    out.println("</td></tr>");
		    out.println("<br>");
		    out.println("<tr><td>");
		    out.print("Subject4");
		    out.println("</td>");
		    out.println("<td>");
            out.println(res.getString(6));
		    out.println("</td></tr>");
		    out.println("<br>");
		    out.println("<tr><td>");
		    out.print("Subject5");
		    out.println("</td>");
		    out.println("<td>");
            out.println(res.getString(7));
		    out.println("</td></tr>");
		    out.println("<br>");
		    out.println("<tr><td>");
		    out.print("CAT2 MARKS");
		    out.println("</td></tr>");
	        out.println("<td>");
	        out.println("<br>");
		    out.println("<tr><td>");
		    out.print("Subject1");
		    out.println("</td>");
		    out.println("<td>");
            out.println(res.getString(8));
		    out.println("</td></tr>");
		    out.println("<br>");
		    out.println("<tr><td>");
		    out.print("Subject2");
		    out.println("</td>");
		    out.println("<td>");
            out.println(res.getString(9));
		    out.println("</td></tr>");
		    out.println("<br>");
		    out.println("<tr><td>");
		    out.print("Subject3");
		    out.println("</td>");
		    out.println("<td>");
            out.println(res.getString(10));
		    out.println("</td></tr>");
		    out.println("<br>");
		    out.println("<tr><td>");
		    out.print("Subject4");
		    out.println("</td>");
		    out.println("<td>");
            out.println(res.getString(11));
		    out.println("</td></tr>");
		    out.println("<br>");
		    out.println("<tr><td>");
		    out.print("Subject5");
		    out.println("</td>");
		    out.println("<td>");
            out.println(res.getString(12));
		    out.println("</td></tr>");
		    out.println("<br>");
		    out.println("<tr><td>");
		    out.print("CAT3 MARKS");
		    out.println("</td></tr>");
	        out.println("<td>");
	        out.println("<br>");
		    out.println("<tr><td>");
		    out.print("Subject1");
		    out.println("</td>");
		    out.println("<td>");
            out.println(res.getString(13));
		    out.println("</td></tr>");
		    out.println("<br>");
		    out.println("<tr><td>");
		    out.print("Subject2");
		    out.println("</td>");
		    out.println("<td>");
            out.println(res.getString(14));
		    out.println("</td></tr>");
		    out.println("<br>");
		    out.println("<tr><td>");
		    out.print("Subject3");
		    out.println("</td>");
		    out.println("<td>");
            out.println(res.getString(15));
		    out.println("</td></tr>");
		    out.println("<br>");
		    out.println("<tr><td>");
		    out.print("Subject4");
		    out.println("</td>");
		    out.println("<td>");
            out.println(res.getString(16));
		    out.println("</td></tr>");
		    out.println("<br>");
		    out.println("<tr><td>");
		    out.print("Subject5");
		    out.println("</td>");
		    out.println("<td>");
            out.println(res.getString(17));
		    out.println("</td></tr>");
		    out.println("</html>");
		  
	  
		  
			  


	 	  avg1=(res.getInt(3)+res.getInt(8)+res.getInt(13))/3;
		 avg2=(res.getInt(4)+res.getInt(9)+res.getInt(14))/3;
		 avg3=(res.getInt(5)+res.getInt(10)+res.getInt(15))/3;
         avg4=(res.getInt(6)+res.getInt(11)+res.getInt(16))/3;
         avg5=(res.getInt(7)+res.getInt(12)+res.getInt(17))/3;
         map = new HashMap<Object,Object>(); map.put("label", "Subject1"); map.put("y", avg1); list.add(map);
         map = new HashMap<Object,Object>(); map.put("label", "Subject2"); map.put("y", avg2); list.add(map);
         map = new HashMap<Object,Object>(); map.put("label", "Subject3"); map.put("y", avg3); list.add(map);
         map = new HashMap<Object,Object>(); map.put("label", "Subject4"); map.put("y", avg4); list.add(map);
         map = new HashMap<Object,Object>(); map.put("label", "Subject5"); map.put("y", avg5); list.add(map);
          
          dataPoints = gsonObj.toJson(list);
          
         }
	  connection.close();
	  }
catch(SQLException e){
	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
	dataPoints = null;
}

%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() { 
 
<% if(dataPoints != null) { %>
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	exportEnabled: true,
	title: {
		text: "Comparison of Three CAT Marks"
	},
	data: [{
		type: "column", //change type to bar, line, area, pie, etc
		dataPoints: <%out.print(dataPoints);%>
	}]
});
chart.render();
<% } %> 
}

</script>
<style>
.s{
  position:absolute;
  top: 380px;
  left: 600px;
  width: 200px;
  height: 40px;
  padding: 8px 10px;
  font-family: Georgia;
  font-size: 18px;
  background-color: white;
  color: black;
  border: 2px solid black;
  border-radius: 20px
}</style>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<form action="NewFile1.jsp" method="post">
<input type="hidden" name="name"   value='<%=request.getParameter("user")%>'/>
<input type="submit" class="s" value="Predicted Values"/>
</form>
</body>
</html>   


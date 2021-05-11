<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
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
	Statement statement2 = connection.createStatement();
	Statement statement3 = connection.createStatement();
	
	Float xVal;
	String yVal=null;
	int avg1,avg2,avg3,avg4,avg5;
	String name=request.getParameter("name");
	 System.out.println(name);
	 ResultSet res=statement.executeQuery("select * from student1 where name='"+name+"'");
	 ResultSet rs1=statement2.executeQuery("select * from predictions where name='"+name+"'");	
	 ResultSet rs2=statement3.executeQuery("select * from predictions where name='"+name+"'");	
	  while(res.next() && rs1.next())
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
		    out.print("Subject1");
		    out.println("</td>");
		    out.println("<td>");
            out.println(rs1.getInt(2));
		    out.println("</td></tr>");
		    out.println("<br>");
		    out.println("<tr><td>");
		    out.print("Subject2");
		    out.println("</td>");
		    out.println("<td>");
            out.println(rs1.getInt(3));
		    out.println("</td></tr>");
		    out.println("<br>");
		    out.println("<tr><td>");
		    out.print("Subject3");
		    out.println("</td>");
		    out.println("<td>");
            out.println(rs1.getInt(4));
		    out.println("</td></tr>");
		    out.println("<br>");
		    out.println("<tr><td>");
		    out.print("Subject4");
		    out.println("</td>");
		    out.println("<td>");
            out.println(rs1.getInt(5));
		    out.println("</td></tr>");
		    out.println("<br>");
		    out.println("<tr><td>");
		    out.print("Subject5");
		    out.println("</td>");
		    out.println("<td>");
            out.println(rs1.getInt(6));
		    out.println("</td></tr>");
		    out.println("<br>");
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
	  list = new ArrayList<Map<Object,Object>>();
	  
  	  while(rs2.next())
	  {
		  int sub1=rs1.getInt(2);
		  System.out.println(sub1);
		  int sub2=rs1.getInt(3);
		  int sub3=rs1.getInt(4);
		  int sub4=rs1.getInt(5);
		  int sub5=rs1.getInt(6);
          map = new HashMap<Object,Object>(); map.put("label", "Subject1"); map.put("y", sub1); list.add(map);
          map = new HashMap<Object,Object>(); map.put("label", "Subject2"); map.put("y", sub2); list.add(map);
          map = new HashMap<Object,Object>(); map.put("label", "Subject3"); map.put("y", sub3); list.add(map);
          map = new HashMap<Object,Object>(); map.put("label", "Subject4"); map.put("y", sub4); list.add(map);
          map = new HashMap<Object,Object>(); map.put("label", "Subject5"); map.put("y",  sub5); list.add(map);

          dataPoints1 = gsonObj.toJson(list);
          System.out.println(list);

		  

	  }}
catch(SQLException e){
	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
	dataPoints1 = null;
}
%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() { 
	 
	
	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		exportEnabled: true,
		title: {
			text: "Actual Vs Predicted marks"
		},
		
		axisX: {
			title: "Subjects",
			
		},
		axisY: {
			logarithmic: true, //change it to false
			title: "Actual values",
			titleFontColor: "#6D78AD",
			lineColor: "#6D78AD",
			gridThickness: 0,
			lineThickness: 1,
			
		},
		axisY2: {
			title: "Predicted values",
			titleFontColor: "#51CDA0",
			logarithmic: false, //change it to true
			lineColor: "#51CDA0",
			gridThickness: 0,
			lineThickness: 1
		},
		toolTip: {
			shared: true
		},
		legend: {
			verticalAlign: "top",
			dockInsidePlotArea: true
		},
		data: [{
			type: "line",
			
			showInLegend: true,
			name: "Actual values",
			legendText: "{name} (in Log Scale)",
			dataPoints: <%out.print(dataPoints);%>
		},
		{
			type: "line",
			
			axisYType: "secondary",
			showInLegend: true,
			name: "Predicted values",
			legendText: "{name} (in Linear Scale)",
			dataPoints: <%out.print(dataPoints1);%>
		}]
	});
	chart.render();
	
	}

</script>

</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

</form>
</body>
</html>   


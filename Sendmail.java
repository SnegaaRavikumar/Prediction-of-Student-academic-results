package pac;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Properties;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Sendmail
 */
@WebServlet("/Sendmail")
public class Sendmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sendmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @param System.out 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String recipient;
		String sender = "snegaaravikumar@gmail.com";
        String host = "smtp.gmail.com";
        Properties properties = System.getProperties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication("snegaaravikumar@gmail.com", "snegaa@10");

            }

        });
        session.setDebug(true);
	 
     PrintWriter out=response.getWriter();
    try 
    {
    	    Class.forName("com.mysql.jdbc.Driver"); 
    		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/snega10","root", "snegaa@12");
    		Statement statement = connection.createStatement();
    		Statement statement2 = connection.createStatement();
    		ResultSet rs1=statement.executeQuery("select * from parents");
    		ResultSet rs2=statement2.executeQuery("select * from predictions");
    		 while(rs1.next() && rs2.next())
    		  {
    		    	recipient=rs1.getString(4);
    		        int value1=rs2.getInt(2);
    		        int value2=rs2.getInt(3);
    		        int value3=rs2.getInt(4);
    		        int value4=rs2.getInt(5);
    		        int value5=rs2.getInt(6);
    		    	
    		       MimeMessage message = new MimeMessage(session);

    		       // Set From Field: adding senders email to from field.
    		       message.setFrom(new InternetAddress(sender));

    		       // Set To Field: adding recipient's email to from field.
    		       message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

    		       // Set Subject: subject of the email
    		       message.setSubject("The Predicted marks of Your Daughter/Son");
    		       String bodyText="<html>"
    		    		   +"<body>"
    		    		   +rs1.getString(1)
    		    		   +"PREDICTED MARKS"
    		    		   +"<br>"
    		    		   +"SUBJECT1:"+value1
    		               +"<br>"
    		               +"SUBJECT2:"+value2
    		               +"<br>"
    		               +"SUBJECT3:"+value3
    		               +"<br>"
    		               +"SUBJECT4:"+value4
    		               +"<br>"
    		               +"SUBJECT5:"+value5;
    		                         
    		               
    		      
    		       message.setContent(bodyText,"text/html");

    		       // Send email.
    		       Transport.send(message);
    		       System.out.println("Mail successfully sent");
    		      
    
    		    }
    		 ServletContext sc = getServletContext();
    	        sc.getRequestDispatcher("/success.html").forward(request, response);
    		    	
    		  
    		  connection.close();
    		  }
catch(MessagingException mex) 
{
   mex.printStackTrace();
} 
    	catch(SQLException | ClassNotFoundException e){
    		out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
    	
    	}
	}
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

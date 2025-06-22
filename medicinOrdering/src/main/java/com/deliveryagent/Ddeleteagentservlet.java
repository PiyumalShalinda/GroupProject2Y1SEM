package com.deliveryagent;

import java.io.IOException;

import java.util.List;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Ddeleteagentservlet")
public class Ddeleteagentservlet extends HttpServlet { /*inheritance using*/
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { /*polymophism/overriding*/
		 

		String agentID=request.getParameter("agentID");
		boolean isTrue;
		
		isTrue = DDBUtil.Ddeleteagent(agentID); /*abstraction*/
		
		if(isTrue==true) {
			RequestDispatcher dispatcher= request.getRequestDispatcher("Dinsert.jsp");
			dispatcher.forward(request, response);
		}
		else {
			List<Deliveryagent> DDetails = DDBUtil.getDDetails(agentID);
			request.setAttribute("DDetails",DDetails);
			
			RequestDispatcher dispatcher= request.getRequestDispatcher("DAgentaccount.jsp");
			dispatcher.forward(request, response);
		}
	}

}

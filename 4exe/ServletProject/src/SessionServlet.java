import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class SessionServlet extends HttpServlet
{
    public void doPost(
        HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException
    {

        response.setContentType("text/html");

        PrintWriter out=response.getWriter();

        String name=
        request.getParameter("username");

        HttpSession session=
        request.getSession();

        session.setAttribute("user",name);

        out.println("<html>");
        out.println("<body>");

        out.println("<h2>Form Submitted Successfully</h2>");

        out.println("<h3>Welcome "
        +session.getAttribute("user")
        +"</h3>");

        out.println("<p>Session ID : "
        +session.getId()
        +"</p>");

        out.println("</body>");
        out.println("</html>");

    }
}
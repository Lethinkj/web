import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
                      throws IOException
    {

        response.setContentType("text/html");

        PrintWriter out=response.getWriter();

        String name=request.getParameter("uname");

        HttpSession session=request.getSession();

        session.setAttribute("user",name);

        out.println("Welcome " + name);
    }
}

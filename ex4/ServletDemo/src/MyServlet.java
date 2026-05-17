import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class MyServlet extends HttpServelet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String name = request.getParameter("name");
    HttpSession session = request.getSession();
    session.setAttribute("username", name);
    out.println("<html><body>");
    out.println("<h2>Form Submitted Successfully</h2>");
    out.println("<h3>Welcome " + session.getAttribute("username") + "</h3>");
    out.println("</body></html>");
    }
}
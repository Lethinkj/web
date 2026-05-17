package com.studentapp;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.List;

public class StudentServlet extends HttpServlet {
    private StudentDAO studentDAO = new StudentDAO();

    @Override
    public void init() throws ServletException {
        try {
            studentDAO.createTable();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action == null || action.equals("list")) {
                listStudents(request, response);
            } else if (action.equals("delete")) {
                deleteStudent(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action.equals("add")) {
                addStudent(request, response);
            } else if (action.equals("update")) {
                updateStudent(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void listStudents(HttpServletRequest request, HttpServletResponse response)
            throws Exception, ServletException, IOException {
        List<Student> students = studentDAO.getAllStudents();
        request.setAttribute("students", students);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    private void addStudent(HttpServletRequest request, HttpServletResponse response)
            throws Exception, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");

        Student student = new Student(name, email, course);
        studentDAO.addStudent(student);
        
        response.sendRedirect("StudentServlet?action=list");
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response)
            throws Exception, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");

        Student student = new Student(id, name, email, course);
        studentDAO.updateStudent(student);
        
        response.sendRedirect("StudentServlet?action=list");
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response)
            throws Exception, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        studentDAO.deleteStudent(id);
        
        response.sendRedirect("StudentServlet?action=list");
    }
}

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Student" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            max-width: 900px;
            margin: 0 auto;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .form-section {
            background-color: #e8f4f8;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .form-section h2 {
            color: #0066cc;
            margin-top: 0;
        }
        form {
            display: grid;
            gap: 10px;
        }
        form input, form select {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        form button {
            padding: 10px;
            background-color: #0066cc;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        form button:hover {
            background-color: #0052a3;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        table th {
            background-color: #0066cc;
            color: white;
        }
        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .delete-btn {
            background-color: #cc0000;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }
        .delete-btn:hover {
            background-color: #990000;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📚 Student Management System (Three-Tier Application)</h1>

        <!-- Add Student Form -->
        <div class="form-section">
            <h2>Add New Student</h2>
            <form method="POST" action="StudentServlet">
                <input type="hidden" name="action" value="add">
                <input type="text" name="name" placeholder="Student Name" required>
                <input type="email" name="email" placeholder="Email Address" required>
                <input type="text" name="course" placeholder="Course (e.g., Java, C++)" required>
                <button type="submit">Add Student</button>
            </form>
        </div>

        <!-- Students List -->
        <h2>All Students</h2>
        <% 
            List<Student> students = (List<Student>) request.getAttribute("students");
            if (students != null && !students.isEmpty()) {
        %>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Course</th>
                <th>Action</th>
            </tr>
            <% for (Student student : students) { %>
            <tr>
                <td><%= student.getId() %></td>
                <td><%= student.getName() %></td>
                <td><%= student.getEmail() %></td>
                <td><%= student.getCourse() %></td>
                <td>
                    <a href="StudentServlet?action=delete&id=<%= student.getId() %>" 
                       class="delete-btn" onclick="return confirm('Are you sure?');">Delete</a>
                </td>
            </tr>
            <% } %>
        </table>
        <% 
            } else {
        %>
        <p style="text-align: center; color: #666;">No students found. Add one to get started!</p>
        <% 
            }
        %>
    </div>
</body>
</html>

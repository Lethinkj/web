import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
    private String dbURL = "jdbc:sqlite:students.db";
    private String dbDriver = "org.sqlite.JDBC";

    // Connect to database
    public Connection getConnection() throws Exception {
        Class.forName(dbDriver);
        return DriverManager.getConnection(dbURL);
    }

    // Create table if not exists
    public void createTable() throws Exception {
        String sql = "CREATE TABLE IF NOT EXISTS students (" +
                "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
                "name TEXT NOT NULL, " +
                "email TEXT NOT NULL, " +
                "course TEXT NOT NULL)";
        
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {
            stmt.execute(sql);
            System.out.println("Table created or already exists");
        }
    }

    // INSERT - Add new student
    public boolean addStudent(Student student) throws Exception {
        String sql = "INSERT INTO students (name, email, course) VALUES (?, ?, ?)";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, student.getName());
            pstmt.setString(2, student.getEmail());
            pstmt.setString(3, student.getCourse());
            
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        }
    }

    // READ - Get all students
    public List<Student> getAllStudents() throws Exception {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM students";
        
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String course = rs.getString("course");
                
                students.add(new Student(id, name, email, course));
            }
        }
        return students;
    }

    // READ - Get student by ID
    public Student getStudentById(int id) throws Exception {
        String sql = "SELECT * FROM students WHERE id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String course = rs.getString("course");
                
                return new Student(id, name, email, course);
            }
        }
        return null;
    }

    // UPDATE - Update student
    public boolean updateStudent(Student student) throws Exception {
        String sql = "UPDATE students SET name = ?, email = ?, course = ? WHERE id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, student.getName());
            pstmt.setString(2, student.getEmail());
            pstmt.setString(3, student.getCourse());
            pstmt.setInt(4, student.getId());
            
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        }
    }

    // DELETE - Delete student
    public boolean deleteStudent(int id) throws Exception {
        String sql = "DELETE FROM students WHERE id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        }
    }
}

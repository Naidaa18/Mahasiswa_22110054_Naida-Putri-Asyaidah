<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    Connection conn = null;
    PreparedStatement ps = null;
    PreparedStatement upd = null;
    ResultSet rs = null;
    
    String nim = "", nama = "", mata_kuliah = "", kelas = "";
    int nilai = 0;
    int id = 0;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mahasiswa_db", "root", "");
        
        id = Integer.parseInt(request.getParameter("id"));
        
        // Handle update
        if (request.getParameter("update") != null) {
            upd = conn.prepareStatement("UPDATE mahasiswa SET nim=?, nama=?, nilai=?, mata_kuliah=?, kelas=? WHERE id=?");
            upd.setString(1, request.getParameter("nim"));
            upd.setString(2, request.getParameter("nama"));
            upd.setInt(3, Integer.parseInt(request.getParameter("nilai")));
            upd.setString(4, request.getParameter("mata_kuliah"));
            upd.setString(5, request.getParameter("kelas"));
            upd.setInt(6, id);
            upd.executeUpdate();
            response.sendRedirect("index.jsp");
            return;
        }
        
        // Get data for editing
        ps = conn.prepareStatement("SELECT * FROM mahasiswa WHERE id=?");
        ps.setInt(1, id);
        rs = ps.executeQuery();
        
        if (rs.next()) {
            nim = rs.getString("nim");
            nama = rs.getString("nama");
            nilai = rs.getInt("nilai");
            mata_kuliah = rs.getString("mata_kuliah");
            kelas = rs.getString("kelas");
        } else {
            response.sendRedirect("index.jsp");
            return;
        }
    } catch (Exception e) {
        out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
    }
%>

<html>
<head>
    <title>Edit Data Mahasiswa</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #fff0f6;
        }
        .card-custom {
            border-radius: 20px;
            background-color: #fff;
            box-shadow: 0 0 20px rgba(248, 140, 180, 0.2);
        }
        .btn-success-custom {
            background-color: #f783ac;
            border: none;
            border-radius: 10px;
            color: white;
        }
        .btn-success-custom:hover {
            background-color: #f06595;
        }
        h3 {
            color: #d63384;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card card-custom p-4">
                    <div class="card-header bg-white border-0">
                        <h3 class="text-center">📝 Edit Data Mahasiswa</h3>
                    </div>
                    <div class="card-body">
                        <form method="post">
                            <div class="mb-3">
                                <label for="nim" class="form-label">NIM</label>
                                <input type="text" name="nim" id="nim" class="form-control" value="<%= nim %>" required>
                            </div>
                            <div class="mb-3">
                                <label for="nama" class="form-label">Nama</label>
                                <input type="text" name="nama" id="nama" class="form-control" value="<%= nama %>" required>
                            </div>
                            <div class="mb-3">
                                <label for="nilai" class="form-label">Nilai</label>
                                <input type="number" name="nilai" id="nilai" class="form-control" value="<%= nilai %>" min="0" max="100" required>
                            </div>
                            <div class="mb-3">
                                <label for="mata_kuliah" class="form-label">Mata Kuliah</label>
                                <input type="text" name="mata_kuliah" id="mata_kuliah" class="form-control" value="<%= mata_kuliah %>" required>
                            </div>
                            <div class="mb-3">
                                <label for="kelas" class="form-label">Kelas</label>
                                <input type="text" name="kelas" id="kelas" class="form-control" value="<%= kelas %>" required>
                            </div>
                            <div class="d-grid gap-2">
                                <button class="btn btn-success-custom" name="update">💾 Update</button>
                                <a href="index.jsp" class="btn btn-secondary">↩️ Batal</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

<%
    try {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (upd != null) upd.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    if (request.getParameter("simpan") != null) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mahasiswa_db", "root", "");

            String sql = "INSERT INTO mahasiswa(nim, nama, nilai, mata_kuliah, kelas) VALUES (?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, request.getParameter("nim"));
            ps.setString(2, request.getParameter("nama"));
            ps.setInt(3, Integer.parseInt(request.getParameter("nilai")));
            ps.setString(4, request.getParameter("mata_kuliah"));
            ps.setString(5, request.getParameter("kelas"));
            ps.executeUpdate();
            response.sendRedirect("index.jsp");
            return;
        } catch (Exception e) {
            out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

<html>
<head>
    <title>Tambah Mahasiswa</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #fff0f6;
        }
        .card-custom {
            border-radius: 20px;
            box-shadow: 0 0 20px rgba(248, 140, 180, 0.2);
            background-color: #fff;
        }
        .btn-pink {
            background-color: #f783ac;
            color: white;
            border: none;
            border-radius: 10px;
        }
        .btn-pink:hover {
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
                    <h3 class="text-center mb-4">✨ Tambah Mahasiswa ✨</h3>
                    <form method="post">
                        <div class="mb-3">
                            <label for="nim" class="form-label">NIM</label>
                            <input type="text" name="nim" id="nim" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="nama" class="form-label">Nama</label>
                            <input type="text" name="nama" id="nama" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="nilai" class="form-label">Nilai</label>
                            <input type="number" name="nilai" id="nilai" class="form-control" min="0" max="100" required>
                        </div>
                        <div class="mb-3">
                            <label for="mata_kuliah" class="form-label">Mata Kuliah</label>
                            <input type="text" name="mata_kuliah" id="mata_kuliah" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="kelas" class="form-label">Kelas</label>
                            <input type="text" name="kelas" id="kelas" class="form-control" required>
                        </div>
                        <div class="d-grid gap-2">
                            <button class="btn btn-pink" name="simpan">💾 Simpan</button>
                            <a href="index.jsp" class="btn btn-secondary">⬅️ Kembali</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

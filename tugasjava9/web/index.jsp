<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Data Mahasiswa</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #ffeef2;
            background-image: url('https://www.transparenttextures.com/patterns/pink-pixels.png');
            background-repeat: repeat;
            font-family: 'Segoe UI', sans-serif;
        }
        .container {
            max-width: 1100px;
        }
        .card-custom {
            background-color: #fff0f5;
            border: 2px solid #f8cde2;
            border-radius: 25px;
            box-shadow: 0 4px 15px rgba(255, 182, 193, 0.4);
            transition: all 0.3s ease-in-out;
        }
        .card-custom:hover {
            transform: scale(1.02);
        }
        .card-title {
            color: #d63384;
            font-weight: bold;
        }
        .btn-primary {
            background-color: #f783ac;
            border: none;
        }
        .btn-primary:hover {
            background-color: #f06595;
        }
        .btn-success {
            background-color: #da77f2;
            border: none;
        }
        .btn-danger {
            background-color: #ff6b6b;
            border: none;
        }
        .badge-nilai {
            background-color: #ffd6e0;
            color: #c2255c;
            font-size: 0.9rem;
        }
        #side-decor {
            position: fixed;
            top: 0;
            bottom: 0;
            width: 80px;
            background-image: url('https://i.ibb.co/2v5D3Wk/flower-side.png');
            background-repeat: repeat-y;
            background-size: contain;
            opacity: 0.4;
            z-index: 0;
        }
        #left-decor {
            left: 0;
        }
        #right-decor {
            right: 0;
        }
    </style>
</head>
<body>
<div id="left-decor" class="d-none d-md-block" id="side-decor"></div>
<div id="right-decor" class="d-none d-md-block" id="side-decor"></div>

<div class="container py-5 position-relative">
    <div class="text-center mb-5">
        <h2 class="fw-bold text-danger-emphasis">🌸 Daftar Mahasiswa Cantik 🌸</h2>
        <p class="text-muted">Tampilan data dengan nuansa pink yang lembut dan manis</p>
    </div>

    <div class="d-flex justify-content-between mb-4 flex-wrap gap-3">
        <a href="tambah.jsp" class="btn btn-primary">+ Tambah Mahasiswa</a>
        <input type="text" id="searchInput" class="form-control w-50" placeholder="🔍 Cari mahasiswa...">
    </div>

    <div class="row" id="cardContainer">
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mahasiswa_db", "root", "");
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM mahasiswa");
                while (rs.next()) {
        %>
        <div class="col-md-4 mb-4 mahasiswa-card">
            <div class="card card-custom p-3">
                <div class="card-body">
                    <h5 class="card-title">🎀 <%= rs.getString("nama") %></h5>
                    <p class="card-text mb-1">🧾 <strong>NIM:</strong> <%= rs.getString("nim") %></p>
                    <p class="card-text mb-1">📘 <strong>Mata Kuliah:</strong> <%= rs.getString("mata_kuliah") %></p>
                    <p class="card-text mb-1">🏫 <strong>Kelas:</strong> <%= rs.getString("kelas") %></p>
                    <p class="card-text">📊 <strong>Nilai:</strong> <span class="badge badge-nilai"><%= rs.getInt("nilai") %></span></p>
                    <div class="d-flex justify-content-between mt-3">
                        <a href="edit.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-success">Edit</a>
                        <a href="hapus.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-danger" onclick="return confirm('Yakin ingin menghapus?')">Hapus</a>
                    </div>
                </div>
            </div>
        </div>
        <%
                }
            } catch (Exception e) {
                out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Live search
    document.getElementById("searchInput").addEventListener("keyup", function () {
        let input = this.value.toLowerCase();
        let cards = document.querySelectorAll(".mahasiswa-card");
        cards.forEach(card => {
            let text = card.innerText.toLowerCase();
            card.style.display = text.includes(input) ? "" : "none";
        });
    });
    
    
</script>
</body>
</html>

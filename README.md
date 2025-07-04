**📚 Tugas Java 9 - Aplikasi Web CRUD Mahasiswa**
Proyek ini merupakan aplikasi web sederhana yang dibuat menggunakan Java Server Pages (JSP). Aplikasi ini menyediakan fitur CRUD (Create, Read, Update, Delete) data mahasiswa.

**✨ Fitur Utama**
1. Menampilkan daftar mahasiswa
2. Menambahkan data mahasiswa
3. Mengedit data mahasiswa
4. Menghapus data mahasiswa
5. Koneksi ke database melalui JDBC

**🛠️ Teknologi yang Digunakan**
1. Java (JSP & Servlet)
2. HTML & CSS (basic)
3. JDBC (Java Database Connectivity)
4. Apache Tomcat (sebagai server)
5. MySQL (sebagai database)

**📁 Struktur Folder**
├── build.xml
├── build/
│   └── web/
│       ├── index.jsp
│       ├── tambah.jsp
│       ├── edit.jsp
│       ├── hapus.jsp
│       ├── META-INF/
│       └── WEB-INF/
└── src/
    └── DatabaseConnection.java
    
**⚙️ Cara Menjalankan**
1. Import proyek ini ke NetBeans atau IDE yang kamu gunakan.
2. Pastikan MySQL sudah berjalan dan buat database sesuai dengan kebutuhan (test, mahasiswa, dsb).
3. Edit konfigurasi koneksi database di file DatabaseConnection.java jika perlu.
4. Jalankan aplikasi menggunakan server Apache Tomcat.

**📌 Catatan**
Pastikan JDBC driver sudah tersedia di library project.
Proyek ini cocok untuk latihan dasar pengembangan aplikasi web berbasis JSP dan koneksi ke database.

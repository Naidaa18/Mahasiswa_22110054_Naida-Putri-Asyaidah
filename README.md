📚 Tugas Java 9 - Aplikasi Web CRUD Mahasiswa
Proyek ini merupakan aplikasi web sederhana yang dibuat menggunakan Java Server Pages (JSP). Aplikasi ini menyediakan fitur CRUD (Create, Read, Update, Delete) data mahasiswa.

✨ Fitur Utama
Menampilkan daftar mahasiswa
Menambahkan data mahasiswa
Mengedit data mahasiswa
Menghapus data mahasiswa
Koneksi ke database melalui JDBC

🛠️ Teknologi yang Digunakan
Java (JSP & Servlet)
HTML & CSS (basic)
JDBC (Java Database Connectivity)
Apache Tomcat (sebagai server)
MySQL (sebagai database)

📁 Struktur Folder
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
    
⚙️ Cara Menjalankan
Import proyek ini ke NetBeans atau IDE yang kamu gunakan.
Pastikan MySQL sudah berjalan dan buat database sesuai dengan kebutuhan (test, mahasiswa, dsb).
Edit konfigurasi koneksi database di file DatabaseConnection.java jika perlu.
Jalankan aplikasi menggunakan server Apache Tomcat.

📌 Catatan
Pastikan JDBC driver sudah tersedia di library project.
Proyek ini cocok untuk latihan dasar pengembangan aplikasi web berbasis JSP dan koneksi ke database.

<%@ page import="java.sql.*" %>
<%@ page import="koneksi.Koneksi" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    Connection conn = null;
    PreparedStatement ps = null;
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        conn = Koneksi.getConnection();
        ps = conn.prepareStatement("DELETE FROM mahasiswa WHERE id=?");
        ps.setInt(1, id);
        ps.executeUpdate();
        response.sendRedirect("index.jsp");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
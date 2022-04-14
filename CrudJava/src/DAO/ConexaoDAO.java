package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class ConexaoDAO {

    public Connection conectaBD(){
        Connection conn = null;

        try {
            String url = "jdbc:mysql://localhost:3306/aluguel_carro?user=root&password=";
            conn = DriverManager.getConnection(url);
        } catch (SQLException erro) {
            JOptionPane.showMessageDialog(null, "DAO.ConexaoDAO" + erro.getMessage());
        }
        return conn;
    }
}

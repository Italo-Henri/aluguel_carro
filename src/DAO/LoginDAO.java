package DAO;

import DTO.LoginDTO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.swing.JOptionPane;

public class LoginDAO {

    Connection conn;

    public ResultSet autenticacaoUsuario(LoginDTO objusuariodto) {
        conn = new ConexaoDAO().conectaBD();

        try {
            String sql = "SELECT login, senha FROM usuarios WHERE login = ? and senha = ? ";
            
            PreparedStatement pstm = conn.prepareStatement(sql);
            
            pstm.setString(1, objusuariodto.getNome_usuario());
            pstm.setString(2, objusuariodto.getSenha_usuario());
            
            ResultSet rs = pstm.executeQuery();
            return rs;

        } catch (SQLException erro) {
            JOptionPane.showMessageDialog(null, "UsuarioDAO" + erro);
            return null;
        }

    }

}

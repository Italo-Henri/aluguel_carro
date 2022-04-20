package DAO;

import DTO.FuncionarioDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class FuncionarioDAO {

    Connection conn;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<FuncionarioDTO> lista = new ArrayList<>();

    public void cadastrarFuncionario(FuncionarioDTO objfuncionariodto) {
        String sql = "INSERT INTO usuarios (nome, RG, expedidor, cpf, sexo, data_nasc, email, login, senha) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        conn = new ConexaoDAO().conectaBD();

        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, objfuncionariodto.getNome());
            pstm.setString(2, objfuncionariodto.getRG());
            pstm.setString(3, objfuncionariodto.getExpedidor());
            pstm.setString(4, objfuncionariodto.getCPF());
            pstm.setString(5, objfuncionariodto.getSexo());
            pstm.setString(6, objfuncionariodto.getData_nascimento());
            pstm.setString(7, objfuncionariodto.getEmail());
            pstm.setString(8, objfuncionariodto.getLogin());
            pstm.setString(9, objfuncionariodto.getSenha());

            pstm.execute();
            pstm.close();
        } catch (SQLException erro) {

            JOptionPane.showMessageDialog(null, "FuncionarioDAO Cadastrar: " + erro);
        }

    }

    public ArrayList<FuncionarioDTO> ListarFuncionario() {
        String sql = "SELECT * FROM usuarios";
        conn = new ConexaoDAO().conectaBD();

        try {
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();

            while (rs.next()) {
                FuncionarioDTO objfuncionariodto = new FuncionarioDTO();
                objfuncionariodto.setId_usuario(rs.getInt("id_usuario"));
                objfuncionariodto.setNome(rs.getString("nome"));
                objfuncionariodto.setRG(rs.getString("RG"));
                objfuncionariodto.setExpedidor(rs.getString("expedidor"));
                objfuncionariodto.setCPF(rs.getString("cpf"));
                objfuncionariodto.setSexo(rs.getString("sexo"));
                objfuncionariodto.setData_nascimento(rs.getString("data_nasc"));
                objfuncionariodto.setEmail(rs.getString("email"));
                objfuncionariodto.setLogin(rs.getString("login"));
                objfuncionariodto.setSenha(rs.getString("senha"));

                lista.add(objfuncionariodto);
            }

        } catch (SQLException erro) {
            JOptionPane.showMessageDialog(null, "FuncionarioDAO Pesquisar: " + erro);
        }
        return lista;
    }

}

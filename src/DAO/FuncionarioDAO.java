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
        String sql = "INSERT INTO usuarios (nome, RG, expedidor, cpf, sexo, data_nasc, email, telefone, login, senha, id_perfil) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        conn = new ConexaoDAO().conectaBD();

        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, objfuncionariodto.getNome());
            pstm.setString(2, objfuncionariodto.getRG());
            pstm.setString(3, objfuncionariodto.getExpedidor());
            pstm.setString(4, objfuncionariodto.getCPF());
            pstm.setString(5, objfuncionariodto.getSexo());
            pstm.setString(6, objfuncionariodto.getData_nasc());
            pstm.setString(7, objfuncionariodto.getEmail());
            pstm.setString(8, objfuncionariodto.getTelefone());
            pstm.setString(9, objfuncionariodto.getLogin());
            pstm.setString(10, objfuncionariodto.getSenha());
            pstm.setInt(11, objfuncionariodto.getId_perfil());

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
                objfuncionariodto.setData_nasc(rs.getString("data_nasc"));
                objfuncionariodto.setEmail(rs.getString("email"));
                objfuncionariodto.setTelefone(rs.getNString("telefone"));
                objfuncionariodto.setLogin(rs.getString("login"));
                objfuncionariodto.setSenha(rs.getString("senha"));
                objfuncionariodto.setId_perfil(rs.getInt("id_perfil"));

                lista.add(objfuncionariodto);
            }

        } catch (SQLException erro) {
            JOptionPane.showMessageDialog(null, "FuncionarioDAO Pesquisar: " + erro);
        }
        return lista;
    }
    
    public void alterarFuncionario(FuncionarioDTO objfuncionariodto){
        String sql = "UPDATE usuarios SET nome = ?, RG = ?, expedidor = ?, cpf = ?, sexo = ?, data_nasc = ?, email = ?, telefone = ?, login = ?, senha = ? WHERE id_usuario = ?";
        
        conn = new ConexaoDAO().conectaBD();

        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, objfuncionariodto.getNome());
            pstm.setString(2, objfuncionariodto.getRG());
            pstm.setString(3, objfuncionariodto.getExpedidor());
            pstm.setString(4, objfuncionariodto.getCPF());
            pstm.setString(5, objfuncionariodto.getSexo());
            pstm.setString(6, objfuncionariodto.getData_nasc());
            pstm.setString(7, objfuncionariodto.getEmail());
            pstm.setString(8, objfuncionariodto.getTelefone());
            pstm.setString(9, objfuncionariodto.getLogin());
            pstm.setString(10, objfuncionariodto.getSenha());
            pstm.setInt(11, objfuncionariodto.getId_usuario());

            pstm.execute();
            pstm.close();
            
        } catch (SQLException erro) {

            JOptionPane.showMessageDialog(null, "FuncionarioDAO Alterar: " + erro);
        }
        
    }

}

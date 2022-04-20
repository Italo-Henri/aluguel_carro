package VIEW.util;

import javax.swing.text.AttributeSet;
import javax.swing.text.BadLocationException;
import javax.swing.text.PlainDocument;

public class LimitaCaracteres extends PlainDocument {

    //Enumerador com os Tipos de Dados
    public enum TipoEntrada {
        NUMEROINTEIRO, NUMERODECIMAL, NOME, EMAIL, DATA;
    };

    //Atributos da Classe
    private int qtdCaracteres;
    private TipoEntrada tpEntrada;

    public LimitaCaracteres(int qtdCaracteres, TipoEntrada tpEntrada) {
        this.qtdCaracteres = qtdCaracteres;
        this.tpEntrada = tpEntrada;
    }

    //Overide do método insert String
    @Override
    public void insertString(int i, String string, AttributeSet as) throws BadLocationException {
        if (string == null || getLength() == qtdCaracteres) {
            return;
        }
        int totalCarac = getLength() + string.length();

        //filtros de caracteres:
        String regex = "";
        switch (tpEntrada) {
            case NUMEROINTEIRO: regex = "[^0-9]"; break;
            case NUMERODECIMAL: regex = "[^0-9,.]"; break;
            case NOME:          regex = "[^\\p{IsLatin} ]"; break;
            case EMAIL:         regex = "[^\\p{IsLatin}@.\\-_][^0-9]"; break;
            case DATA:          regex = "[^0-9/]"; break;
        }
        //fazendo a substituição
        string = string.replaceAll(regex, "");

        if (totalCarac <= qtdCaracteres) {
            super.insertString(i, string, as); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
        }else{
            String nova = string.substring(0, qtdCaracteres);
            super.insertString(i, nova, as);
        }
    }

}

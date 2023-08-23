/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Code;

/**
 *
 * @author bruno
 */
public class GoToken {
    
    private String _token;
    private String _lexema;
    private int _line = 0;
    private int _column = 0;
    
    public GoToken(String token, String lexema) {
        this._token = token;
        this._lexema = lexema;
    }
    
    public GoToken(String token, String lexema, int line, int column) {
        this._token = token;
        this._lexema = lexema;
        this._line = line;
        this._column = column;
    }
    
    public String toString() {
        return "GoToken {"
                + "token: " + this._token + " "
                + "lexema: " + this._lexema + " "
                + "line: " + this._line + " "
                + "column: " + this._column + " "
                + " }";
    }
}

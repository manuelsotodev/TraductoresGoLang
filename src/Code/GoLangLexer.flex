/*
 * This class is a simple lexer.
*/

package Code;
%%

/* Inicio de seccion de delcaraciones de JFlex */

%class GoLangLexer
%type GoToken
%line
%column
%{
    /*private boolean _existenTokens = false;
 
    public boolean existenTokens(){
       return this._existenTokens;
    }*/

    /*StringBuffer string = new StringBuffer();

    private Symbol symbol(int type) {
      return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }

    public String lexeme;*/
%}

/* Inicio de expresiones regulares */
Digito = [0-9]
Numero = {Digito} {Digito}*
Letra = [a-zA-Z]
Palabra = {Letra} {Letra}*
LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace = {LineTerminator} | [ \t\f]
ArithmeticOperators = "+"|"-"|"*"|"/"|"%"|"="
PunctuationSymbols = "("|")"|"{"|"}"|"["|"]"
Espacio = " "

/* Comments */
Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}
TraditionalComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
EndOfLineComment = "//" {InputCharacter}* {LineTerminator}
DocumentationComment = "/**" {CommentContent} "*"+ "/"
CommentContent = ( [^*] | \*+ [^/*] )*

Identifier = [:jletter:] [:jletterdigit:]

/* Fin de expresiones regulares */

/*%state STRING*/

%%
/* Fin de seccion de delcaraciones de JFlex */

/* Inicio seccion de reglas*/
/* Keywords */
/*<YYINITIAL> "" { System.out.println(""); return symbol(sym.); }*/
<YYINITIAL> "package" {
    System.out.println("Deteccion de package");
    GoToken gotoken = new GoToken("PACKAGE", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "import" {
    System.out.println("Importacion de package");
    GoToken gotoken = new GoToken("IMPORT", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "func" {
    System.out.println("Declaracion de funcion");
    GoToken gotoken = new GoToken("FUNC", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> {
    {WhiteSpace} {/* Ignore */}
    {Palabra} {
        System.out.println("Palabra");
        GoToken gotoken = new GoToken("WORD", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    
    /* Complex Arithmetic Operators */
    "++" {
        System.out.println("Operador incremento en uno");
        GoToken gotoken = new GoToken("PLUSPLUS", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "--" {
        System.out.println("Operador decremento en uno");
        GoToken gotoken = new GoToken("MINUSMINUS", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "+=" {
        System.out.println("Operador incremento y asignacion");
        GoToken gotoken = new GoToken("PLUSEQ", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "-=" {
        System.out.println("Operador decremento y asignacion");
        GoToken gotoken = new GoToken("MINUSEQ", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "*=" {
        System.out.println("Operador multiplicacion y asignacion");
        GoToken gotoken = new GoToken("MULTEQ", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "/=" {
        System.out.println("Operador divicion y asignacion");
        GoToken gotoken = new GoToken("DIVEQ", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "%=" {
        System.out.println("Operador modulo y asignacion");
        GoToken gotoken = new GoToken("MODEQ", yytext(), yyline+1, yycolumn);
        return gotoken;
    }

    /* Arithmetic Operators */
    "+" {
        System.out.println("Operador suma");
        GoToken gotoken = new GoToken("PLUS", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "-" {
        System.out.println("Operador resta");
        GoToken gotoken = new GoToken("MINUS", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "*" {
        System.out.println("Operador multiplicacion");
        GoToken gotoken = new GoToken("MULT", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "/" {
        System.out.println("Operador division");
        GoToken gotoken = new GoToken("DIV", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "=" {
        System.out.println("Operador asignacion");
        GoToken gotoken = new GoToken("EQ", yytext(), yyline+1, yycolumn);
        return gotoken;
    }

    /* Punctuation Symbols */
    "(" {
        System.out.println("Apertura parentesis");
        GoToken gotoken = new GoToken("OPPARANTHESIS", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    ")" {
        System.out.println("Cierre Parentesis");
        GoToken gotoken = new GoToken("CLPARENTHESIS", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "{" {
        System.out.println("Apertura Llaves");
        GoToken gotoken = new GoToken("OPKEYS", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "}" {
        System.out.println("Cierre Llaves");
        GoToken gotoken = new GoToken("CLKEYS", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "[" {
        System.out.println("Apertura Corchetes");
        GoToken gotoken = new GoToken("OPBRACKETS", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "]" {
        System.out.println("Cierre Corchetes");
        GoToken gotoken = new GoToken("CLBRACKETS", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    
}

/* Fin seccion de reglas*/

/* error fallback */
    [^]                              { throw new Error("Illegal character <"+yytext()+">"); }

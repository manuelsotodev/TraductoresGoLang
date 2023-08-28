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
Digito = [0-9]                                  /* NOT USED */
Numero = {Digito} {Digito}*                     /* NOT USED */
Letra = [a-zA-Z]                                /* NOT USED */
Palabra = {Letra} {Letra}*                      /* NOT USED */
LineTerminator = \r|\n|\r\n                     /* NOT USED */
InputCharacter = [^\r\n]                        /* NOT USED */
ArithmeticOperators = "+"|"-"|"*"|"/"|"%"|"="   /* NOT USED */
PunctuationSymbols = "("|")"|"{"|"}"|"["|"]"    /* NOT USED */
Espacio = " " /* NOT USED */

Identificador = {Letra} [{Letra}|{Digito}]*
WhiteSpace = {LineTerminator} | [ \t\f]
String = \".*\"
Character = \'[\w]\'
/* (^[0-9]{1,3}$|^[0-9]{1,3}\.[0-9]{1,3}$) */
Integer = [0-9]+
Float = [0-9]+\.[0-9]+
Boolean = [true|false]

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
<YYINITIAL> "var" {
    System.out.println("Definicion de variable");
    GoToken gotoken = new GoToken("VAR", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "const" {
    System.out.println("Const");
    GoToken gotoken = new GoToken("CONST", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "if" {
    System.out.println("If");
    GoToken gotoken = new GoToken("IF", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "else" {
    System.out.println("Else / If-else");
    GoToken gotoken = new GoToken("ELSE", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "else if" {
    System.out.println("Else if");
    GoToken gotoken = new GoToken("ELSEIF", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "switch" {
    System.out.println("Switch");
    GoToken gotoken = new GoToken("SWITCH", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "case" {
    System.out.println("Case");
    GoToken gotoken = new GoToken("CASE", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "default" {
    System.out.println("Default");
    GoToken gotoken = new GoToken("DEFAULT", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "for" {
    System.out.println("For");
    GoToken gotoken = new GoToken("FOR", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "range" {
    System.out.println("Range");
    GoToken gotoken = new GoToken("RANGE", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "defer" {
    System.out.println("Defer");
    GoToken gotoken = new GoToken("DEFER", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "chan" {
    System.out.println("Chan");
    GoToken gotoken = new GoToken("CHAN", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "continue" {
    System.out.println("Continue");
    GoToken gotoken = new GoToken("CONTINUE", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "fallthrough" {
    System.out.println("Fallthrougth");
    GoToken gotoken = new GoToken("FALLTHROUGTH", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "go" {
    System.out.println("Go");
    GoToken gotoken = new GoToken("GO", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "goto" {
    System.out.println("Goto");
    GoToken gotoken = new GoToken("GOTO", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "interface" {
    System.out.println("Interface");
    GoToken gotoken = new GoToken("INTERFACE", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "map" {
    System.out.println("Map");
    GoToken gotoken = new GoToken("MAP", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "return" {
    System.out.println("Return");
    GoToken gotoken = new GoToken("RETURN", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "select" {
    System.out.println("Select");
    GoToken gotoken = new GoToken("SELECT", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "struct" {
    System.out.println("Struct");
    GoToken gotoken = new GoToken("STRUCT", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "type" {
    System.out.println("Type");
    GoToken gotoken = new GoToken("TYPE", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "Println" {
    System.out.println("Impresion de linea");
    GoToken gotoken = new GoToken("PRINTLN", yytext(), yyline+1, yycolumn);
    return gotoken;
}

/* Data types */
<YYINITIAL> "string" {
    System.out.println("String: data taype");
    GoToken gotoken = new GoToken("", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "int" {
    System.out.println("Integer: data taype");
    GoToken gotoken = new GoToken("INT", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "float" {
    System.out.println("Float: data type");
    GoToken gotoken = new GoToken("FLOAT", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "complex" {
    System.out.println("Complex: data type");
    GoToken gotoken = new GoToken("COMPLEX", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "bool" {
    System.out.println("Boolean: data type");
    GoToken gotoken = new GoToken("BOOL", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "byte" {
    System.out.println("Byte: data type");
    GoToken gotoken = new GoToken("BYTE", yytext(), yyline+1, yycolumn);
    return gotoken;
}
<YYINITIAL> "rune" {
    System.out.println("Rune");
    GoToken gotoken = new GoToken("RUNE", yytext(), yyline+1, yycolumn);
    return gotoken;
}

/* Regex and operators */
<YYINITIAL> {
    {Comment} {
        /* Esta seccion de codigo debe ser un *Ignore* */
        System.out.println("Comentario");
        GoToken gotoken = new GoToken("COMMENT", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    {WhiteSpace} {
        /* Esta seccion de codigo debe ser un *Ignore* */
        System.out.println("Espacio en blanco");
        GoToken gotoken = new GoToken("WHITESPACE", yytext(), yyline+1, yycolumn);
        return gotoken;
    }

    /* Logic Operators */
    "==" {
        System.out.println("Operador Comparacion");
        GoToken gotoken = new GoToken("EQEQ", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "!=" {
        System.out.println("Operador Diferente de...");
        GoToken gotoken = new GoToken("DIFF", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "<" {
        System.out.println("Operador Menor que");
        GoToken gotoken = new GoToken("LESSTH", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    ">" {
        System.out.println("Operador Mayor que");
        GoToken gotoken = new GoToken("GREATERTH", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "<=" {
        System.out.println("Operador Menor igual");
        GoToken gotoken = new GoToken("LESSEQ", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    ">=" {
        System.out.println("Operador Mayor igual");
        GoToken gotoken = new GoToken("GREATEREQ", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "&&" {
        System.out.println("Operador And");
        GoToken gotoken = new GoToken("AND", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "||" {
        System.out.println("Operador Or");
        GoToken gotoken = new GoToken("OR", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "!" {
        System.out.println("Operador Not");
        GoToken gotoken = new GoToken("NOT", yytext(), yyline+1, yycolumn);
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
    "%" {
        System.out.println("Operador modulo");
        GoToken gotoken = new GoToken("MOD", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    ":=" {
        System.out.println("Operador de asignacion 2");
        GoToken gotoken = new GoToken("EQ", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "=" {
        System.out.println("Operador asignacion 1");
        GoToken gotoken = new GoToken("EQ", yytext(), yyline+1, yycolumn);
        return gotoken;
    }

    /* Punctuation Symbols / bundlers */
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
    "," {
        System.out.println("Signo coma");
        GoToken gotoken = new GoToken("COMMA", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    "." {
        System.out.println("Signo punto");
        GoToken gotoken = new GoToken("DOT", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    ";" {
        System.out.println("Signo punto y coma");
        GoToken gotoken = new GoToken("SEMICOLON", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    ":" {
        System.out.println("Simbolo dos puntos");
        GoToken gotoken = new GoToken("COLON", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    
    {Identificador} {
        System.out.println("Palabra");
        GoToken gotoken = new GoToken("WORD", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    {String} {
        System.out.println("String/Cadena: value");
        GoToken gotoken = new GoToken("STRING", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    {Character} {
        System.out.println("Char/Caracter: value");
        GoToken gotoken = new GoToken("CHAR", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    {Integer} {
        System.out.println("Integer/Int/Entero: value");
        GoToken gotoken = new GoToken("INT", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    {Float} {
        System.out.println("Double/Float/Decimal: value");
        GoToken gotoken = new GoToken("FLOAT", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
    {Boolean} {
        System.out.println("Booelan/Bool: value");
        GoToken gotoken = new GoToken("BOOL", yytext(), yyline+1, yycolumn);
        return gotoken;
    }
}

/* Fin seccion de reglas*/

/* error fallback */
    [^]                              { throw new Error("Illegal character <"+yytext()+">"); }

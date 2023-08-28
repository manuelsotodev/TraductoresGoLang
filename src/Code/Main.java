/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Code;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

/**
 *
 * @author bruno
 */
public class Main {
    public static void main(String[] args) {
//        String flexFile = "C:/Users/bruno/OneDrive/Documentos/NetBeansProjects/GoLang/src/Code/GoLangLexer.flex";
//        lexerGenerator(flexFile);
        try {
            lexerGenerator(" C:/Users/bruno/OneDrive/Documentos/NetBeansProjects/GoLang/src/Code/GoLangLexer.flex");
//            String fileName = "C:/Users/bruno/OneDrive/Documentos/NetBeansProjects/GoLang/src/Code/HelloWorld.txt";
//            BufferedReader bufferReader = new BufferedReader(new FileReader(fileName));
//            GoLangLexer goLangLexer = new GoLangLexer(bufferReader);
//            
//            while ( true ) {
//                GoToken gotoken = goLangLexer.yylex();
//                System.out.println(gotoken.toString() + "\n");
//            }
        }
        catch ( Exception ex ) {
            System.out.println(ex.toString());
        }
    }
    
    public static void lexerGenerator(String path) {
        File file = new File(path);
        jflex.Main.generate(file);
    }
}

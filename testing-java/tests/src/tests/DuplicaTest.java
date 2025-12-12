package tests;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import exercicis.Duplica;

public class DuplicaTest {
    public void duplica() {
        ByteArrayOutputStream sortida = new ByteArrayOutputStream();
        PrintStream originSortida = System.out;
        System.setOut(new PrintStream(sortida));
        
        Duplica.main(null);
        
        System.setOut(originSortida);
        
        String result = sortida.toString().trim();
        
        if (result.equals("El doble de 5 és 10")) {
            System.out.println("Passa");
        } else {
            System.out.println("Falla");
        }
    }
    
    public void executaTests() {
        duplica();
    }
    
    public static void main(String[] args) {
        new DuplicaTest().executaTests();
    }
}

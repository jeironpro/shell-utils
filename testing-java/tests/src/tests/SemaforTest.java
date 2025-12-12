package tests;
import exercicis.Semafor;

public class SemaforTest {
    private final Semafor semafor = new Semafor();

    public void testColorGroc() {
        if (semafor.colorSemafor("groc").equals("corre!")) {
            System.out.println("Passa");
        } else {
            System.out.println("Falla");
        }
    }

    public void testColorVermell() {
        if (semafor.colorSemafor("vermell").equals("espera")) {
            System.out.println("Passa");
        } else {
            System.out.println("Falla");
        }
    }

    public void testColorVerd() {
        if (semafor.colorSemafor("verd").equals("passa")) {
            System.out.println("Passa");
        } else {
            System.out.println("Falla");
        }
    }
    
    public void executaTests() {
        testColorGroc();
        testColorVermell();
        testColorVerd();
    }
    
    public static void main(String[] args) {
        new SemaforTest().executaTests();
    }
}

package tests;
import exercicis.Calculadora;

public class CalculadoraTest {
    private final Calculadora calculadora = new Calculadora();

    public void testSumar() {
        if (calculadora.sumar(3, 2) == 5) {
            System.out.println("Passa");
        } else {
            System.out.println("Falla");
        }
    }

    public void testRestar() {
        if (calculadora.restar(5, 3) == 2) {
            System.out.println("Passa");
        } else {
            System.out.println("Falla");
        }
    }

    public void testMultiplicar() {
        if (calculadora.multiplicar(5, 2) == 10) {
            System.out.println("Passa");
        } else {
            System.out.println("Falla");
        }
    }

    public void testDividir() {
        if (calculadora.dividir(6, 3) == 2) {
            System.out.println("Passa");
        } else {
            System.out.println("Falla");
        }
    }
    
    public void executaTests() {
        testSumar();
        testRestar();
        testMultiplicar();
        testDividir();
    }
    
    public static void main(String[] args) {
        new CalculadoraTest().executaTests();
    }
}

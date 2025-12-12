package exercicis;
public class Semafor {
    public String colorSemafor(String color) {
        // Utilitzant Switch Expressions
        String indicacio = switch (color) {
            case "verd" -> "passa";
            case "vermell" -> "espera";
            case "groc" -> "corre!";
            default -> "ves a l'oculista";
        };
        return indicacio;
    }
}

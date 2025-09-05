package generadorContrasenias;

import java.util.Random;
import java.util.Scanner;

public class GeneradorContrasenias {
    public static String generar(int longitud, boolean usarMayus, boolean usarNum, boolean usarSimb) {
        String minusculas = "abcdefghijklmnopqrstuvwxyz";
        String mayusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String numeros = "0123456789";
        String simbolos = "!@#$%^&*()-_=+<>?";

        String caracteres = minusculas;
        if (usarMayus) caracteres += mayusculas;
        if (usarNum) caracteres += numeros;
        if (usarSimb) caracteres += simbolos;

        StringBuilder contrasena = new StringBuilder();
        Random rand = new Random();

        for (int i = 0; i < longitud; i++) {
            contrasena.append(caracteres.charAt(rand.nextInt(caracteres.length())));
        }
        return contrasena.toString();
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int longitud;
        char mayus, num, simb;

        System.out.print("Longitud (8-16): ");
        longitud = sc.nextInt();
        System.out.print("Incluir mayusculas? (s/n): ");
        mayus = sc.next().charAt(0);
        System.out.print("Incluir numeros? (s/n): ");
        num = sc.next().charAt(0);
        System.out.print("Incluir simbolos? (s/n): ");
        simb = sc.next().charAt(0);

        System.out.println("Contraseña generada: " +
            generar(longitud, mayus=='s', num=='s', simb=='s'));
    }
}


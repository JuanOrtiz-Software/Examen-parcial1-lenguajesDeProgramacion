package contarVocalesConsonantes;

import java.util.Scanner;

public class ContarVocalesConsonantes {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int vocales = 0, consonantes = 0;

        System.out.print("Ingrese una cadena: ");
        String cadena = sc.nextLine().toLowerCase();

        for (int i = 0; i < cadena.length(); i++) {
            char c = cadena.charAt(i);
            if (Character.isLetter(c)) {
                if ("aeiou".indexOf(c) != -1)
                    vocales++;
                else
                    consonantes++;
            }
        }

        System.out.println("Vocales: " + vocales);
        System.out.println("Consonantes: " + consonantes);

        sc.nextLine(); // esperar tecla
    }
}


import java.util.Scanner;

public class ArbolBinario {

    static class Nodo {
        int valor;
        Nodo izq, der;
        Nodo(int v) { valor = v; }
    }

    static Nodo insertar(Nodo raiz, int v) {
        if (raiz == null) return new Nodo(v);
        if (v <= raiz.valor) raiz.izq = insertar(raiz.izq, v);
        else                 raiz.der = insertar(raiz.der, v);
        return raiz;
    }

    static void preorden(Nodo r) {
        if (r == null) return;
        System.out.print(r.valor + " ");
        preorden(r.izq);
        preorden(r.der);
    }

    static void inorden(Nodo r) {
        if (r == null) return;
        inorden(r.izq);
        System.out.print(r.valor + " ");
        inorden(r.der);
    }

    static void postorden(Nodo r) {
        if (r == null) return;
        postorden(r.izq);
        postorden(r.der);
        System.out.print(r.valor + " ");
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Inserta enteros para el arbol (termina con -1):");

        Nodo raiz = null;

        while (true) {
            if (!sc.hasNextInt()) {
                System.err.println("Entrada no valida.");
                return;
            }
            int x = sc.nextInt();
            if (x == -1) break;
            raiz = insertar(raiz, x);
        }

        System.out.print("\nRecorrido PREORDEN:  ");
        preorden(raiz);
        System.out.print("\nRecorrido INORDEN:   ");
        inorden(raiz);
        System.out.print("\nRecorrido POSTORDEN: ");
        postorden(raiz);
        System.out.println();
    }
}

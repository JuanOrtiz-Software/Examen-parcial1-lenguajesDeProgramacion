#include <iostream>
#include <sstream>
#include <vector>
using namespace std;

struct Nodo {
    int valor;
    Nodo* izq;
    Nodo* der;
    Nodo(int v) : valor(v), izq(nullptr), der(nullptr) {}
};


Nodo* insertar(Nodo* raiz, int v) {
    if (!raiz) return new Nodo(v);
    if (v <= raiz->valor) raiz->izq = insertar(raiz->izq, v); // dupes a la izquierda
    else                  raiz->der = insertar(raiz->der, v);
    return raiz;
}


void preorden(Nodo* r) {
    if (!r) return;
    cout << r->valor << " ";
    preorden(r->izq);
    preorden(r->der);
}

void inorden(Nodo* r) {
    if (!r) return;
    inorden(r->izq);
    cout << r->valor << " ";
    inorden(r->der);
}

void postorden(Nodo* r) {
    if (!r) return;
    postorden(r->izq);
    postorden(r->der);
    cout << r->valor << " ";
}


void liberar(Nodo* r) {
    if (!r) return;
    liberar(r->izq);
    liberar(r->der);
    delete r;
}

int main() {
    
    cout << "Inserta enteros para el arbol (termina con -1):\n";

    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    Nodo* raiz = nullptr;
    
    while (true) {
        int x;
        if (!(cin >> x)) {
            cerr << "Entrada no valida.\n";
            liberar(raiz);
            return 1;
        }
        if (x == -1) break;
        raiz = insertar(raiz, x);
    }

    cout << "\nRecorrido PREORDEN:  ";
    preorden(raiz);
    cout << "\nRecorrido INORDEN:   ";
    inorden(raiz);
    cout << "\nRecorrido POSTORDEN: ";
    postorden(raiz);
    cout << "\n";

    liberar(raiz);
    return 0;
}

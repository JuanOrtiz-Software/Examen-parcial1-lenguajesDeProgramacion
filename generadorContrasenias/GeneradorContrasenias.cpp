#include <iostream>
#include <string>
#include <cstdlib>
#include <ctime>

using namespace std;

string generarContrasena(int longitud, bool usarMayus, bool usarNum, bool usarSimbolos) {
    string minusculas = "abcdefghijklmnopqrstuvwxyz";
    string mayusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    string numeros = "0123456789";
    string simbolos = "!@#$%^&*()-_=+<>?";

    string caracteres = minusculas;
    if (usarMayus) caracteres += mayusculas;
    if (usarNum) caracteres += numeros;
    if (usarSimbolos) caracteres += simbolos;

    string contrasena;
    for (int i = 0; i < longitud; i++) {
        contrasena += caracteres[rand() % caracteres.size()];
    }
    return contrasena;
}

int main() {
    srand(time(0));
    int longitud;
    char mayus, num, simb;

    cout << "Longitud (8-16): ";
    cin >> longitud;
    cout << "Incluir mayusculas? (s/n): ";
    cin >> mayus;
    cout << "Incluir numeros? (s/n): ";
    cin >> num;
    cout << "Incluir simbolos? (s/n): ";
    cin >> simb;

    cout << "Contrasenia generada: " 
         << generarContrasena(longitud, mayus=='s', num=='s', simb=='s') << endl;
    return 0;
}

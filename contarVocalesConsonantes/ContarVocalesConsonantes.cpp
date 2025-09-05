#include <iostream>
#include <string>
#include <cctype>  

using namespace std;

int main() {
    string cadena;
    int vocales = 0, consonantes = 0;

    cout << "Ingrese una cadena: ";
    getline(cin, cadena);

    for (char c : cadena) {
        c = tolower(c); 
        if (isalpha(c)) {
            if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u')
                vocales++;
            else
                consonantes++;
        }
    }

    cout << "Vocales: " << vocales << endl;
    cout << "Consonantes: " << consonantes << endl;

    cout << "Presione ENTER para salir...";
    cin.ignore(); 
    return 0;
}

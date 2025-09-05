#include <iostream>
using namespace std;

int main() {
    int numero;
    cout << "Ingresa un numero: ";
    cin >> numero;

    if (numero % 2 == 0) {
        cout << "Par" << endl;
    } else {
        cout << "Impar" << endl;
    }

    return 0;
}

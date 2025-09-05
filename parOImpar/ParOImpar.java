package parOImpar;

import java.util.Scanner;
/**
 *
 * @author huijo
 */
public class ParOImpar {
    
    public static void main(String[] args) {
       
        Scanner sc = new Scanner(System.in);
        
        System.out.println("Ingresa un numero: ");
        
        int numero = sc.nextInt();
        
        if (numero % 2 == 0){
            
            System.out.println("Par");
        }else {
            System.out.println("Impar");
        }
        sc.close();
    }
    
}



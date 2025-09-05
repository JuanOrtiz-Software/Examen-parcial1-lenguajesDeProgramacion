program ParOImpar
    implicit none
    integer :: numero

    print *, 'Ingresa un numero: '
    read *, numero

    if (mod(numero, 2) == 0) then
        print *, 'Par'
    else
        print *, 'Impar'
    end if

    print *, 'Presiona ENTER para salir...'
    read *
end program ParOImpar


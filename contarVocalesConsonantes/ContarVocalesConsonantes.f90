program ContarVocalesConsonantes
    implicit none
    character(len=200) :: cadena
    integer :: i, vocales, consonantes, lenCad
    character(len=1) :: c

    vocales = 0
    consonantes = 0

    print *, 'Ingrese una cadena:'
    read(*,'(A)') cadena
    lenCad = len_trim(cadena)

    do i = 1, lenCad
        c = cadena(i:i)

        ! --- pasar a minuscula si es letra A..Z (ASCII) ---
        if (c >= 'A' .and. c <= 'Z') c = achar(iachar(c) + 32)

        ! --- contar solo letras ---
        if ( (c >= 'a' .and. c <= 'z') ) then
            if (index('aeiou', c) > 0) then
                vocales = vocales + 1
            else
                consonantes = consonantes + 1
            end if
        end if
    end do

    print *, 'Vocales: ', vocales
    print *, 'Consonantes: ', consonantes
    print *, 'Presione ENTER para salir'
    read(*,*)
end program ContarVocalesConsonantes


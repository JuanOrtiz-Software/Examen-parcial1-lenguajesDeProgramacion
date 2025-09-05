program ArbolBinario
    implicit none

    type :: Nodo
        integer :: valor = 0
        type(Nodo), pointer :: izq => null()
        type(Nodo), pointer :: der => null()
    end type Nodo

    type(Nodo), pointer :: raiz => null()
    integer :: x, ios
    character(len=1) :: pausa

    print *, 'Inserta enteros para el arbol (termina con -1):'

    do
        read(*,*, iostat=ios) x
        if (ios /= 0) then
            print *, 'Entrada no valida.'
            call liberar(raiz)
            stop 1
        end if
        if (x == -1) exit
        call insertar(raiz, x)
    end do

    write(*,'(A)', advance='no') new_line('a')//'Recorrido PREORDEN:  '
    call preorden(raiz)
    print *
    write(*,'(A)', advance='no') 'Recorrido INORDEN:   '
    call inorden(raiz)
    print *
    write(*,'(A)', advance='no') 'Recorrido POSTORDEN: '
    call postorden(raiz)
    print *

    call liberar(raiz)

    ! 👇 "Pausa" antes de salir
    print *, new_line('a'), 'Presiona ENTER para salir...'
    read(*,'(A)') pausa

contains

    recursive subroutine insertar(raiz, v)
        type(Nodo), pointer :: raiz
        integer, intent(in) :: v
        if (.not. associated(raiz)) then
            allocate(raiz)
            raiz%valor = v
            raiz%izq => null()
            raiz%der => null()
        else if (v <= raiz%valor) then
            call insertar(raiz%izq, v)
        else
            call insertar(raiz%der, v)
        end if
    end subroutine insertar

    recursive subroutine preorden(r)
        type(Nodo), pointer, intent(in) :: r
        if (.not. associated(r)) return
        write(*,'(I0,1X)', advance='no') r%valor
        call preorden(r%izq)
        call preorden(r%der)
    end subroutine preorden

    recursive subroutine inorden(r)
        type(Nodo), pointer, intent(in) :: r
        if (.not. associated(r)) return
        call inorden(r%izq)
        write(*,'(I0,1X)', advance='no') r%valor
        call inorden(r%der)
    end subroutine inorden

    recursive subroutine postorden(r)
        type(Nodo), pointer, intent(in) :: r
        if (.not. associated(r)) return
        call postorden(r%izq)
        call postorden(r%der)
        write(*,'(I0,1X)', advance='no') r%valor
    end subroutine postorden

    recursive subroutine liberar(r)
        type(Nodo), pointer :: r
        if (.not. associated(r)) return
        call liberar(r%izq)
        call liberar(r%der)
        deallocate(r)
        nullify(r)
    end subroutine liberar

end program ArbolBinario

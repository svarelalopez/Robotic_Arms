
%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE LT08
  CONST robtarget PC:=[[879.52,-428.71,744.82],[0.022908,-0.636698,-0.770688,-0.011468],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget PD1:=[[879.54,517.4,747.52],[0.022917,-0.636712,-0.770677,-0.011441],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

! Trabalho: Embalagem
! Data: 24/01/2023
! Aluno: Sebastián Varela

    !PC= origen de latas
    !Pd1= destino

    VAR ROBTARGET GRC; !GRande en C
    VAR ROBTARGET MEC; !MEdia en C
    VAR ROBTARGET PEC;
    VAR ROBTARGET GRD; ! GRande en D
    VAR ROBTARGET MED;
    VAR ROBTARGET PED;

    VAR NUM U; ! Up, para subir en z
    VAR NUM T;  ! TIEMPO
    VAR NUM C; ! altura caja

    ! VAR NUM GC; ! altura caja rel a c/lata
    ! VAR NUM MC;
    ! VAR NUM PC;

    VAR NUM gy; ! Desplazamientos para los FOR
    VAR NUM gx;
    VAR NUM my;
    VAR NUM mx;
    VAR NUM py;
    VAR NUM px;


PROC main ( )

    GRC:= Offs(PC, 0, 0, 18);
    MEC:= PC;
    PEC:= Offs(PC, 0, 0, -25);

    GRD:=Offs(Pd1, 0, 0, 18);
    MED:=Offs(Pd1, 50, 0, 113); !offset de Pd1 con diam lata; 18+95
    PED:=Offs(MED, 0, 50, 70); !offset de Pd1 con diam lata;antes pd1 offs(50, 50, 113+70)

    U:=0; !up
    C:=300; !LATAS + 20
    T:=0.5; !time secs



!!!!!!!!!!!!!!!!!!!! Recorrido 1

    ! MoveJ Offs(MEC, 0, 0, U), v500, fine, tool0;  !z no, u
    ! SET DO7;
    ! MoveJ Offs(MEC, 0, 0, C), v500, fine, tool0; !subir
    ! MoveJ Offs(MED, 0, 0, C), v500, fine, tool0; !ir
    ! MoveJ Offs(MED, 0, 0, U), v500, fine, tool0; !descer
    ! RESET DO7;
    
!!!!!!!!!!!!!!!!!!

    MoveJ Offs(GRC, 0, 0, C), v500, fine, tool0;
    
    FOR i FROM 0 TO 2 DO ! latas G en y
        gy:=-(100*i);
        FOR i FROM 0 TO 2 DO ! latas G en x
            gx:=(100*i);
            MoveJ offs(GRC, 0, 0, C), v500, fine, tool0;!ir a GRC
            MoveJ offs(GRC, 0, 0, U), v500, fine, tool0;
            SET DO7;!tomar     set do7;
            WaitTime T;
            MoveJ offs(GRC, 0, 0, C), v500, fine, tool0;! up
            MoveJ offs(GRD, gx, gy, C), v500, fine, tool0; !Movej a Zgrd  dx * i
            MoveJ offs(GRD, gx, gy, U), v500, fine, tool0; ! down
            RESET DO7;!soltar
            WaitTime T;
            MoveJ offs(GRD, gx, gy, C), v500, fine, tool0; ! up
        ENDFOR
    ENDFOR

    FOR i FROM 0 TO 2 DO ! latas M en y
        my:=-(100*i);
        FOR i FROM 0 TO 1 DO ! latas M en x
            mx:=(100*i);
            MoveJ offs(MEC, 0, 0, C), v500, fine, tool0;!ir a MEC
            MoveJ offs(MEC, 0, 0, U), v500, fine, tool0;
            SET DO7;!tomar     set do7;
            WaitTime T;
            MoveJ offs(MEC, 0, 0, C), v500, fine, tool0;! up
            MoveJ offs(MED, mx, my, C), v500, fine, tool0; !Movej a ZMED  dx * i
            MoveJ offs(MED, mx, my, U), v500, fine, tool0; ! down
            RESET DO7;!soltar
            WaitTime T;
            MoveJ offs(MED, mx, my, C), v500, fine, tool0; ! up
        ENDFOR
    ENDFOR

    FOR i FROM 0 TO 1 DO ! latas P en y
        py:=-(100*i);
        FOR i FROM 0 TO 1 DO ! latas P en x
            px:=(100*i);
            MoveJ offs(PEC, 0, 0, C), v500, fine, tool0;!ir a PEC
            MoveJ offs(PEC, 0, 0, U), v500, fine, tool0;
            SET DO7;!tomar     set do7;
            WaitTime T;
            MoveJ offs(PEC, 0, 0, C), v500, fine, tool0;! up
            MoveJ offs(PED, px, py, C), v500, fine, tool0; !Movej a ZPED  dx * i
            MoveJ offs(PED, px, py, U), v500, fine, tool0; ! down
            RESET DO7;!soltar
            WaitTime T;
            MoveJ offs(PED, px, py, C), v500, fine, tool0; ! up
        ENDFOR
    ENDFOR
    
ENDPROC

ENDMODULE

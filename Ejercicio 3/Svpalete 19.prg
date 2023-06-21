MODULE palet
  CONST robtarget Pcar:=[[835.7,-536.99,719.4],[0.004059,0.380191,0.924819,0.01217],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget Pdesc:=[[831.71,532.82,715.54],[0.004037,0.376622,0.926278,0.0122],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

  VAR ROBTARGET D1; !Pontos de descarga
  VAR ROBTARGET D2;
  VAR ROBTARGET D3; !para el for, el que esta solo con un offs z
  
  VAR NUM d1y;
  VAR NUM d1x;
  VAR NUM d2y;
  VAR NUM d3x;

  VAR NUM U; !diferencia en z para RelTool
  VAR NUM T; !time


  ! ponto de carga e descarga est�o definidos em rela��o CAIXA B
  ! aluno: Sebastian Varela
  ! Exercicio 03: Palete_P19
   
PROC main()
   
   D1:= RelTool(Pdesc, 0, 0, 0 \ Rz:=90);
   D2:= Offs(Pdesc, 137.5, 0, 100);     !x = 300/2-25/2 z = A 
   D3:= Offs (D1, 0, -200, 200);  !y = -(300/2+25+25), z = 2A=200 
   
  !  d1y := -115; !-(90+25)
  !  d1x := 83.3; !50+33.3
  !  d2y := -65.5; !50+15.5
  !  d3x := 83.3; !50+33.3

  U := 150;
  T := 0.5;

  Set DO7;     !abrir garra
  WaitTime T;
  Reset DO7;

  !  Set DO8; WaitTime T; --> esto es un cerrar garra, desp reset antes de abrir

  FOR i FROM 0 TO 3 DO ! CAMADA 1 cajas en x
    d1x := (83.3*i); !50+33.3
    FOR i FROM 0 TO 2 DO ! cajas en y
        
      d1y := -(115*i); !-(90+25)

      MoveL offs(PC, 0, 0, U), v7000, fine, tool0; !ir a punto de carga
      MoveL PC, v1000, fine, tool0; !descer
        Set DO8;  WaitTime T; !cerrar garra
      MoveL offs(PC, 0, 0, U), v1000, fine, tool0; ! Subir
      
      MoveL offs(D1, d1x, d1y, U), v7000, fine, tool0; ! ir a destino
      MoveL offs(D1, d1x, d1y, 0), v1000, fine, tool0; !descer
        Reset D08;   Set DO7;   WaitTime T;   Reset DO7; !abrir garra
      MoveL offs(D1, d1x, d1y, U), v1000, fine, tool0; !subir
    ENDFOR
  ENDFOR

  FOR i FROM 0 TO 4 DO ! CAMADA 2 cajas en -y
    d2y := -(65.5*i); !50+15.5

      MoveL offs(PC, 0, 0, U), v7000, fine, tool0; !ir a punto de carga
      MoveL PC, v1000, fine, tool0; !descer
        Set DO8;  WaitTime T; !cerrar garra
      MoveL offs(PC, 0, 0, U), v1000, fine, tool0; ! Subir
      
      MoveL offs(D2, 0, d2y, U), v7000, fine, tool0; ! ir a destino
      MoveL offs(D2, 0, d2y, 0), v1000, fine, tool0; !descer
        Reset D08;   Set DO7;   WaitTime T;   Reset DO7; !abrir garra
      MoveL offs(D2, 0, d2y, U), v1000, fine, tool0; !subir
  ENDFOR

  !CAMADA 3 - A PARTICULAR
    MoveL offs(PC, 0, 0, U), v7000, fine, tool0; !ir a punto de carga
    MoveL PC, v1000, fine, tool0; !descer
      Set DO8;  WaitTime T; !cerrar garra
    MoveL offs(PC, 0, 0, U), v1000, fine, tool0; ! Subir

    MoveL offs(D2, 0, 0, 250), v7000, fine, tool0; ! ir a destino 100+U
    MoveL offs(D2, 0, 0, 100), v1000, fine, tool0; !descer
    Reset D08;   Set DO7;   WaitTime T;   Reset DO7; !abrir garra
    MoveL offs(D2, 0, 0, 250), v1000, fine, tool0; !subir

  FOR i FROM 0 TO 3 DO !CAMADA 3 cajas en x
    d3x := (83.3*i); !50+33.3

      MoveL offs(PC, 0, 0, U), v7000, fine, tool0; !ir a punto de carga
      MoveL PC, v1000, fine, tool0; !descer
        Set DO8;  WaitTime T; !cerrar garra
      MoveL offs(PC, 0, 0, U), v1000, fine, tool0; ! Subir
      
      MoveL offs(D3, d3x, 0, U), v7000, fine, tool0; ! ir a destino
      MoveL offs(D3, d3x, 0, 0), v1000, fine, tool0; !descer
        Reset D08;   Set DO7;   WaitTime T;   Reset DO7; !abrir garra
      MoveL offs(D3, d3x, 0, U), v1000, fine, tool0; !subir
  ENDFOR

  MoveL offs(PC, 0, 0, U), v7000, fine, tool0; !ir a punto de carga

ENDPROC

ENDMODULE
    
    
    

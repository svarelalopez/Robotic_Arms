%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE desenho
       CONST robtarget P1:=[[825.15,-239.92,742.49],[0.023968,-0.71417,-0.699562,0.000697],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];   !ponto de origen

  !ponto refencia inicio desenhos

       VAR ROBTARGET P2;       !aca so declarar
       VAR ROBTARGET P3;
       VAR ROBTARGET P4;
       VAR ROBTARGET P1U; 
       VAR ROBTARGET P2U;      
       VAR ROBTARGET P3U;
       VAR ROBTARGET P4U;
       VAR NUM CONTROLE;


  PROC main()

       P2:=Offs (P1,18.5,200,0);        !aca atribuior valores
       P3:=Offs (P1,158.5,60,0);
       P4:=Offs (P1,158.5,200,0);

       P1U:=Offs (P1,0,0,5);
       P2U:=Offs (P1,18.5,200,5);        !aca atribuior valores
       P3U:=Offs (P1,158.5,60,5);
       P4U:=Offs (P1,158.5,200,5);


     TPWrite "1 - Barril";
     TPWrite "2 - Jarra";
     TPWrite "3 - Copa";
     TPWrite "4 - Garrafa";   !só mensagems
     
      TPRead CONTROLE, " ";  !esto se queda esperando que sepresione
     

     TEST CONTROLE
      CASE 1:
        !!A
          MoveJ P1U,v7000,FINE,tool0;   !mover a P1
          MoveL offs(P1U, 11.574, 32.141, 0),v7000,FINE,tool0;  !Porg
          MoveL offs(P1, 11.574, 32.141, 0),v7000,FINE,tool0;  !descer

          MoveL offs(P1, 11.574, 41.569, 0),v7000,FINE,tool0; ! Cuadr 1A
          MoveL offs(P1, 24.694, 38.165, 0),v7000,FINE,tool0;
          MoveL offs(P1, 24.694, 24.852, 0),v7000,FINE,tool0;
          MoveC offs(P1, 18.134, 28.15, 0), offs(P1, 11.574, 32.141, 0), v7000,FINE,tool0;

          MoveL offs(P1U, 11.574, 32.141, 0),v7000,FINE,tool0;  !Subir
          MoveL offs(P1U, 11.574, 45.832, 0),v7000,FINE,tool0;  ! ir a 2A
          MoveL offs(P1, 11.574, 45.832, 0),v7000,FINE,tool0;  !descer

          MoveL offs(P1, 11.574, 56.4, 0),v7000,FINE,tool0; ! Cuadr 2A
          MoveL offs(P1, 24.694, 56.4, 0),v7000,FINE,tool0;
          MoveL offs(P1, 24.694, 42.398, 0),v7000,FINE,tool0;
          MoveL offs(P1, 11.574, 45.832, 0), v7000,FINE,tool0;

          MoveL offs(P1U,11.574, 45.832, 0),v7000,FINE,tool0;  !Subir
          MoveL offs(P1U,11.574, 60.601, 0),v7000,FINE,tool0;  ! ir a 3A
          MoveL offs(P1, 11.574, 60.601, 0),v7000,FINE,tool0;  !descer

          MoveL offs(P1, 11.574, 71.17, 0),v7000,FINE,tool0; ! Cuadr 3A
          MoveL offs(P1, 24.694, 74.689, 0),v7000,FINE,tool0;
          MoveL offs(P1, 24.694, 60.601, 0),v7000,FINE,tool0;
          MoveL offs(P1, 11.574, 60.601, 0), v7000,FINE,tool0;

          MoveL offs(P1U, 11.574, 60.601, 0),v7000,FINE,tool0;  !Subir
          MoveL offs(P1U, 11.574, 75.433, 0),v7000,FINE,tool0;  ! ir a 4A
          MoveL offs(P1, 11.574, 75.433, 0),v7000,FINE,tool0;  !descer

          MoveL offs(P1, 11.574, 84.86, 0),v7000,FINE,tool0; ! Cuadr 4A
          MoveC offs(P1, 18.329, 88.946, 0), offs(P1, 11.574, 24.694, 0), v7000,FINE,tool0;
          MoveL offs(P1, 24.694, 78.922, 0),v7000,FINE,tool0;
          MoveL offs(P1, 11.574, 75.433, 0) , v7000,FINE,tool0;
        !!B

          MoveL offs(P1U, 11.574, 75.433, 0),v7000,FINE,tool0;  !Subir
          MoveL offs(P1U,28.928, 23.054, 0),v7000,FINE,tool0;  ! ir a 1B
          MoveL offs(P1, 28.928, 23.054, 0),v7000,FINE,tool0;  !descer

          MoveL offs(P1, 28.928, 37.291, 0),v7000,FINE,tool0; ! Cuadr 1B
          MoveC offs(P1, 59.951, 34.063, 0), offs(P1, 96.03 , 37.217 , 0), v7000,FINE,tool0;
          MoveL offs(P1, 96.03 , 22.929, 0),v7000,FINE,tool0;
          MoveC offs(P1, 59.951, 16.629, 0), offs(P1, 28.928 , 23.054 , 0), v7000,FINE,tool0;

          MoveL offs(P1U, 28.928, 23.054, 0),v7000,FINE,tool0;  !Subir
          MoveL offs(P1U, 28.928, 41.517, 0),v7000,FINE,tool0;  ! ir a 2B
          MoveL offs(P1, 28.928, 41.517, 0),v7000,FINE,tool0;  !descer

          MoveL offs(P1, 28.928, 56.4, 0),v7000,FINE,tool0; ! Cuadr 2B
          MoveL offs(P1, 96.03, 56.4, 0), v7000,FINE,tool0;
          MoveL offs(P1, 96.03, 41.443, 0),v7000,FINE,tool0;
          MoveC offs(P1, 59.951, 38.266, 0), offs(P1, 28.928 , 41.517  , 0), v7000,FINE,tool0;

          MoveL offs(P1U, 28.928, 41.517, 0),v7000,FINE,tool0;  !Subir
          MoveL offs(P1U,28.928, 60.601, 0),v7000,FINE,tool0;  ! ir a 3B
          MoveL offs(P1, 28.928, 60.601, 0),v7000,FINE,tool0;  !descer

          MoveL offs(P1, 28.928, 75.559, 0),v7000,FINE,tool0; ! Cuadr 3B
          MoveC offs(P1, 59.951, 78.756, 0), offs(P1, 96.03  , 75.485, 0), v7000,FINE,tool0;
          MoveL offs(P1, 96.03, 60.601, 0),v7000,FINE,tool0;
          MoveL offs(P1, 28.928, 60.601, 0), v7000,FINE,tool0;

          MoveL offs(P1U, 28.928, 60.601, 0),v7000,FINE,tool0;  !Subir
          MoveL offs(P1U,28.928, 79.785, 0),v7000,FINE,tool0;  ! ir a 4B
          MoveL offs(P1, 28.928, 79.785, 0),v7000,FINE,tool0;  !descer

          MoveL offs(P1, 28.928, 94.073, 0),v7000,FINE,tool0; ! Cuadr 4B
          MoveC offs(P1, 59.951, 100.419, 0), offs(P1, 96.03  , 93.947, 0), v7000,FINE,tool0;
          MoveL offs(P1, 96.03, 79.711, 0),v7000,FINE,tool0;
          MoveC offs(P1, 59.951, 82.954, 0),offs(P1, 28.928, 79.785, 0), v7000,FINE,tool0;

        !!C

          MoveL offs(P1U, 28.928, 79.785, 0),v7000,FINE,tool0;  !Subir
          MoveL offs(P1U, 100.264, 24.704, 0),v7000,FINE,tool0;  ! ir a 1C
          MoveL offs(P1, 100.264, 24.704, 0),v7000,FINE,tool0;  !descer

          MoveL offs(P1, 100.264, 38.08, 0),v7000,FINE,tool0; ! Cuadr 1C
          MoveL offs(P1, 113.774, 41.569, 0), v7000,FINE,tool0;
          MoveL offs(P1, 113.774, 32.141, 0),v7000,FINE,tool0;
          MoveC offs(P1, 107.019, 28.056, 0),offs(P1, 100.264, 24.704 , 0), v7000,FINE,tool0;

          MoveL offs(P1U, 100.264, 24.704, 0),v7000,FINE,tool0;  !Subir
          MoveL offs(P1U, 100.264, 42.313, 0),v7000,FINE,tool0;  ! ir a 2C
          MoveL offs(P1, 100.264, 42.313, 0),v7000,FINE,tool0;  !descer

          MoveL offs(P1, 100.264, 56.4, 0), v7000,FINE,tool0; ! Cuadr 2C
          MoveL offs(P1, 113.774, 56.4, 0), v7000,FINE,tool0;
          MoveL offs(P1, 113.774, 45.832, 0), v7000,FINE,tool0;
          MoveL offs(P1, 100.264, 42.313, 0), v7000,FINE,tool0;

          MoveL offs(P1U, 100.264, 42.313, 0),v7000,FINE,tool0;  !Subir
          MoveL offs(P1U, 100.264, 60.601, 0),v7000,FINE,tool0;  ! ir a 3C
          MoveL offs(P1, 100.264, 60.601 , 0),v7000,FINE,tool0;  !descer

          MoveL offs(P1, 100.264, 74.603, 0), v7000,FINE,tool0; ! Cuadr 3C
          MoveL offs(P1, 113.774, 71.17, 0), v7000,FINE,tool0;
          MoveL offs(P1, 113.774, 60.601, 0), v7000,FINE,tool0;
          MoveL offs(P1, 100.264, 60.601, 0), v7000,FINE,tool0;

          MoveL offs(P1U, 100.264, 60.601, 0),v7000,FINE,tool0;  !Subir
          MoveL offs(P1U, 100.264, 78.836, 0),v7000,FINE,tool0;  ! ir a 4C
          MoveL offs(P1, 100.264, 78.836 , 0),v7000,FINE,tool0;  !descer

          MoveL offs(P1, 100.264, 92.149, 0), v7000,FINE,tool0; ! Cuadr 4C
          MoveC offs(P1, 107.019, 88.852, 0), offs(P1, 113.774, 84.86, 0), v7000,FINE,tool0;
          MoveL offs(P1, 113.774, 75.433, 0), v7000,FINE,tool0;
          MoveL offs(P1, 100.264, 78.836, 0), v7000,FINE,tool0;


          MoveL P1U,v7000,FINE,tool0;   !TERMINAR


      CASE 2:

          MoveJ P2U,v7000,FINE,tool0;   !mover a P2
          MoveL offs(P2U,10.733, 43.082 ,0),v7000,FINE,tool0;  !Porg
          MoveL offs(P2, 10.733 ,43.082 ,0),v7000,FINE,tool0;  !descer

          MoveL offs(P2, 10.733, 77.537, 0),v7000,FINE,tool0; !RECTA
          MoveC offs(P2, 40.727,71.773, 0), offs(P2,68.919, 88.706, 0), v7000,FINE,tool0;
          MoveL offs(P2,78.5 ,100.595, 0), v7000,FINE,tool0; 

          MoveC offs(P2, 92.608, 107.441 ,0), offs(P2,104.949, 100.595,0), v7000,FINE,tool0; 
          MoveC offs(P2, 112.513, 59.253, 0), offs(P2,104.949, 20.024 ,0), v7000,FINE,tool0; !curva de abajo
          MoveC offs(P2, 92.608, 13.179, 0), offs(P2,79.008 , 20.612 ,0), v7000,FINE,tool0;
          MoveL Offs(P2, 68.919, 31.913, 0), v7000,FINE,tool0;
          MoveC offs(P2, 40.727, 48.847, 0), offs(P2, 10.733, 43.082, 0), v7000,FINE,tool0; !Porg

          MoveL offs(P2U, 10.733, 43.082, 0),v7000,FINE,tool0;   !Subir
          MoveL offs(P2U, 94.669, 13.392, 0),v7000,FINE,tool0;  !Ir a curva 2
          MoveL offs(P2, 94.669, 13.392, 0),v7000,FINE,tool0;   !descer

          MoveC offs(92.067, 41.509, 0), offs(P2, 95.13, 63.936, 0),v7000,FINE,tool0; 
          MoveC offs(96.391, 84.743, 0), offs(P2, 93.693, 107.313, 0),v7000,FINE,tool0; 
          MoveL offs(P2U, 93.693, 107.313, 0),v7000,FINE,tool0;   !Subir

          MoveL P1U,v7000,FINE,tool0;   !TERMINAR


      CASE 3:

          MoveJ P3U,v7000,FINE,tool0;   !mover a P2
          MoveL offs(P3U, 10.892, 26.764 ,0),v7000,FINE,tool0;  !Porg
          MoveL offs(P3, 10.892, 26.764 ,0),v7000,FINE,tool0;  !descer

          MoveL offs(P3, 43.318, 26.764 ,0),v7000,FINE,tool0; !copa
          MoveC offs(P3, 76.712, 60, 0), offs(P3,43.318 ,93.236,0),v7000,FINE,tool0;
          MoveL offs(P3, 10.892 , 93.236 ,0),v7000,FINE,tool0; 
          MoveL offs(P3U, 10.892 , 93.236 ,0),v7000,FINE,tool0; !subir

          MoveL offs(P3U, 27.225, 93.236, 0),v7000,FINE,tool0;  !ir
          MoveL offs(P3, 27.225, 93.236, 0),v7000,FINE,tool0;  !descer
          MoveL offs(P3, 27.225, 26.764, 0),v7000,FINE,tool0; ! fazer agua
          MoveL offs(P3U, 27.225, 26.764, 0),v7000,FINE,tool0; !subir

          MoveL offs(P3U, 76.712, 60, 0),v7000,FINE,tool0; !ir
          MoveL offs(P3, 76.712, 60, 0),v7000,FINE,tool0; !descer
          MoveL offs(P3, 115.134, 60, 0),v7000,FINE,tool0; !fazer tronco
          MoveL offs(P3U, 115.134, 60 ,0),v7000,FINE,tool0; !subir

          MoveL offs(P3U, 115.134, 32.709, 0),v7000,FINE,tool0; !ir
          MoveL offs(P3, 115.134, 32.709, 0),v7000,FINE,tool0; !descer
          MoveL offs(P3, 115.134, 87.291, 0),v7000,FINE,tool0; !fazer tronco
          MoveL offs(P3U, 115.134, 87.291, 0),v7000,FINE,tool0; !subir

          MoveL P1U,v7000,FINE,tool0;   !TERMINAR   


      CASE 4:
        
          MoveJ P4U,v7000,FINE,tool0;   !mover a P4
          MoveL offs(P4U, 8.707, 50.487, 0),v7000,FINE,tool0;  !Porg
          MoveL offs(P4, 8.707, 50.487, 0),v7000,FINE,tool0;  !descer

          MoveL offs(P4,17.669 ,50.487 ,0),v7000,FINE,tool0; 
          MoveL offs(P4,17.669 ,53.301 ,0),v7000,FINE,tool0;  
          MoveL offs(P4,36.854  ,53.489 ,0),v7000,FINE,tool0;  !tuboL

          MoveC offs(P4, 43.939, 50.336, 0), offs(P4, 46.809, 45.828, 0),v7000,FINE,tool0; 
          MoveC offs(P4, 54.087 , 36.285, 0), offs(P4, 65.316, 33.283, 0),v7000,FINE,tool0;  !curvas medioL

          MoveL offs(P4, 107.56, 32.765 ,0),v7000,FINE,tool0;  !Recta cuerpo
          MoveC offs(P4, 114.315, 35.265, 0), offs(P4, 62.644, 43.037, 0),v7000,FINE,tool0; 
          MoveL offs(P4, 62.644, 83.977, 0),v7000,FINE,tool0;  !Recta base
          MoveC offs(P4, 114.315, 91.75, 0), offs(P4, 107.559, 94.249, 0),v7000,FINE,tool0; 
          MoveL offs(P4, 65.316, 93.731,0),v7000,FINE,tool0;  !Recta cuerpo

          MoveC offs(P4, 54.087, 90.729, 0), offs(P4, 46.808, 81.186, 0),v7000,FINE,tool0;   
          MoveC offs(P4, 43.939, 76.678, 0), offs(P4, 36.854, 73.525, 0),v7000,FINE,tool0;

          MoveL offs(P4, 17.669, 73.713, 0),v7000,FINE,tool0;  !tuboD 
          MoveL offs(P4, 17.669, 76.527, 0),v7000,FINE,tool0; 
          MoveL offs(P4, 8.707, 76.527, 0),v7000,FINE,tool0; 
          MoveL offs(P4, 8.707, 50.487, 0),v7000,FINE,tool0;
          MoveL offs(P4U, 8.707, 50.487, 0),v7000,FINE,tool0; !subir

          MoveL offs(P4U, 64.776, 44.557, 0),v7000,FINE,tool0; !IR A CUADRADO
          MoveL offs(P4, 64.776, 44.557, 0),v7000,FINE,tool0;  !descer

          MoveL offs(P4, 64.776, 82.942, 0),v7000,FINE,tool0; !hacer cuadrado
          MoveL offs(P4, 98.522, 82.942, 0),v7000,FINE,tool0;
          MoveL offs(P4, 98.522, 44.557, 0),v7000,FINE,tool0;
          MoveL offs(P4, 64.776, 44.557, 0),v7000,FINE,tool0;

          MoveL offs(P4U, 64.776, 44.557, 0),v7000,FINE,tool0; !Subir


          MoveL P1U,v7000,FINE,tool0; !TERMINAR


        DEFAULT:

     ENDTEST

   ENDPROC

ENDMODULE


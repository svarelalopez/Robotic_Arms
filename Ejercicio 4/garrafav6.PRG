%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE Garrafa


CONST ROBTARGET Pgcheia:=[[792.19,-516.93,611.48],[0.653286,0.267912,0.667879,0.235328],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST ROBTARGET Pgvazia:=[[745.84,505.67,611.47],[0.653276,0.267939,0.667873,0.235342],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST ROBTARGET Pc1:=[[843.48,12.96,611.5],[0.653295,0.267937,0.667852,0.235349],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

CONST SPEEDDATA vagua:= [530, 120, 100, 100];

CONST NUM Del:= 150; !Distância entre os copos em x e y
VAR ROBTARGET Pc1_des; !Copo 1
VAR ROBTARGET Pc2_des; !Copo 2
VAR ROBTARGET Pc3_des; !Copo 3
VAR ROBTARGET Pc4_des; !Copo 3

CONST NUM dis_garrafa:= 110; !Distância da garrafa do copo

CONST NUM T:= 0.5; !tempo da garra
CONST NUM T2:= 4; !tempo de descarga

CONST NUM U:= 200; !altura de movimento
CONST NUM U2:= 20; !altura de descarga

CONST NUM ang_1:= 81; !-72°  !angulo de inclinacao da garrafa
CONST NUM ang_2:= -87.3; !-79°
CONST NUM ang_3:= -89; !total com pc4_des chegar aos -95.7° ==>-15°

  PROC main()
  
    Pc1_des:= Offs(Pc1, 0, -dis_garrafa, U2);
    Pc2_des:= Offs(Pc1, Del, -Del-dis_garrafa, U2);
    Pc3_des:= Offs(Pc1, -Del, Del+dis_garrafa+15, U2+10);

    Reset DO7;
    Reset DO8;
    Set DO7;     !abrir garra
    WaitTime T;
    Reset DO7;

    MoveJ Offs(Pgcheia, 0, 0, U), vagua, z5,tool0;  !ir a inicio
    MoveL Pgcheia, vagua, fine, tool0; 

    Set DO8; !fechar a garra
    WaitTime T;
    Reset DO8;

    MoveJ Offs(Pgcheia, 0, 0, U), vagua, z5,tool0;
    
    descarga Pc3_des, ang_1;  !descarga no copo 2
    descarga Pc1_des, ang_2;  !descarga no copo 1
    descarga2 Pc2_des, ang_3;  !descarga no copo 3
    
    
 !voltar

    MoveJ Offs(Pgvazia, 0, 0, U), vagua, z5,tool0;
    MoveL Pgvazia, vagua, fine, tool0;
    Set DO7; !abrir a garra
    WaitTime T;
    Reset DO7;
    
 !subir
    MoveJ Offs(Pgvazia, 0, 0, U), vagua, z5,tool0;
    
    
    
  ENDPROC
  
  PROC descarga(ROBTARGET P_descarga, NUM ang_inclinacao)
  
    MoveJ Offs(P_descarga, 0, 0, U), vagua, z5, tool0;
    MoveL P_descarga, vagua, fine, tool0;
    MoveJ RelTool(P_descarga, 0, 0, 0 \ Rz:= ang_inclinacao), vagua, fine, tool0;
    WaitTime T2;
    MoveJ P_descarga, vagua, fine, tool0;
    MoveJ Offs(P_descarga, 0, 0, U), vagua, z5, tool0;

ENDPROC

  PROC descarga2(ROBTARGET P_descarga, NUM ang_inclinacao)

    Pc4_des := RelTool(P_descarga, 0, 0, 0 \ Rz:= ang_inclinacao);

    MoveJ Offs(P_descarga, 0, 0, U), vagua, z5, tool0;    !subir
    MoveJ P_descarga, vagua, z5, tool0;               !descer
    MoveJ Pc4_des, vagua, fine, tool0;            !inclinar
    
    WaitTime T2;

    MoveJ RelTool(Offs(Pc4_des, 0, 5, 10), 0, 0, 0 \ Rz:= -10), vagua, fine, tool0;  !descer e inclinar
    WaitTime T2;
    
    
    MoveJ P_descarga, vagua, fine, tool0;   !voltar a centrada
    MoveJ Offs(P_descarga, 0, 0, U), vagua, z5, tool0;  !subir

ENDPROC

ENDMODULE


%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE Garrafa


CONST ROBTARGET Pgcheia:=[[792.19,-516.93,631.48],[0.653286,0.267912,0.667879,0.235328],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST ROBTARGET Pgvazia:=[[745.84,505.67,631.47],[0.653276,0.267939,0.667873,0.235342],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST ROBTARGET Pc1:=[[843.48,12.96,631.5],[0.653295,0.267937,0.667852,0.235349],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

CONST SPEEDDATA vagua:= [530, 120, 100, 100];

CONST NUM Del:= 150; !distância entre os copos em x e y
VAR ROBTARGET Pc1_des;
VAR ROBTARGET Pc2_des;
VAR ROBTARGET Pc3_des;

CONST NUM off_garrafa1:= 110; !Distância de descarga da garrafa do copo
CONST NUM off_garrafa2:= 110;
CONST NUM off_garrafa3:= 110;

CONST NUM tempo_garra:= 0.5; !tempo da garra
CONST NUM tempo_descarga_1:= 2; !tempo de descarga no copo
CONST NUM tempo_descarga_2:= 2;
CONST NUM tempo_descarga_3:= 2;
CONST NUM tempo_descarga_4:= 2;

CONST NUM z_movimento:= 200; !altura de movimento
CONST NUM z_descarga:= 20; !altura de descarga

CONST NUM ang_1:= -86.3; !68  !angulo de inclinação da garrafa
CONST NUM ang_2:= 80;
CONST NUM ang_22:= 30;
CONST NUM ang_3:= -78.2;


CONST NUM const1:= 0;
CONST NUM const2:= -10;
CONST NUM const3:= -10;


  PROC main()
  
    Pc1_des:= Offs(Pc1, 0, -off_garrafa1, z_descarga);
    Pc2_des:= Offs(Pc1, Del, -Del+off_garrafa2, z_descarga);
    Pc3_des:= Offs(Pc1, -Del, Del-off_garrafa3, z_descarga);

    Reset DO7;
    Reset DO8;
    Set DO7;     !abrir garra
    WaitTime tempo_garra;
    Reset DO7;

    MoveJ Offs(Pgcheia, 0, 0, z_movimento), vagua, z5,tool0;
    MoveL Pgcheia, vagua, fine, tool0;

    Set DO8; !fechar a garra
    WaitTime tempo_garra;
    Reset DO8;

    MoveJ Offs(Pgcheia, 0, 0, z_movimento), vagua, z5,tool0;
    
    descarga Pc3_des, ang_3, tempo_descarga_3;  !descarga no copo 2
    descarga Pc1_des, ang_1, tempo_descarga_1;  !descarga no copo 1
    copo2 Pc2_des, ang_2, ang_22, tempo_descarga_2, tempo_descarga_4;  !descarga no copo 3
    
    
    MoveJ Offs(Pgvazia, 0, 0, z_movimento), vagua, z5,tool0;
    MoveL Pgvazia, vagua, fine, tool0;
    Set DO7; !abrir a garra
    WaitTime tempo_garra;
    Reset DO7;
    
    
  ENDPROC
  
  PROC copo2(ROBTARGET P_descarga, NUM ang_inclinacao_1, NUM ang_inclinacao_2, NUM tempo_descarga1, NUM tempo_descarga2)
  
    VAR ROBTARGET P_auxiliar1;
    VAR ROBTARGET P_auxiliar2;

    P_auxiliar1:= RelTool(P_descarga, 0, 0, 0 \ Rz:= ang_inclinacao_1);
    P_auxiliar2 := RelTool(Offs(P_auxiliar1, const1, const2, const3), 0, 0, 0 \ Rz:= ang_inclinacao_2);
    
    MoveJ Offs(P_descarga, 0, 0, z_movimento), vagua, z5, tool0;
    MoveL P_descarga, vagua, fine, tool0;
    
    MoveJ P_auxiliar1, vagua, z0, tool0;
    WaitTime tempo_descarga1;
    MoveJ P_auxiliar2, vagua, z0, tool0;
    WaitTime tempo_descarga2;

    MoveJ P_descarga, vagua, fine, tool0;
    MoveJ Offs(P_descarga, 0, 0, z_movimento), vagua, z5, tool0;
  
  
  ENDPROC
  
  
  PROC descarga(ROBTARGET P_descarga, NUM ang_inclinacao, NUM tempo_descarga)
  
    MoveJ Offs(P_descarga, 0, 0, z_movimento), vagua, z5, tool0;
    MoveL P_descarga, vagua, fine, tool0;
    MoveJ RelTool(P_descarga, 0, 0, 0 \ Rz:= ang_inclinacao), vagua, fine, tool0;
    WaitTime tempo_descarga;
    MoveJ P_descarga, vagua, fine, tool0;
    MoveJ Offs(P_descarga, 0, 0, z_movimento), vagua, z5, tool0;

  ENDPROC

ENDMODULE


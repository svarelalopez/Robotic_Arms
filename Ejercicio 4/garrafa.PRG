%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE Garrafa


CONST robtarget Pgcheia:=[[792.19,-516.93,631.48],[0.653286,0.267912,0.667879,0.235328],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget Pgvazia:=[[745.84,505.67,631.47],[0.653276,0.267939,0.667873,0.235342],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST ROBTARGET Pc1:=[[843.48,12.96,631.5],[0.653295,0.267937,0.667852,0.235349],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

CONST SPEEDDATA vagua:= [530, 120, 100, 100];

CONST NUM Del:= 250; !distância entre os copos em x e y
VAR ROBTARGET Pc1_des;
VAR ROBTARGET Pc2_des;
VAR ROBTARGET Pc3_des;

CONST NUM dis_garrrafa:= 90; !Distância da garrafa do copo

CONST NUM T:= 1; !tempo da garra
CONST NUM T2:= 2; !tempo de descarga

CONST NUM U:= 200; !altura de movimento
CONST NUM U2:= 20; !altura de descarga

CONST NUM ang_1:= 0;   !angulo de inclinação da garrafa
CONST NUM ang_2:= 0;
CONST NUM ang_3:= 0;

  PROC main()
  
  Pc2_des:= Offs(Pc1, 0, -dis_garrafa, U2);
  Pc2_des:= Offs(Pc1, Del, -Del-dis_garrafa, U2);
  Pc3_des:= Offs(Pc1, -Del, Del-dis_garrafa, U2);
  
    Reset DO7;
    Reset DO8;
    Set DO7;     !abrir garra
     WaitTime T;
     Reset DO7;
     
    MoveJ Offs(Pgcheia, 0, 0, U), vagua, z5,tool0;
    MoveL Pgcheia, vagua, fine, tool0;
    
    Set DO8;
    WaitTime T;
    Reset DO8;
    
     MoveJ Offs(Pgcheia, 0, 0, U), vagua, z5,tool0;
     
     MoveJ Offs(Pc2_des, 0, 0, U), vagua, z5, tool0;
     MoveL Pc2_desc, vagua, fine, tool0;
     MoveJ RelTool(Pc2_desc, 0, 0, 0 \ Rz:= ang_2);
     WaitTime T2;
     

     
    
    
    


    ! MoveJ Pgcheia,v500,fine,tool0;
    ! MoveJ Pgvazia,v500,fine,tool0;
    ! MoveJ  Pc1,v500,fine,tool0;
    
    
  ENDPROC
  
  
ENDMODULE


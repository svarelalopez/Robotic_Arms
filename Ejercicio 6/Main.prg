Function main
	
	'Programador - Sebastián Varela, Vinicius Ribeiro
	'Exercicio 07 - Pallet
	
	' de ai x = -y
	' de ai y = -x
						'ERROR X de ai=-y Y de ai=x
	' go movimiento lento
	' move movimiento normal
	' jump para saltos sin escribir
	' arc para arcos
	
Integer i
Integer T
			T = 0.4
	
Pallet 1, ponto1, ponto2, ponto3, 2, 3
Pallet 2, ponto11, ponto12, ponto13, 3, 2

For i = 1 To 6
	
		Jump Pallet(1, i) 'jump pallet1
		On 0 'ligar
		Wait T
		Jump Pallet(2, i) 'jump pallet2
		Off 0 'desligar
		Wait T
		
Next i

Fend


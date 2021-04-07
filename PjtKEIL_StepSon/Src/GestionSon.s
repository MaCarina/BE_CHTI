	PRESERVE8
	THUMB   
		
	EXPORT callbackSon
	INCLUDE Driver/DriverJeuLaser.inc

; ====================== zone de réservation de données,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly


;Section RAM (read write):
	area    maram,data,readwrite
SortieSon dcw 0
Index dcd 0
	export SortieSon

	
; ===============================================================================================
	


		
;Section ROM code (read only) :		
	area    moncode,code,readonly
; écrire le code ici		

callbackSon proc
		push {r4-r11,lr}
	
		ldr r3,=Index ;indice
		ldr r12,[r3]
		;ldr r2,=Son ;r2=ad Son
		;ldrsh r1,[r2] ;r1 = Son pour entier signé 16 bits
		;add r1,r1,r1; r1=N+P ==> positif
		;sub r1,r1,#1 ; r1=r1-1
		;udiv r1,r1,#92 ;r1 = r1/92
		ldrsh r2,[r2,r12,lsl#1] ;r2=ad r1+2/ Son + (index << 1) ldr r2,[r2,r1,lsl#1]
		;ldr r6,[r6,#32768]
		add r2,#32768
		ldr r7,[r7,#92]
		udiv r2,r7
		ldr r4,=SortieSon
		str r2,[r4] ; SortieSon = r2
		ldr r5,[r4]
		add r12,r12,#1 ;on incrémente index
		mov r0,#1 ;on met 1 dans r0 car c'est l'arg des fonctions
		cmp r1,#1
		beq vrai ;si FlagCligno==1
	
		;si faux
		mov r1,#1 ;r1=1
		str r1,[r2]
		bl GPIOB_Clear
		b fin
	
vrai
		mov r1,#0 ;r1=0
		str r1,[r2]
		bl GPIOB_Set
	
fin
		;mov r0,r1
		pop {r4-r11,lr}
		bx lr
		endp

		
	END	
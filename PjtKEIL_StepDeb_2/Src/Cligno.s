	PRESERVE8
	THUMB   
	
	EXPORT timer_callback
	INCLUDE Driver/DriverJeuLaser.inc

; ====================== zone de réservation de données,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly


;Section RAM (read write):
	area    maram,data,readwrite
FlagCligno dcd 0
	export FlagCligno
; ===============================================================================================
	
;Section ROM code (read only) :		
	area    moncode,code,readonly
; écrire le code ici		

;void timer_callback(void)
;{if (FlagCligno==1){
		;FlagCligno=0;
		;GPIOB_Set(1);}
	;else
	;{	FlagCligno=1;
		;GPIOB_Clear(1);}}

timer_callback proc
		push {r4-r11,lr}
	
		ldr r2,=FlagCligno ;r0=ad FlagCligno
		ldr r1,[r2] ;r1 = FlagCligno
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
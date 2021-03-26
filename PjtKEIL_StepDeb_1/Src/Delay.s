	PRESERVE8
	THUMB   
		

; ====================== zone de r�servation de donn�es,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly


;Section RAM (read write):
	area    maram,data,readwrite
		
VarTime	dcd 0

	
; ===============================================================================================
	
;constantes (�quivalent du #define en C)
TimeValue	equ 900000

	EXPORT VarTime
	EXPORT Delay_100ms ; la fonction Delay_100ms est rendue publique donc utilisable par d'autres modules.

		
;Section ROM code (read only) :		
	area    moncode,code,readonly
		


; REMARQUE IMPORTANTE 
; Cette mani�re de cr�er une temporisation n'est clairement pas la bonne mani�re de proc�der :
; - elle est peu pr�cise
; - la fonction prend tout le temps CPU pour... ne rien faire...
;
; Pour autant, la fonction montre :
; - les boucles en ASM
; - l'acc�s �cr/lec de variable en RAM
; - le m�canisme d'appel / retour sous programme
;
; et donc poss�de un int�r�t pour d�buter en ASM pur

Delay_100ms proc
	
	    ldr r0,=VarTime  ;lecture en memoire	r0 = VarTime	  
						  
		ldr r1,=TimeValue ; lecture en memoire  r1 = TimeValue
		str r1,[r0] ; ecriture: copie la valeur de r1 vers l'adresse stockee � r0
		
BoucleTempo	
		ldr r1,[r0]   ;lecture en mem destination r1  r1 = VarTime				
						
		subs r1,#1 ;soustraction s=maj des flags impt pour retour bne
					;r1 = r1 - 1
		str  r1,[r0]; ecriture: copie la valeur de r1 vers l'adresse stockee � r0
					;r0 = r1 = TimeValue
		bne	 BoucleTempo ;saut du code a une instru donnee si flag != null
			
		bx lr ;retour de sous programme � partir de la val de registre lr
		endp
		
		
	END	
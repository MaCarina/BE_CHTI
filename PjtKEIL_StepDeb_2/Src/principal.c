

#include "DriverJeuLaser.h"
extern void timer_callback(void);

int main(void)
{

// ===========================================================================
// ============= INIT PERIPH (faites qu'une seule fois)  =====================
// ===========================================================================

// Apr�s ex�cution : le coeur CPU est clock� � 72MHz ainsi que tous les timers
CLOCK_Configure();

// configuration du Timer 4 en d�bordement 100ms
	
//** Placez votre code l� ** // 

Timer_1234_Init_ff(TIM4,10000000);	//timer 4 en deb ttes les 100ms, prio 2
	//1Million*1/72MHz pour la valeur du ticks
	
// Activation des interruptions issues du Timer 4
// Association de la fonction � ex�cuter lors de l'interruption : timer_callback
// cette fonction (si �crite en ASM) doit �tre conforme � l'AAPCS
	
//** Placez votre code l� ** // 	
	
Active_IT_Debordement_Timer(TIM4,2,timer_callback);
//deb timer 4 = lancement du timer_callback
	
// configuration de PortB.1 (PB1) en sortie push-pull
GPIO_Configure(GPIOB, 1, OUTPUT, OUTPUT_PPULL);
	
	
	

//============================================================================	
	
	
while	(1)
	{
	}
}



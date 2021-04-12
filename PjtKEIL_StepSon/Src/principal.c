

#include "DriverJeuLaser.h"
extern void callbackSon(void);


int main(void)
{

// ===========================================================================
// ============= INIT PERIPH (faites qu'une seule fois)  =====================
// ===========================================================================

// Après exécution : le coeur CPU est clocké à 72MHz ainsi que tous les timers
CLOCK_Configure();

Timer_1234_Init_ff(TIM4,6552);
	//N=91*10^^-6 *72*10^^6=6552
	
	//interruptions
Active_IT_Debordement_Timer(TIM4,2,callbackSon);//prio 2
//deb timer 4 = lancement du timer_callback
	
// configuration de PortB.1 (PB1) en sortie push-pull
GPIO_Configure(GPIOB, 1, OUTPUT, OUTPUT_PPULL);

	
PWM_Init_ff(TIM3,3,720);
GPIO_Configure(GPIOB, 0, OUTPUT, ALT_PPULL);
//============================================================================	
	
	
while	(1)
	{
	}
}


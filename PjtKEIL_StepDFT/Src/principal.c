

#include "DriverJeuLaser.h"
extern int DFT_ModuleAuCarre(short int *,char);
extern short int LeSignal;

int tabl[64];

int main(void)
{

// ===========================================================================
// ============= INIT PERIPH (faites qu'une seule fois)  =====================
// ===========================================================================

// Apr�s ex�cution : le coeur CPU est clock� � 72MHz ainsi que tous les timers
CLOCK_Configure();
	
	for(int i=0;i<64;i++){
		tabl[i]=DFT_ModuleAuCarre(&LeSignal,i);
	}
		

//============================================================================	
	
	
while	(1)
	{
		
	}
}


#include <platform.h>
#include <xs1.h>
#include <print.h>

out port bled = PORT_BUTTONLED_0;
out port bled2 = PORT_BUTTONLED_1;
out port bled3 = PORT_BUTTONLED_2;
out port bled4 = PORT_BUTTONLED_3;

void one(chanend aChan)
{
  int a=23;
  aChan <: a;
}

void two(chanend aChan, chanend bChan)
{
  int a;
  aChan :> a;
  bChan <: a;
  bled2 <: 0b1010;
  while (1)
    ;
}

void three(chanend bChan, chanend cChan)
{
	int a;
	bChan :> a;
	cChan <: a;
	bled3 <: 0b1100;
	while (1)
	  ;
}

void four(chanend cChan)
{
	int a;
	cChan :> a;
	printstr("All four connected\n");
	bled4 <: 0b0011;
	while (1)
	  ;
}

int main(void)
{
  chan aChan, bChan, cChan;
  par
  {
	on stdcore[0]:
	{
		bled <: 0b0101;
		while (1)
			;
	}
	on stdcore[1]:
	{
		one(aChan);
	}
    on stdcore[4]:
	{
		two(aChan, bChan);
	}
	on stdcore[8]:
	{
		three(bChan, cChan);
	}
	on stdcore[12]:
	{
		four(cChan);
	}
  }
  return( 0 );
}


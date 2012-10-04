#include <Foundation/Foundation.h>
#import "Controller.m"

int main(void)
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	Controller *ctrl = [[Controller alloc] init];	
	
	printf("Welcome to the Play Funstion app.\n");
	printf("Should you take your dog to For Funston right now?\n");
	//printf("getting current weather...\n\n");
	Observation *obs = [ctrl getCurrentWeatherData];
	double answer = [ctrl getDecisionWithObservation:obs];	
	
	if(answer == 1)
	{
		printf("Yes, go to Fort Funston now!\n");
	}
	
	if(answer == 0)
	{
		printf("I'm not sure.\n");
	}
	
	if(answer == -1)
	{
		printf("No, do not go!\n");
	}
	
	printf("--------------------------------------------\n");
	printf("Current Weather\n");
	//NSLog(@"Current Condition: %c",[obs condition]);
	printf("Weather Condition: %s\n",[[obs condition] cString]);	
	printf("Temperature (f): %f\n",[obs temp] );	
	printf("Wind: %f mph gusting to %f mph\n",[obs windMph], [obs windGustMph]);	
	printf("Wind Chill: %f\n",[obs windChill]);	
	printf("\n\n\n");
	
	[pool release];
}
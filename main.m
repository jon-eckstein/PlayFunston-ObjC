#include <Foundation/Foundation.h>
#import "Controller.m"
//#import "Observation.m"
//#import "DecisionTree/SimpleDecisionTree.m"

int main(void)
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
		
	Controller *ctrl = [[Controller alloc] init];	
	Observation *obs = [ctrl getCurrentWeatherData];
	double answer = [ctrl getDecisionWithObservation:obs];	
	NSLog(@"The answer is %f", answer);
	
	
	[pool release];
}
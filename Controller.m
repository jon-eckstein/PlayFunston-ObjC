#include <Foundation/Foundation.h>
#import "Controller.h"

@implementation Controller

	void trainTree()
	{
			
	}
	
	void getTrainingData()
	{
	}

	-(id)init
	{
		self = [super init];
		if(self)
		{		
			decisionTree = [[SimpleDecisionTree alloc] init];	
			trainTree();
		}
	}
	
	-(double)getDecisionWithObservation:(Observation*)observation
	{
		NSNumber *computedVal = [decisionTree computeWithValues:[observation treeValues]];
		return [computedVal doubleValue];
	}
	
	-(Observation*)getCurrentWeatherData
	{
		return nil;
	}
	
	

@end
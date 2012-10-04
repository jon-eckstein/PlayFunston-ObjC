#include <Foundation/Foundation.h>
#include <GNUstepBase/GSXML.h>
#import "DecisionTree/SimpleDecisionTree.m"
#import "Observation.m"


@interface Controller : NSObject
{
	SimpleDecisionTree *decisionTree;	
}
	-(void)trainTree;
	-(NSArray*)getTrainingData;	
	-(double)getDecisionWithObservation:(Observation*)observation;
	-(Observation*)getCurrentWeatherData;	
		
@end

#include <Foundation/Foundation.h>
#import "DecisionTree/SimpleDecisionTree.m"
#import "Observation.m"

@interface Controller : NSObject
{
	SimpleDecisionTree *decisionTree	
}


	-(double)getDecisionWithObservation:(Observation*)observation;
	
@end
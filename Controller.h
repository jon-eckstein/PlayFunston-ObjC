#include <Foundation/Foundation.h>
#import "DecisionTree/SimpleDecisionTree.m"


@interface Controller : NSObject
{
	SimpleDecisionTree *decisionTree	
}

	-double getDecisionWithObservation:(Observation*)observation;
@end
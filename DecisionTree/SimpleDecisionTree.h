#include <Foundation/Foundation.h>
#import "TreeNode.h"

@interface SimpleDecisionTree : NSObject
{
	TreeNode *head;		
}
		
@property (assign, nonatomic) TreeNode *head;

-(id) initWithHead:(TreeNode *)head;
-(BOOL) addBranchWithValues:(NSArray*)values andAnswer:(NSNumber*)answer andIsObserved:(BOOL)isObserved;
-(NSNumber*) computeWithValues:(NSArray*)values;	
-(TreeNode*)findFirstNodeWithSameValueAs:(NSNumber*)val withOthers:(NSArray*)others;
		
@end
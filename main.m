#include <Foundation/Foundation.h>
#import "TreeNode.m"
#import "ObservedTreeNode.m"
#import "TrainedTreeNode.m"
#import "SimpleDecisionTree.m"

int main(void)
{
	//TreeNode *node = [[TreeNode alloc] init];
	//ObservedTreeNode *observedNode = [[ObservedTreeNode alloc] init];
	//TrainedTreeNode *trainedNode = [[TrainedTreeNode alloc] init];
	
	TreeNode *headNode = [[TreeNode alloc] initWithParent:[[TreeNode alloc] init]
										   andChildren:[[NSSet alloc] init]
										   andValue:nil
						 ];
	
	SimpleDecisionTree *decisionTree = [[SimpleDecisionTree alloc] initWithHead:headNode];	
	
	
	
	
	
	
}
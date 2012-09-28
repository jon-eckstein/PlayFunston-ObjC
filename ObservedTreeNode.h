#include <Foundation/Foundation.h>
#import "TreeNode.h"

@interface ObservedTreeNode : TreeNode
{	
	int observedCount;	
}
	//@private:
	@property int observedCount;
		
@end
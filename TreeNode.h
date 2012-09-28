#include <Foundation/Foundation.h>

@interface TreeNode : NSObject
{
	TreeNode *parent;
	NSMutableSet *children;
	NSNumber *value;	
}

	//@private:
	@property (assign, nonatomic) TreeNode *parent;
	
	//@public:
	@property (assign, nonatomic) NSMutableSet *children;
	@property (assign, nonatomic) NSNumber *value;
	
	-(id)initWithParent:(TreeNode*)parent andChildren: (NSMutableSet*)children andValue:(NSNumber*)value;
	-(int)compareTo:(TreeNode *)otherObject;
@end
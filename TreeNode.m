#include <stdlib.h>
#include <Foundation/Foundation.h>
#import "TreeNode.h"

@implementation TreeNode

	@synthesize parent;
	@synthesize children;
	@synthesize value;
	
	
	-(id)initWithParent:(TreeNode*)newParent andChildren: (NSMutableSet*)newChildren andValue:(NSNumber*)newValue
	{
		self = [super init];
		if(self)
		{
			[self setParent:newParent];
			[self setChildren:newChildren];
			[self setValue:newValue];			
		}
		
		return self;
	}
	
	-(int) compareTo:(TreeNode*)otherObject
	{
		if([self value] == [otherObject value])
			return 0;
		
		if([self value] > [otherObject value])
			return 1;
			
		if([self value] < [otherObject value])
			return -1;	
	}

@end
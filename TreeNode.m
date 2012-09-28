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
			
			if(newChildren)
				[self setChildren:newChildren];
			else
				[self setChildren:[[NSMutableSet alloc] init]];
				
			[self setValue:newValue];			
		}
		
		return self;
	}
	
	-(NSInteger*) compare:(TreeNode*)otherObject
	{
		if([self value] == [otherObject value])
			return (NSInteger*)0;
		
		if([self value] > [otherObject value])
			return (NSInteger*)1;
			
		if([self value] < [otherObject value])
			return (NSInteger*)-1;	
	}

@end
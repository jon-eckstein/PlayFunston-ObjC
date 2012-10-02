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
	
	-(NSComparisonResult) compare:(TreeNode*)otherObject
	{
		if([self value] == [otherObject value])
			return (NSComparisonResult)NSOrderedSame;
		
		if([self value] > [otherObject value])
			return (NSComparisonResult)NSOrderedDescending;
			
		if([self value] < [otherObject value])
			return (NSComparisonResult)NSOrderedAscending;	
	}

@end
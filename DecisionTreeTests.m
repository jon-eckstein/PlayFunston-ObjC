#include <Foundation/Foundation.h>
#import "SimpleDecisionTree.m"

int main(void)	
{		
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	@try{
		
		//init with default ctor...
		SimpleDecisionTree *decisionTree = [[SimpleDecisionTree alloc] init];	
		if([decisionTree head] != nil)		
			NSLog(@"initialized with default constructor...");
		else{
			NSLog(@"initialize failed...");
			return -1;
		}
		
		/*		
		//first make sure adding the branches will work...
		NSArray *values = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:2],
														   [NSNumber numberWithInt:2],
														   [NSNumber numberWithInt:2],
														   [NSNumber numberWithInt:2]];	
														   		
		BOOL isBranchAdded = [decisionTree addBranchWithValues:values andAnswer:[NSNumber numberWithInt:1] andIsObserved:NO];
		*/
		
		NSMutableArray *values = [[NSMutableArray alloc] init];
		[values addObject:[NSNumber numberWithInt:3]];
		[values addObject:[NSNumber numberWithInt:5]];
		[values addObject:[NSNumber numberWithInt:3]];
		[values addObject:[NSNumber numberWithInt:1]];		
		
		BOOL isBranchAdded = [decisionTree addBranchWithValues:values andAnswer:[NSNumber numberWithInt:1] andIsObserved:NO];
		
		
		if(isBranchAdded)		
			NSLog(@"Branch added...");
		else
		{
			NSLog(@"Branch not added.");
			return -1;
		}
		
		
		//can add 2 branches
		/*
		NSArray *values2 = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:8],
														   [NSNumber numberWithInt:8],
														   [NSNumber numberWithInt:8],
														   [NSNumber numberWithInt:8]];
		*/
		NSMutableArray *values2 = [[NSMutableArray alloc] init];
		[values2 addObject:[NSNumber numberWithInt:2]];
		[values2 addObject:[NSNumber numberWithInt:5]];
		[values2 addObject:[NSNumber numberWithInt:4]];
		[values2 addObject:[NSNumber numberWithInt:2]];		
																		   
		BOOL isBranchAdded2 = [decisionTree addBranchWithValues:values2 andAnswer:[NSNumber numberWithInt:0] andIsObserved:NO];
		
		if(isBranchAdded2)		
			NSLog(@"Branch 2 added...");
		else
		{
			NSLog(@"Branch 2 not added.");
			return -1;
		}
		
		NSLog(@"head children count: %d",[decisionTree.head.children count]);
		
		
							
	}
	@catch (id theException) {
		NSLog(@"%@", theException);
	}

	[pool release];
		
}

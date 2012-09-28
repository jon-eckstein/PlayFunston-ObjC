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
				
		//first make sure adding the branches will work...
		NSArray *values = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:2],
														   [NSNumber numberWithInt:2],
														   [NSNumber numberWithInt:2],
														   [NSNumber numberWithInt:2]];	
														   		
		BOOL isBranchAdded = [decisionTree addBranchWithValues:values andAnswer:[NSNumber numberWithInt:1] andIsObserved:NO];
		
		if(isBranchAdded)		
			NSLog(@"Branch added...");
		else
		{
			NSLog(@"Branch not added.");
			return -1;
		}
		
		
		//can add 2 branches
		NSArray *values2 = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:8],
														   [NSNumber numberWithInt:8],
														   [NSNumber numberWithInt:8],
														   [NSNumber numberWithInt:8]];
																   
		isBranchAdded2 = [decisionTree addBranchWithValues:values2 andAnswer:[NSNumber numberWithInt:0] andIsObserved:NO];
		
		if(isBranchAdded)		
			NSLog(@"Branch 2 added...");
		else
		{
			NSLog(@"Branch 2 not added.");
			return -1;
		}
		
							
	}
	@catch (id theException) {
		NSLog(@"%@", theException);
	}

	[pool release];
		
}

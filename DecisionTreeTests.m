#include <Foundation/Foundation.h>
#include <assert.h>
#import "DecisionTree/SimpleDecisionTree.m"

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
		
		BOOL isBranchAdded = [decisionTree addBranchWithValues:values andAnswer:[NSNumber numberWithInt:7] andIsObserved:NO];
		
		
		if(isBranchAdded)		
			NSLog(@"Branch added...");
		else
		{
			NSLog(@"Branch not added.");
			return -1;
		}
		
		
		//can add 2 branches		
		NSMutableArray *values2 = [[NSMutableArray alloc] init];
		[values2 addObject:[NSNumber numberWithInt:2]];
		[values2 addObject:[NSNumber numberWithInt:5]];
		[values2 addObject:[NSNumber numberWithInt:4]];
		[values2 addObject:[NSNumber numberWithInt:2]];		
																		   
		BOOL isBranchAdded2 = [decisionTree addBranchWithValues:values2 andAnswer:[NSNumber numberWithInt:5] andIsObserved:NO];
		
		if(isBranchAdded2)		
			NSLog(@"Branch 2 added...");
		else
		{
			NSLog(@"Branch 2 not added.");
			return -1;
		}
				
		NSLog(@"head children count: %d",[decisionTree.head.children count]);
		
		//follow a branch and make some assertions...
		TreeNode* dtHead = [decisionTree head];
		TreeNode* firstVal = (TreeNode*)[dtHead.children.allObjects objectAtIndex:0];
		int testVal = [[firstVal value] intValue]; 
		assert(testVal == 2);
		//NSLog(@"first value: %@",[firstVal value]);
		//NSLog(@"firstNode children count %d", [[firstVal children] count]);
		TreeNode* firstChild = (TreeNode*)[firstVal.children.allObjects objectAtIndex:0];		
		assert([[firstChild value] intValue] == 5);
		//NSLog(@"first child value: %@",[firstChild value]);
		TreeNode* secondChild = [firstChild.children.allObjects objectAtIndex:0];
		assert([[secondChild value] intValue] == 4);
		//NSLog(@"second child: %@",[secondChild value]);
		TreeNode* thirdChild = [secondChild.children.allObjects objectAtIndex:0];
		assert([[thirdChild value] intValue] == 2);
		assert([[[thirdChild.children.allObjects objectAtIndex:0] value] intValue] == 5);
		//NSLog(@"third child: %@",[thirdChild value]);
		//NSLog(@"answer: %@",[[thirdChild.children.allObjects objectAtIndex:0] value]);
		
		NSMutableArray *computeValues = [[NSMutableArray alloc] init];
		[computeValues addObject:[NSNumber numberWithDouble:1]];
		[computeValues addObject:[NSNumber numberWithDouble:3]];
		[computeValues addObject:[NSNumber numberWithDouble:2]];
		[computeValues addObject:[NSNumber numberWithDouble:1]];
		
		NSNumber *computedAnswer = [decisionTree computeWithValues:computeValues];
		assert([computedAnswer intValue] == 5);
		
		//need to test with a more complex tree...will add a branch that causes
		NSMutableArray *valuesComplex1 = [[NSMutableArray alloc] init];
		[valuesComplex1 addObject:[NSNumber numberWithInt:3]];
		[valuesComplex1 addObject:[NSNumber numberWithInt:8]];
		[valuesComplex1 addObject:[NSNumber numberWithInt:9]];
		[valuesComplex1 addObject:[NSNumber numberWithInt:5]];		
		
		isBranchAdded = [decisionTree addBranchWithValues:valuesComplex1 andAnswer:[NSNumber numberWithInt:6] andIsObserved:NO];

		NSMutableArray *valuesComplex2 = [[NSMutableArray alloc] init];
		[valuesComplex2 addObject:[NSNumber numberWithInt:3]];
		[valuesComplex2 addObject:[NSNumber numberWithInt:8]];
		[valuesComplex2 addObject:[NSNumber numberWithInt:1]];
		[valuesComplex2 addObject:[NSNumber numberWithInt:4]];		
		
		isBranchAdded = [decisionTree addBranchWithValues:valuesComplex2 andAnswer:[NSNumber numberWithInt:11] andIsObserved:NO];
		
		
		NSMutableArray *computeValuesComplex = [[NSMutableArray alloc] init];
		[computeValuesComplex addObject:[NSNumber numberWithDouble:3]];
		[computeValuesComplex addObject:[NSNumber numberWithDouble:7]];
		[computeValuesComplex addObject:[NSNumber numberWithDouble:2]];
		[computeValuesComplex addObject:[NSNumber numberWithDouble:1]];
		
		NSNumber *computedAnswerComplex = [decisionTree computeWithValues:computeValuesComplex];
		assert([computedAnswerComplex intValue] == 11);
		//NSLog(@"complex answer is %@",computedAnswerComplex);
		
		//let's change the value of one of the values in the complex set and see if the branch path changes...
		[computeValuesComplex replaceObjectAtIndex:2 withObject:[NSNumber numberWithDouble:7]];
		computedAnswerComplex = [decisionTree computeWithValues:computeValuesComplex];
		assert([computedAnswerComplex intValue] == 6);
		
		
		//add an observed branch and see how the compute reacts...
		NSMutableArray *valuesObserved = [[NSMutableArray alloc] init];
		[valuesObserved addObject:[NSNumber numberWithInt:3]];
		[valuesObserved addObject:[NSNumber numberWithInt:8]];
		[valuesObserved addObject:[NSNumber numberWithInt:8]];
		[valuesObserved addObject:[NSNumber numberWithInt:8]];		
		
		isBranchAdded = [decisionTree addBranchWithValues:valuesObserved andAnswer:[NSNumber numberWithInt:60] andIsObserved:YES];
		
		//change the value back to original value...	
		[computeValuesComplex replaceObjectAtIndex:2 withObject:[NSNumber numberWithDouble:2]];
			
		//try to compute again...
		NSNumber *computedAnswerObserved = [decisionTree computeWithValues:computeValuesComplex];
		assert([computedAnswerObserved intValue] == 11);
		NSLog(@"answer with observed branch is: %@",computedAnswerObserved);
		
		
	}
	@catch (id theException) {
		NSLog(@"%@", theException);
	}

	[pool release];
		
}

#include <Foundation/Foundation.h>
#import "SimpleDecisionTree.h"
#import "TreeNode.m"
#import "ObservedTreeNode.m"
#import "TrainedTreeNode.m"

@implementation SimpleDecisionTree

	@synthesize head;
	
	
	-(id) initWithHead:(TreeNode *)newHead
	{
		self = [super init];
		if(self)
		{
			[self setHead:newHead];			
		}
		
		return self;	
	}
	
	-(id) init
	{
				
		TreeNode *thisHead = [[TreeNode alloc] initWithParent:nil
											   andChildren:nil
											   andValue:nil
							 ];
		self = [self initWithHead:thisHead];
		return self;
	}
	
	-(BOOL) addBranchWithValues:(NSArray*)values andAnswer:(NSNumber*)answer andIsObserved:(BOOL)isObserved
	{	
		TreeNode *currentNode = [self head];
		
		//for(double value in [values objectEnumerator])
		//for(NSUInteger i=0; i<=[values count]-1; i++)
		
		NSLog(@"values count: %u",[values count]);
		
		for(id value in values)
		{
			NSLog(@"current value: %@",value);
			int childCount = [[currentNode children] count];								
			BOOL addNewNode = NO;
			
            //if there are no current children in the branch then add the current branch as a child.
            if (childCount == 0)
            {
                addNewNode = YES;
            }
			else
            {
                    //if there exist a child with the same value then just move to the next value..       
                    NSArray *currentChildren = [[currentNode children] allObjects];
                    TreeNode *sameValNode = [self findFirstNodeWithSameValueAs:value withOthers:currentChildren];               

                    if (sameValNode)                    
                    {
                        NSLog(@"found same val node...%@",[sameValNode value]);
                        if (isObserved)
                        {
                            if([sameValNode isKindOfClass:[ObservedTreeNode class]])
                                currentNode = sameValNode;
                            else
                            {                                
                                ObservedTreeNode *newObserved = [[ObservedTreeNode alloc] initWithParent:[sameValNode parent]
                                														  andChildren:[sameValNode children]
                                														  andValue: value];
								[[currentNode children] removeObject:sameValNode];
								[[currentNode children] addObject:newObserved];
                                currentNode = newObserved;
                            }
                        }
                        else
                        {
                            currentNode = sameValNode;
                        }                        
                    }
                    else //otherwise add the new branch as a child...                    
                        addNewNode = YES;
               }
               
               
           	//add the node
            if (addNewNode)
            {                
                TreeNode *newChild = nil;
                if (isObserved)
                {
                	newChild = [[ObservedTreeNode alloc] initWithParent:currentNode
                            							 andChildren:nil
                            							 andValue:value];
                }
                else
                {
                    newChild = [[TrainedTreeNode alloc] initWithParent:currentNode
                            							andChildren:nil
                            							andValue:value];
                }
                                                                 
                [[currentNode children] addObject:newChild];
				//NSLog(@"children count %u", [[currentNode children] count]);                  
                currentNode = newChild;             
                

            }
               
	        
		}	
		
		//we're at the last value, so now we need to add the answer node...
        //if any answers already exist then we replace the current answer with this answer.
        [[currentNode children] removeAllObjects];
        TreeNode *answerNode;
        if (isObserved)
        {
            answerNode = [[ObservedTreeNode alloc] initWithParent:currentNode
                        						   andChildren:nil
                        						   andValue:answer];
        }
        else
        {	            
			answerNode = [[TrainedTreeNode alloc] initWithParent:currentNode
                        						  andChildren:nil
                        						  andValue:answer];
        }

        [[currentNode children] addObject:answerNode];  
			
		return YES;
	}
	
	NSInteger sortTreeNodeComparer(id id1, id id2, void* context)
	{	
		NSNumber *val = (NSNumber*)context;	
		double value = [val doubleValue];
		//NSLog(@"sort context: %f",value);
	    // Sort Function	    
	    TreeNode *treeNode1 = (TreeNode*)id1;  
	    TreeNode *treeNode2 = (TreeNode*)id2;  
		
		double diff1 = abs([[treeNode1 value] doubleValue] - value);
		double diff2 = abs([[treeNode2 value] doubleValue] - value);
		
		if (diff1 < diff2)
        	return NSOrderedAscending;
    	else if (diff1 > diff2)
        	return NSOrderedDescending;
    	else
        	return NSOrderedSame; 
						
	    //return (NSInteger)[treeNode1 compare:treeNode2]; 
	}
		
	-(NSNumber*) computeWithValues:(NSArray*)values
	{
		TreeNode *currentNode = [self head];
		
		for(id value in values)
		{
			//find the node with the closest value and use that as the current tree path...			 			
			NSArray *currentChildren = [[currentNode children] allObjects];
			
			
			NSArray* sorted = [currentChildren sortedArrayUsingFunction:sortTreeNodeComparer context:value];
			
			TrainedTreeNode *topNode = (TrainedTreeNode*)[sorted objectAtIndex:0];
			if(topNode){
				currentNode = topNode;
				//NSLog(@"computed current value %@",[currentNode value]);
			}else{
				NSLog(@"No topNode!!");
				return nil;
			}
			
			/*
			TreeNode *sameValNode = [self findFirstNodeWithSameValueAs:value withOthers:currentChildren];               			
			if(sameValNode)
			{
				currentNode = sameValNode;
			}
			else
			{
				
			}*/
		}
		
		//the current node should be the last in the followed branch..
		NSArray* lastChildren = [[currentNode children] allObjects];
		
		//return the child of the last node...there should be exactly one child...
		if([lastChildren count] == 1){
			return 	(NSNumber*)[[lastChildren objectAtIndex:0] value];
		}else{
			return nil;
		}
		
	}	
	
	-(TreeNode*)findFirstNodeWithSameValueAs:(NSNumber*)val withOthers:(NSArray*)others
	{
		double dblVal = [val doubleValue];
		for(id other in others)
		{	
			double dblOther = [[other value] doubleValue];
						
			if(dblOther == dblVal)							
				return other;			
		}
		
		return nil;
	}
	
	
	
	
	
@end
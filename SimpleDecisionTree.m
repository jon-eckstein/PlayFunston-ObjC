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
		for(id value in values)
		{
			//NSNumber* value = [values objectAtIndex:i];
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
                currentNode = newChild;
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
		}		
		return YES;
	}
	
	
	-(TreeNode*)findFirstNodeWithSameValueAs:(NSNumber*)val withOthers:(NSArray*)others
	{
		//for((TreeNode*) other in others)
		//for(int i=0;i<=[others count]-1;i++)
		for(id other in others)
		{
			//TreeNode* other = (TreeNode*)[others objectAtIndex:i];	
			if([[other value] isEqual:val])
				return other;
		}
		
		return nil;
	}
	
	-(NSNumber*) computeWithValues:(NSArray*)values
	{
		return nil;
	}	
	
	
	
@end
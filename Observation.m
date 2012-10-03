#include <Foundation/Foundation.h>
#import "Observation.h"


@implementation Observation	
	@synthesize obsDescription;
	@synthesize condition;
	@synthesize conditionCode;
    @synthesize windMph;         
    @synthesize windGustMph;
    @synthesize temp;        
    @synthesize windChill;
    @synthesize nextLowTide; 
	@synthesize weatherScore;
    @synthesize tideScore;
	@synthesize isObservedByUser;
    @synthesize goFunston;
	//@synthesize treeValues;	


	+(NSUInteger)getConditionCodeWithWeather:(NSString*)weather
	{
		return 0;
	}

	-(id)initWithCode:(NSUInteger)newCode andTemperature:(double)newTemp andWindChill:(double)newWindChill andWindMph:(double)newWindMph andWindGustMph:(double)newWindGustMph andGoFunston:(NSUInteger)newGo
	{
		self = [super init];
		if(self)
		{
			[self setConditionCode:newCode];
			[self setTemp:newTemp];
			[self setWindChill:newWindChill];
			[self setWindMph:newWindMph];
			[self setWindGustMph:newWindGustMph];
			[self setGoFunston:newGo];
		}
		
		return self;
	}
	
	
	
	
@end

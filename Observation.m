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
	
	+(NSUInteger)getConditionCodeWithWeather:(NSString*)weather
	{
		NSMutableArray *goodWeather = [[NSMutableArray alloc] init];
		[goodWeather addObject:@"Clear"]; 		
		[goodWeather addObject:@"Partly Cloudy"];
		[goodWeather addObject:@"Scattered Clouds"];
		[goodWeather addObject:@"Haze"];
		
		NSMutableArray *maybeWeather = [[NSMutableArray alloc] init];
		[maybeWeather addObject:@"Mostly Cloudy"]; 		
		[maybeWeather addObject:@"Overcast"];
		[maybeWeather addObject:@"Fog"];
		[maybeWeather addObject:@"Mist"];
		
		if([goodWeather containsObject:weather])
			return 1;
			
		if([maybeWeather containsObject:weather])
			return 0;
		
		return -1;
		
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
	
	-(id)initWithWeather:(NSString*)weather andTemperature:(double)newTemp andWindChill:(double)newWindChill andWindMph:(double)newWindMph andWindGustMph:(double)newWindGustMph
	{
		NSUInteger code = [Observation getConditionCodeWithWeather:weather];
		self = [self initWithCode:code andTemperature:newTemp andWindChill:newWindChill andWindMph:newWindMph andWindGustMph:newWindGustMph andGoFunston:0];
		[self setCondition:weather];
		return self;
	}
	
	
	-(NSArray*) treeValues
	{
		NSMutableArray *values = [[NSMutableArray alloc] init];
		[values addObject:[NSNumber numberWithInt:[self conditionCode]]];
		[values addObject:[NSNumber numberWithDouble:[self temp]]];
		[values addObject:[NSNumber numberWithDouble:[self windChill]]];
		[values addObject:[NSNumber numberWithDouble:[self windMph]]];
		[values addObject:[NSNumber numberWithDouble:[self windGustMph]]];
		return values;
	}
	
	
	
@end

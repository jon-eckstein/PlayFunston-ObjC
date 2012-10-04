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
/*
private static int GetConditionCode(string weather)
        {

            if (weather.Contains(new[] { "Clear", "Partly Cloudy", "Scattered Clouds", "Haze" }))
                return (int)Conditions.Good;

            if (weather.Contains(new[] { "Mostly Cloudy", "Overcast", "Fog", "Mist" }))
                return (int)Conditions.Maybe;

            return (int)Conditions.Bad;
        }   
*/

	+(NSUInteger)getConditionCodeWithWeather:(NSString*)weather
	{
		NSArray *goodWeather = [[NSArray alloc] initWithObjects:@"Clear", @"Partly Cloudy",@"Scattered Clouds", @"Haze"]; 		
		
		if([goodWeather containsObject:weather])
			return 1;
		else		
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

#include <Foundation/Foundation.h>
#import "Controller.h"
#import "Observation.m"

@implementation Controller

	-(void) trainTree
	{
		NSArray *trainingData = [self getTrainingData];
		for(id obs in trainingData)		
			[decisionTree addBranchWithValues:[obs treeValues] andAnswer:[NSNumber numberWithInt:[obs goFunston]] andIsObserved:NO];
					
	}
	
	-(NSArray*) getTrainingData
	{		
		
		NSMutableArray *trainingObs = [[NSMutableArray alloc] init];
		
		[trainingObs addObject:[[Observation alloc] initWithCode:0 andTemperature:70 andWindChill:0 andWindMph:2 andWindGustMph:2 andGoFunston:1]];
		[trainingObs addObject:[[Observation alloc] initWithCode:0 andTemperature:60 andWindChill:0 andWindMph:5 andWindGustMph:5 andGoFunston:1]];
		[trainingObs addObject:[[Observation alloc] initWithCode:0 andTemperature:50 andWindChill:0 andWindMph:13 andWindGustMph:10 andGoFunston:1]];
		[trainingObs addObject:[[Observation alloc] initWithCode:0 andTemperature:55 andWindChill:50 andWindMph:15 andWindGustMph:10 andGoFunston:0]];
		[trainingObs addObject:[[Observation alloc] initWithCode:0 andTemperature:45 andWindChill:0 andWindMph:20 andWindGustMph:30 andGoFunston:-1]];
		[trainingObs addObject:[[Observation alloc] initWithCode:1 andTemperature:60 andWindChill:0 andWindMph:2 andWindGustMph:2 andGoFunston:1]];
		[trainingObs addObject:[[Observation alloc] initWithCode:1 andTemperature:65 andWindChill:55 andWindMph:15 andWindGustMph:20 andGoFunston:0]];
		[trainingObs addObject:[[Observation alloc] initWithCode:1 andTemperature:50 andWindChill:0 andWindMph:10 andWindGustMph:5 andGoFunston:0]];
		[trainingObs addObject:[[Observation alloc] initWithCode:1 andTemperature:55 andWindChill:0 andWindMph:5 andWindGustMph:2 andGoFunston:1]];
		[trainingObs addObject:[[Observation alloc] initWithCode:2 andTemperature:60 andWindChill:50 andWindMph:15 andWindGustMph:20 andGoFunston:-1]];
		[trainingObs addObject:[[Observation alloc] initWithCode:2 andTemperature:0 andWindChill:0 andWindMph:0 andWindGustMph:0 andGoFunston:-1]];
		[trainingObs addObject:[[Observation alloc] initWithCode:2 andTemperature:50 andWindChill:40 andWindMph:10 andWindGustMph:15 andGoFunston:-1]];
									  		
		return trainingObs;
		
	}

	-(id)init
	{
		self = [super init];
		if(self)
		{		
			decisionTree = [[SimpleDecisionTree alloc] init];	
			[self trainTree];
		}
		
		return self;
	}
	
	-(double)getDecisionWithObservation:(Observation*)observation
	{
		NSNumber *computedVal = [decisionTree computeWithValues:[observation treeValues]];
		return [computedVal doubleValue];
	}
	
	-(Observation*)getCurrentWeatherData
	{		
		NSURL *url = [NSURL URLWithString:@"http://api.wunderground.com/api/f88d918861288deb/conditions/q/pws:KCASANFR69.xml"];
		NSURLRequest *request = [NSURLRequest requestWithURL:url];
		NSURLResponse *response = nil;
		NSError *err = nil;
		/*
		NSData *data = [NSURLConnection sendSynchronousRequest:request 
									returningResponse:&response 
									error:&err];
		
		NSString* xml = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]; 
		NSLog(@"weather data: %@",xml);							
		*/
		
		
		
		GSXMLParser *parser = [GSXMLParser parserWithContentsOfURL: url];
		
		
		
		
	    BOOL parsed = [parser parse];
	    if(parsed){	        	    	
	    	NSString *xPathRootString = @"string(/response/current_observation/%@)";
	    	NSString *xPathRootNumber = @"number(/response/current_observation/%@)";
	    	GSXPathContext *ctx = [[GSXPathContext alloc] initWithDocument: [parser document]];
			GSXPathNumber *resultNumber = nil;
			GSXPathString *resultString = nil;
			resultString = (GSXPathString *) [ctx evaluateExpression: [NSString stringWithFormat:xPathRootString,@"weather"]];
			NSString *weather = [resultString stringValue];
			
			resultNumber = (GSXPathNumber *) [ctx evaluateExpression: [NSString stringWithFormat:xPathRootNumber,@"temp_f"]];			
			double temp = [resultNumber doubleValue];

			resultNumber = (GSXPathNumber *) [ctx evaluateExpression: [NSString stringWithFormat:xPathRootNumber,@"windchill_f"]];			
			double windChill = [resultNumber doubleValue];
			
			resultNumber = (GSXPathNumber *) [ctx evaluateExpression: [NSString stringWithFormat:xPathRootNumber,@"wind_mph"]];			
			double windMph = [resultNumber doubleValue];
			
			resultNumber = (GSXPathNumber *) [ctx evaluateExpression: [NSString stringWithFormat:xPathRootNumber,@"wind_gust_mph"]];			
			double windGustMph = [resultNumber doubleValue];
			
			Observation *currentObs = [[Observation alloc] initWithWeather:weather andTemperature:temp andWindChill:windChill andWindMph:windMph andWindGustMph:windGustMph];
			
			return currentObs;
	    }	    	
																				
		return nil;
	}
	
	

@end
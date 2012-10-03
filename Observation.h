#include <Foundation/Foundation.h>

@interface Observation : NSObject
{
	NSString *obsDescription;
	NSString *condition;
	NSUInteger conditionCode;
    double windMph;         
    double windGustMph;
    double temp;        
    double windChill;
    NSDate *nextLowTide; 
    NSUInteger weatherScore;
    NSUInteger tideScore;
    BOOL isObservedByUser;
    NSUInteger goFunston;		
}
	
	@property (assign) NSString *obsDescription;
	@property (assign) NSString *condition;
	@property (assign) NSUInteger conditionCode;
    @property (assign) double windMph;         
	@property (assign) double windGustMph;
    @property (assign) double temp;        
    @property (assign) double windChill;
    @property (assign) NSDate *nextLowTide; 
    @property (assign) NSUInteger weatherScore;
    @property (assign) NSUInteger tideScore;
    @property (assign) BOOL isObservedByUser;
    @property (assign) NSUInteger goFunston;
    @property (readonly) NSArray* treeValues;
	
		
	+(NSUInteger)getConditionCodeWithWeather:(NSString*)weather;
	-(id)initWithCode:(NSUInteger)code andTemperature:(double)temp andWindChill:(double)windChill andWindMph:(double)windMph andWindGustMph:(double)windGustMph andGoFunston:(NSUInteger)go;
		
@end
#include <Foundation/Foundation.h>

@interface Observation : NSObject
{
	NSString *obsDescription;
	NSString *condition;
	NSUInteger *conditionCode;
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
	
	@property (assign, nonatomic) NSString *obsDescription;
	@property (assign, nonatomic) NSString *condition;
	@property (assign, nonatomic) NSUInteger *conditionCode;
    @property (assign, nonatomic) double windMph;         
    @property (assign, nonatomic) double windGustMph;
    @property (assign, nonatomic) double temp;        
    @property (assign, nonatomic) double windChill;
    @property (assign, nonatomic) NSDate nextLowTide; 
    @property (assign, nonatomic) NSUInteger weatherScore;
    @property (assign, nonatomic) NSUInteger tideScore;
    @property (assign, nonatomic) BOOL isObservedByUser;
    @property (assign, nonatomic) NSUInteger goFunston;
	@property (assign, nonatomic,readonly) NSArray *treeValues;	
	
	-(id)initWithCode:(NSUInteger)code andTemperature:(double)temp andWindChill:(double)windChill andWindMph(double)windMph andWindGustMph(double)windGustMph andGoFunston(NSUInteger)go;
		
	

@end
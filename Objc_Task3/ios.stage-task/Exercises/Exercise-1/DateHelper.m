#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    if (monthNumber < 1 || monthNumber > 12) {
        return nil;
    }
    
    NSString *dateString = [NSString stringWithFormat: @"%lu", (unsigned long)monthNumber];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MM";
    
    NSDate *myDate = [dateFormatter dateFromString:dateString];
    
    NSDateFormatter *dateformatterNew = [[NSDateFormatter alloc] init];
    dateformatterNew.dateFormat = @"MMMM";
    
    NSString *myMonth = [dateformatterNew stringFromDate:myDate];
    
    return myMonth;
    
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    
    NSDate *myDate = [dateFormatter dateFromString:date];
    
    long myDay = [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:myDate];
    
    return myDay;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"EE";
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    
    NSString *myDay = [dateFormatter stringFromDate:date];
    
    return myDay;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    long myWeek = [calendar component:NSCalendarUnitWeekOfYear fromDate:date];
    
    NSDate *currentDate = [NSDate now];
    
    NSInteger currentWeek = [calendar component:NSCalendarUnitWeekOfYear fromDate:currentDate];
   
    return myWeek == currentWeek ? YES : NO;
}

@end

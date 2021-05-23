#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    
    NSInteger count = 0;
    NSInteger n = ratingArray.count;
    
    if (n < 3) {
        return 0;
    }
    
    for (int i = 0; i < n; i++)
        for (int j = i + 1; j < n; j++)
            for (int k = j + 1; k < n; k++)
                if (ratingArray[i].intValue < ratingArray[j].intValue &&
                    ratingArray[j].intValue < ratingArray[k].intValue)
                    count++;
                else if (ratingArray[i].intValue > ratingArray[j].intValue &&
                        ratingArray[j].intValue > ratingArray[k].intValue)
                        count++;
    return count;
}

@end

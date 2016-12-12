//
//  RunACR.h
//  RunACR
//
//  Created by Andrei Solovjev (andrei@solovjev.com)
//  http://runacr.com (support@runacr.com)
//

#import <Foundation/Foundation.h>

@protocol RunACRDelegate <NSObject>

-(void)didRecognize:(int)trackId absoluteTimeOffset:(float)absoluteTimeOffset relativeTimeOffset:(float)relativeTimeOffset;

-(void)didNotRecognize;

@end


@interface RunACR : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong) id <RunACRDelegate> delegate;

@property (nonatomic, assign) NSTimeInterval recordingTime;

@property (nonatomic, strong) NSDate *timeStartListening;

@property (nonatomic, assign) int minimumFindedCnt;

- (NSString *) databaseInfo;

- (void) initializeWithAPIKey:(NSString *)apiKey;

- (BOOL) updateDatabasePath:(NSString *)databasePath;

- (void) startRecognize;

@end

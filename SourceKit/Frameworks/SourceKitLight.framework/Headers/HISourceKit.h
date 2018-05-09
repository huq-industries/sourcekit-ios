//
//  HISourceKit.h
//  HIRegionMonitor
//
//  Created by Isambard Poulson on 03/11/2015.
//  Copyright © 2015 Huq Industries. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HISourceKit : NSObject

extern NSString * const kHuqEndpoint;
extern NSString * const kHuqAPIVersion;

/**
 *  Singleton class instance
 */

+ (id) sharedKit;

/**
 *
 *  SourceKit Initialisation
 *
 *  Initialisation method, which must pass in your API key in the following format.
 *  SourceKit should preferably be implemented in or near your app's launch method:
 *
 *  -application:didFinishLaunchingWithOptions:
 *
 *  [[SourceKit sharedKit] recordWithAPIKey:@"XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"]
 *
 */

- (void) recordWithAPIKey:(NSString *)apiKey;

/**
 *
 *  Stop recording
 *
 *  If for any reason, due to user input or otherwise, you wish to halt the collection of data, call this.
 *
 */

- (void) stopRecording;

/**
 *
 *  Custom Event Tags
 *
 *  You can overlay the request by adding tags to describe what the user is doing in the app.
 *  These tags are implemented on a one-time basis, ie. reset after the request is submitted.
 *
 *  [[SourceKit sharedKit] logCustomEventWithTags:@[@"App_Transaction_Checkout", @"Other_Tags"];
 *
 */

- (void) logCustomEventWithTags:(NSArray *)tags;

- (void) submitAdvertisingID:(BOOL)shouldSubmit;

- (void)startAccelerometerUpdates;
- (void)stopAccelerometerUpdates;
- (void)buildAccelerometerConstruct;
- (void)teardownAccelerometerConstruct;
- (void)startGyroUpdates;
- (void)stopGyroUpdates;
- (void)buildGyroConstruct;
- (void)teardownGyroConstruct;
- (void)startMagnetometerUpdates;
- (void)stopMagnetometerUpdates;
- (void)interpolateOrientation;
- (void)buildPositionalInterpolationConstruct;
- (void)teardownPositionalInterpolationConstruct;
- (void)dispatchSilentPositionalPush;
- (void)respondToSilentPositionalPush;

@end

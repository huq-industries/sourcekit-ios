[![Version](https://img.shields.io/cocoapods/v/SourceKit.svg?style=flat)](http://cocoapods.org/pods/SourceKit)

# Huq Industries | SourceKit for iOS

Huq Industries Real-world Analytics for mobile apps reveals where your users shop and work, travel and relax. Integrate SourceKit today for brand new insights into your audience's behaviour. Join our Partner Program for a new way to monetise your mobile app.

  - Learn when and how your users shop, work and relax
  - Build and manage  insights using Huq's analytics tools
  - Use Huq to power campaigns and personalise content

To get started with SourceKit by Huq you'll first need to register and grab an API key from [Huq Industries' Physical Analytics][hq1] console, then follow the simple steps below.

***

### Install using Cocoapods

Add the following line to your Podspec and run `pod install`

```sh
$ pod 'SourceKit'
```

---

### Initialising SourceKit

#### Swift

SourceKit is an Objective-C framework, so if you don't already have a bridging
header, you will need to create one. If you don't know how to do that, follow
these steps:

1. Add a new file to your project (File > New > File), select “Source” and then
“Header File“. Name your file “ProjectName-Bridging-Header.h"

2. Add the bridging header to your Swift compliler. Select the
build settings tab for your project and then search for 'Swift Compiler'.
Under the 'Swift Compiler - Code Generation' section, add the path to your bridging header
to the 'Objective-C Bridging Header' field. Check the location of the header to ensure you get the path right. If it is in
the root directory, the path will simply be 'ProjectName-Bridging-Header.h'. If
it is in the project subdirectory, the path will be
'ProjectName/ProjectName-Bridging-Header.h'.

You should import the SourceKit library in the bridging header by adding the
following line:

```objective-c
#import <SourceKit/SourceKit.h>
```

In your AppDelegate, add the following line to the `func
application(application: UIApplication, didFinishLaunchingWithOptions
launchOptions: [NSObject: AnyObject]?) -> Bool` method:

```swift
// replace <API_Key> with the API key that you have received from Huq
HISourceKit.sharedKit().recordWithAPIKey("<API_Key>", inDebugMode: false)
```

#### Objective-C

In your `AppDelegate.m` file, import the SourceKit library by adding the
following line:

```objective-c
#import <SourceKit/SourceKit.h>
```
And then in your `AppDelegate`'s `-application:didFinishLaunching:withOptions:` method, just add the following:

```objective-c
// replace <API_Key> with the API key that you have received from Huq
[[HQSourceKit sharedKit] recordWithAPIKey:@“<API_Key>” inDebugMode:NO];
```

**And that's it!**  Check that you have `location services` enabled correctly, and see additional usage information below for advanced implementations. 

---

### Using location services

Huq Industries' SourceKit SDK, among other things, makes use of location
services to generate Physical Insights. For versions prior to iOS 8, calling 
```objective-c
[[HQSourceKit sharedKit] recordWithAPIKey:@“<API_Key>” inDebugMode:NO];
```
will automatically request the necessary location permissions. If you would
prefer that this request is made later in the applicaiton flow, then simply
call this method at that point.

Since iOS 8 this has become a little more nuanced, so steps to configure location services in iOS 8+ as follows:

**Using location services in iOS 8+**

To make use of location services, you need to first configure your project’s `Info.plist`.

* right-click on the plist inspector, and select add row
* in the key field, add the key for the mode you require
* say why your app makes use of location services

![alt text](http://huq.io/assets/misc/HQ_foreground2.png "Adding Info.plist keys")

**Foreground only apps**

For apps that access location services in the foreground only, add the key
`NSLocationWhenInUseUsageDescription` to your `Info.plist`. Then in your class,
import CoreLocation as normal, configure `CLLocationManager` as you wish and
remember to call `whenInUseAuthorizationwhen` you're ready to go.

**Foreground and background apps**

For apps that access location services in the background too, add the key `NSLocationAlwaysUsageDescription` to your `Info.plist`. Then in your class, import CoreLocation as normal, configure `CLLocationManager` as you wish and remember to call `requestAlwaysAuthorization` when you're ready to go.

---

### Testing

SourceKit from Huq makes use of APIs that are not available in the simulator. To test your integration of the SourceKit framework, set `-inDebugMode:YES` and test **on your device** while **connected to WiFi**.

---

### Advanced usage

You can overlay Huq Industries' Physical Insight events with your own by adding
`Custom Events`, arbitrary tags to describe what your user is doing in your
app.  For example, you might interest you to know that *'most users* `[carry
out a certain action in-app]` *when they're* `[at home, or at work, or
wheverver]`'. The following example shows how you layer Huq’s Insight events
with your own Custom Event tags to indicate what a user was doing in your app
at that time. Event tags that you log are recorded together with the next Huq
event that is submitted.

#### Swift

```swift
// Create a String that describes a user action
let userDoingSomething : String = "User doing something"
```
```swift
// Create and log an array of tags, you can submit as many as you like
HISourceKit.sharedKit().logCustomEventWithTags([userDoingSomething])
```

#### Objective-C

```objective-c
#import <SourceKit/SourceKit.h>
```
```objective-c
// Create a String that describes a user action
static NSString *userDoingSomething = @"User doing something";
```
```objective-c
// Create and log an array of tags, you can submit as many as you like
[[HISourceKit sharedKit] logCustomEventWithTags:@[userDoingSomething]];
```
**Note:**  Custom Events are implemented on a one-time basis, and reset after each event request has been submitted to Huq Industries.

---

### End-user opt-out

Huq takes privacy seriously and while the data that SourceKit collects is anonymised, Huq does offer the means for you to stop collecting data from a user in response, for example, to a user selecting an ‘opt-out’ feature that you may wish to implement.

#### Swift 

```swift
HISourceKit.sharedKit().stopRecording()
```

#### Objective-C

```objective-c
#import <SourceKit/SourceKit.h>
```
```objective-c
[[HISourceKit sharedKit] stopRecording];
```

Calling `stopRecording` will destroy the instance of SourceKit that you originally created by calling `recordWithAPIKey:inDebugMode:`.  If you wish to restart SourceKit at any time, simply call `recordWithAPIKey:inDebugMode:` again as you did the first time.

***

### Additional support

Huq Insights are refreshed *at least* once every 24 hours. If after logging in to your Insights Dashboard after 24 hours you cannot see any data, then please check the following:

* that you have been testing on a device
* that you have enabled location services
* that you have been testing over WiFi

To stimulate generating insight events more frequently testing on the device, navigate in `Xcode` to `Debug` > `Simulate location` > `[select different city]` or `Add GPX file` to simulate movement.

If you have any other questions please reach out to help@huq.io.

***

### Licence

This SourceKit SDK is Copyright 2014-2015 Huq Industries Limited. This SDK is licensed under the Huq Physical Insights Platform Terms of Service, found on the Huq Industries website [here][hq2] (the "License"). You may not use this SDK unless (1) you have registered for an account with Huq, (2) are in possession of a valid API Key from Huq, (3) have agreed the terms of the Licence and (4) are in compliance with the License. Any unauthorised use of this SDK constitutes copyright infringement and violation of law.

   [hq1]: <http://dashboard.huq.io>
   [hq2]: <http://huq.io/legals/service-terms.html>

[![Version](https://img.shields.io/cocoapods/v/SourceKit.svg?style=flat)](http://cocoapods.org/pods/SourceKit)

# Huq Industries | SourceKit for iOS

Huq Industries Real-world Analytics for mobile apps reveals where your users shop and work, travel and relax. Integrate SourceKit today for brand new insights into your audience's behaviour. Join our Partner Program for a new way to monetise your mobile app.

  - Learn when and how your users shop, work and relax
  - Build and manage  insights using Huq's analytics tools
  - Use Huq to power campaigns and personalise content

To get started with SourceKit by Huq you'll first need to [register][hq1] and grab an API key from [Huq Industries' Physical Analytics][hq2] console, then follow the simple steps below.

***

### Install using Cocoapods

If you are using Cocoapods, simply add the following line to your Podspec. Hit `pod install`, and SourceKit will automatically link itself to your project for you.

```sh
$ pod 'SourceKit', '~> 1.0'
```

If you **don't** use Cocoapods, or you prefer to manage your dependencies yourself, you can also grab the latest version of the SourceKit SDK from [here][hq3].  You will also need to add `CoreLocation` and `SystemConfiguration` `frameworks` to your project explicitly.

---

### Initialising SourceKit

If you have already configured your project for `location services`, you’re now ready to initialise SourceKit.  Head over to your `AppDelegate.m` file, `#import <SourceKit/SourceKit.h>` and simply add the following line, replacing `<API_Key>` with the API key you created for the corresponding app in the console.

```objective-c
#import <SourceKit/SourceKit.h>
```
And then in your `AppDelegate`'s `-application:didFinishLaunching:withOptions:` method, just add the following:

```objective-c
// replace "API_Key" with the API key that you have received from Huq
[[HQSourceKit sharedKit] recordWithAPIKey:@“<API_Key>” inDebugMode:NO];
```
**And that's it!**  Check that you have `location services` enabled correctly, and see additional usage information below for advanced implementations. 

---

### Using location services

Huq Industries' SourceKit SDK, among other things, makes use of location services to generate Physical Insights. Since iOS 8 this has become a little more nuanced, so steps to configure location services in iOS 8+ as follows:

**Using location services in iOS 8+**

To make use of location services in the foreground, you need to first configure your project’s `Info.plist`.

* right-click on the plist inspector, and select add row
* in the key field, add the key for the mode you require
* say why your app makes use of location services

![alt text](http://huq.io/assets/misc/HQ_foreground2.png "Adding Info.plist keys")

**Foreground only apps**

For apps that access location services in the foreground only, add the key `NSLocationWhenInUseUsageDescription` to your `Info.plist`. Then in your class, `#import <CoreLocation/CoreLocation.h>` as normal, configure `CLLocationManager` as you wish and remember to call `+whenInUseAuthorizationwhen` you're ready to go.

**Foreground and background apps**

For apps that access location services in the background too, add the key `NSLocationAlwaysUsageDescription` to your `Info.plist`. Then in your class, `#import <CoreLocation/CoreLocation.h>` as normal, configure `CLLocationManager` as you wish and remember to call `+requestAlwaysAuthorization` when you're ready to go.

---

### Testing

SourceKit from Huq makes use of APIs that are not available in the simulator. To test your integration of the SourceKit framework, set `-inDebugMode:YES` and test **on your device** while **connected to WiFi**.

---

### Advanced usage

You can overlay Huq Industries' Physical Insight events with your own by adding `Custom Events`, arbitrary tags to describe what your user is doing in your app.  For example, you might interest you to know that *'most users* `[carry out a certain action in-app]` *when they're* `[at home, or at work, or wheverver]`'. The following example shows how you layer Huq’s Insight events with your own Custom Event tags to indicate what a user was doing in your app at that time.

```objective-c
#import <SourceKit/SourceKit.h>

// Create an String that describes a user action(s)
static NSString *kUserCheckingOut = @"User [doing something] in my app";
```
```objective-c
/*
 * Create an Array of custom tags that you'd like to see
 * against Huq's physical insight data
 */
NSArray *myTags = [NSArray arrayWithObjects:kUserCheckingOut, nil];

// Then push those tags up
[[HISourceKit sharedKit] logCustomEventWithTags:@[kUserCheckingOut]];
```
**Note:**  Custom Events are implemented on a one-time basis, and reset after each event request has been submitted to Huq Industries.

---

### End-user opt-out

Huq takes privacy seriously and while the data that SourceKit collects is anonymised, Huq does offer the means for you to stop collecting data from a user in response, for example, to a user selecting an ‘opt-out’ feature that you may wish to implement.

```objective-c
#import <SourceKit/SourceKit.h>
```
And then simply call:

```objective-c
[[HISourceKit sharedKit] stopRecording];
```
Calling `-stopRecording` will destroy the instance of SourceKit that you originally created by calling `-recordWithAPIKey:inDebugMode:`.  If you wish to restart SourceKit at any time, simply call `-recordWithAPIKey:inDebugMode:` again as you did the first time.

***

### Additional support

Huq Insights are refreshed *at least* once every 24 hours. If after logging in to your Insights Dashboard after 24 hours you cannot see any data, then please check the following:

* that you have been testing on a device
* that your device OS version is iOS 8.0+
* that you have enabled location services
* that you have been testing over WiFi

To stimulate generating insight events more frequently testing on the device, navigate in `Xcode` to `Debug` > `Simulate location` > `[select different city]` or `Add GPX file` to simulate movement.

If you have any other questions please reach out to help@huq.io.

***

### Licence

This SourceKit SDK is Copyright 2014-2015 Huq Industries Limited. This SDK is licensed under the Huq Physical Insights Platform Terms of Service, found on the Huq Industries website [here][hq6] (the "License"). You may not use this SDK unless (1) you have registered for an account with Huq, (2) are in possession of a valid API Key from Huq, (3) have agreed the terms of the Licence and (4) are in compliance with the License. Any unauthorised use of this SDK constitutes copyright infringement and violation of law.

   [hq1]: <http://huq.io/beta.html>
   [hq2]: <http://huq.io>
   [hq3]: <http://huq.io/assets/libs/SourceKit_1.0.3.zip>
   [hq4]: <https://developers.google.com/android/guides/setup>
   [hq5]: <https://developer.android.com/guide/topics/location/strategies.html#MockData>
   [hq6]: <http://huq.io/beta.html>

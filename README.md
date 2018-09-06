# RunACR iOS - Sound Recognition SDK.

RunACR SDK allows your mobile app to recognize sounds and display interactive content synchronized with what your users hear at that particular moment (like Shazam).

As of September 1st, 2018 SDK supports live streams. You can use SDK for recognizing TV and radio stations. You can also purchase SDK source codes for iOS, Android, and Web Server for unlimited use in your projects. Contact us at support@runacr.com to learn details.

![RunACR screen](http://runacr.com/images/2screen.png "RunACR")



## Requirements

- iOS 8+,
- ARC.

## Installation

1. Drag the `RunACRSDK.framework` module to your project. When prompted, select Copy items into destination group's folder.  
2. Go to the General settings tab of your target settings and add the framework to the Embedded Binaries section. 
3. For iOS 10, add description `NSMicrophoneUsageDescription` to your .plist file. 
4. Import the module using `@import RunACRSDK;` in order to use the library. 
5. The RunACRSDK must be initialized in AppDelegate's, application:didFinishLaunchingWithOptions: method 
``` objective-c
[[RunACR sharedInstance] initializeWithAPIKey:@"API_KEY"];
```
Add impression database file that you downloaded from runacr.com and specify it in the updateDatabasePath method:
``` objective-c
[[RunACR sharedInstance] updateDatabasePath:path];
```
Specify delegate `RunACRDelegateRunACRDelegate`:
``` objective-c
[RunACR sharedInstance].delegate = self;
```
Define two methods of RunACRDelegate protocol: 
`didRecognize` — to receive the result of recognition processing. 
`didNotRecognize` — to be called in case of recognition failure.
``` objective-c
#pragma mark - RunACRDelegate
-(void)didRecognize:(int)trackId absoluteTimeOffset:(float)absoluteTimeOffset relativeTimeOffset:(float)relativeTimeOffset{

    int seconds = (int)relativeTimeOffset % 60;
    int minutes = ((int)relativeTimeOffset / 60) % 60;
    int hours = relativeTimeOffset / 3600;

    NSString *str = [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];

    if (trackId == 6){
        // David Bowie - The Stars 00:02:43
        _myLabel.text = [NSString stringWithFormat:@"David Bowie - The Stars %@",str];
    } else if (trackId == 7){
        // The Rolling Stones - Sympathy For The Devil 00:03:26
        _myLabel.text = [NSString stringWithFormat:@"The Rolling Stones - Sympathy For The Devil %@",str];
    }
}


-(void)didNotRecognize{
    // Not found. Try again.
    [[RunACR sharedInstance] startRecognize];
}
```
To start recognition processing, call the startRecognize method.
``` objective-c
[[RunACR sharedInstance] startRecognize];
```


## Contact

Andrei Solovjev

- http://runacr.com
- Android version: http://runacr.com/download
- https://github.com/andrei200287
- andrei@solovjev.com
- http://solovjev.com

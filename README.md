# Affinitas 
This application is fetching all user list from API that is provided by nischenspringer.de.

## Project Structure 
Here is the file project structure that I created; 
```sh
Core

|.Plist -> Provide the MobileBaseUrl
|.Model
|..Detail -> Provide the user detail model object which is extended JSONModel 
|..List -> Provide the user list model object which is extended JSONModel
|..AFMobileApiManager --> Provide the generic GET calls which enable to fetch the data that comes from API 
|.View --> Provide the storyboard
|.Controller
|..CustomCells -> I have designed custom cells which used on user list and user detail view controller. All cells are setted by auto-layout constants. 
|..ViewController(s)
```

## Cocoapods library

This application is currently used with the following plugins
```sh
pod 'AFNetworking', '~> 2.0'
pod 'JSONModel', '~> 1.1'
pod 'ISO8601', '~> 0.3'
pod 'ActionSheetPicker-3.0', '~> 2.0.1'
pod 'MBProgressHUD', '~> 0.9.1'
pod 'DKHelper', '~> 0.9.5'
pod 'MagicalRecord'
pod 'SDWebImage', '~>3.7'
pod 'KASlideShow'
```

## Additional Notes
```sh
1. You can set the VERBOSE_FLAG(s) that described in AFDefines_h to watch the JSON data on the console
   DKLog(K_VERBOSE_MOBILE_API_JSON, @"User List --> {%@}",user);
2. All api operations are performed in APIManager and it is always forwarding the response data to view controller,
3. Then the viewcontroller passed the user objects to the related custom cells. 
```

##Screenshots:
###User Feed View :
![alt tag] (https://github.com/onurunal1/affinitias/blob/master/List2.png)
###User Detail Feed View:
![alt tag] (https://github.com/onurunal1/affinitias/blob/master/Detail.png)
###User Photo View:
![alt tag] (https://github.com/onurunal1/affinitias/blob/master/photo.png)


<p align="center">
  <img src="https://raw.githubusercontent.com/RAJAMOHAN-S/rajamohan-s.github.io/master/SNet/logo.png">
</p>
<p>
Swift Net is a URLSession  for making URL Request for iOS and macOS platforms.
</p>

## Requirements

- iOS 8.0+
- macOS 10.9+
- Xcode 10.1+

## Installation

### Using Cocoapods

```ruby
pod 'SNet', '~> 1.0' #Swift 4.2.1
```

#### Manually
1. Download and drop [Source](https://github.com/RAJAMOHAN-S/SNet/tree/master/SNet/Source) folder in your project.  
2. Congratulations! 

## Usage

#### Import SNet 
``` swift
import SNet
```
#### Variables 
``` swift
let urlString = "https://rajamohan-s.github.io/test/web.json"
var headers:[String:String]?
let method = HTTPMethod.GET
```
#### Use dictionary type
``` swift
var data:[String:String]?
```
#### Use Data type
``` swift
var data:Data?
```
#### Make request
``` swift

SNet.request(urlString, data: data, headers: headers, method:method) { (result) in

    if let error = result as? String{
        print("Error:",error)
        return
    }

    if let array = result as? [String]{
        print("Object:",array)
    }

}
```
#### Debugging

To use mode  then use ``SNet.mode`` under ``didFinishLaunchingWithOptions``  under ``AppDelegate`` class to print all reaquest informations in console. Default mode is ``debug``.

``` swift
SNet.mode = .debug
```

#### Release

``` swift
SNet.mode = .release
```

## Contribute
I would love you for the contribution to **SNet**, check the [LICENSE](https://github.com/RAJAMOHAN-S/SNet/blob/master/LICENSE.md) file for more info.

## Meta

Rajamohan S – (https://rajamohan-s.github.io/)

Distributed under the MIT license. See [LICENSE](https://github.com/RAJAMOHAN-S/SNet/blob/master/LICENSE.md) for more information.





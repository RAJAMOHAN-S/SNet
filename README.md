<p align="center">
  <img src="https://rajamohan-s.github.io/swiftnet/logo.png">
</p>
<p>
Make simple URL request with SNet for macOS & iOS.
</p>

## Requirements

- iOS 8.0+
- Xcode 10.1+

## Installation

### Using Cocoapods

```ruby
pod 'SNet', '~> 0.0.1' #Swift 4.2.1
```

#### Manually
1. Download and drop ```Source``` folder in your project.  
2. Congratulations! 

## Usage example

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
    print("Result:",result)
}
```
## Contribute
We would love you for the contribution to **SNet**, check the ``LICENSE`` file for more info.

## Meta

Rajamohan S – (https://rajamohan-s.github.io/)

Distributed under the MIT license. See ``LICENSE`` for more information.

[https://github.com/RAJAMOHAN-S/SNet](https://github.com/RAJAMOHAN-S)



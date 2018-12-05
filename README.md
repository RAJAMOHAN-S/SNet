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

``` swift
import SNet
SNet.request("https://rajamohan-s.github.io/test/web.json", data: nil, headers: nil, method:.GET) { (result) in

print("Result:",result)
}
```

//
//  SNet.swift
//  SNet
//
//  Created by Rajamohan S, Independent Software Developer on 27/11/18.
//  Copyright (c) 2018 Rajamohan S. All rights reserved.
//
//  See https://rajamohan-s.github.io/ for author information.
//

import Foundation

public class SNet:URLSession{
    
    public static var mode = SNetMode.debug
    
    //MARK:- Make Simple URLRequest
    
    public class func request(_ urlString:String,data:Any?,headers:[String:String]?,method:HTTPMethod,handler:@escaping(_ result:Any)->Swift.Void){
        
        guard let url = URL(string:urlString) else {
            handler("Invalid URL!")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        var body:String?
        
        if let parameters = data as? [String:String]{
            parameters.forEach { (key,value) in
                
                let kvp = key+"="+value
                body = body == nil ? kvp : body!+"&"+kvp
            }
        }
        
        if let b  = body{
            
            if method == .GET{
                let newURL = URL(string: (urlString+"?"+b.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!).trimmingCharacters(in: .whitespacesAndNewlines))!
                request = URLRequest(url: newURL)
            }else{
                request.httpBody = b.data(using: .utf8)
            }
        }else if let d = data as? Data{
            request.httpBody = d
        }
        
        request.allHTTPHeaderFields = headers
      
       if self.mode == .debug{
            print("\n==============================\n")
            print("URL:",request.url!.absoluteString)
            print("Headers:",request.allHTTPHeaderFields ?? "Nil")
            print("Method:",request.httpMethod ?? "Nil")
            print("Body:",request.httpBody != nil ? String.init(data: request.httpBody!, encoding: .utf8) ?? "Nil" : "Nil")
            print("\n==============================\n")
        }
        
        let task = self.shared.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.async {
                
                guard error == nil else{
                    
                    handler(error!.localizedDescription)
                    return
                }
                
                if let data = data{
                    
                    do{
                        
                        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                        handler(json)
                    }catch{
                        
                         if self.mode == .debug{
                            print("============= Error =============")
                            print("URL:",urlString)
                            
                            var parameters:String?
                            if let data = request.httpBody{

                                let stringValue = String.init(data: data, encoding: .utf8)
                               parameters  = stringValue?.replacingOccurrences(of: "[", with: "{").replacingOccurrences(of: "]", with: "}")
                            }
                            print("Body:",parameters ?? "Nil")
                            print("Response:",String.init(data: data, encoding: .utf8) ?? "Nil")
                            print("============= Error =============")
                        }
                        
                        handler(error.localizedDescription)
                    }
                }else{
                    if self.mode == .debug{
                        print("============= Unknown Exception =============")
                        print("URL:",urlString)
                        var parameters:String?
                        if let data = request.httpBody{
                            
                            let stringValue = String.init(data: data, encoding: .utf8)
                            parameters  = stringValue?.replacingOccurrences(of: "[", with: "{").replacingOccurrences(of: "]", with: "}")
                        }
                        print("Body:",parameters ?? "Nil")
                        print("Response  data is nil")
                        print("============= Unknown Exception =============")
                    }
                    handler("Empty data!")
                }
            }
            
        }
        task.resume()
    }
}

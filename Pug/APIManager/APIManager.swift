//
//  APIManager.swift
//  Pug
//
//  Created by Philip Starner on 1/25/18.
//  Copyright © 2018 Philip Starner. All rights reserved.
//
// https://pugme.herokuapp.com/bomb?count=50

import Alamofire
import SwiftyJSON

class APIManager {
    
    //Singleton class to speak to whenever and whereever we need
    static var sharedInstance = APIManager()
    
    init() {
        //no local items to initialize yet.
    }
    
    /// get a random list of 'n' pugs
    /// GET https://pugme.herokuapp.com/bomb?count=50
    /// :param: count - count of items to retrieve
    /// :param: callback: onCompletion '[String]' data.
    func getPugs(count: Int, onCompletion: ((_ pugURL: [String]?, _ error: Error?) -> Void)?) {
        
        let requestString = (Constants.Host + "?count=\(count)")
        
        Alamofire.request(requestString).responseJSON { (response) in
            if let data = response.data {
                do {
                    let json = try JSON.init(data: data)
                    let list = PugList(json: json)
                    onCompletion!(list.pugs, nil)
                } catch {
                    print("Error: \(error.localizedDescription)")
                    onCompletion!(nil, error)
                }
            } else {
                print("Error: response data no good)")
                onCompletion!(nil, nil)
            }
        }
        
    }
    
    
    
}

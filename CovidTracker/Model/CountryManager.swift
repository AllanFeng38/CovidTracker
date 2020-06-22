//
//  coinManager.swift
//  CryptoTracker
//
//  Created by Allan Feng on 6/18/20.
//  Copyright © 2020 Allan Feng. All rights reserved.
//

import Foundation


struct CoinManager {
    

    
    let currencyArray = [ "World","USA","Spain","Russia","UK","Italy","Brazil","France","Germany","Turkey"]
    
    func getCoinPrice(for currency: String){
        //create https url
        let urlString = "https://corona-virus-stats.herokuapp.com/api/v1/cases/countries-search"
        if let url = URL(string: urlString){
            //create the session
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data,response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                //convert the data to a string
                let dataAsString = String(data: data!, encoding: .utf8)
                print(dataAsString)
            }
            //start the task to fetch data
            task.resume()
            
        }
    }

    
}

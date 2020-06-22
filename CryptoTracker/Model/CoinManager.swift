//
//  coinManager.swift
//  CryptoTracker
//
//  Created by Allan Feng on 6/18/20.
//  Copyright © 2020 Allan Feng. All rights reserved.
//

import Foundation


struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "D5991F1A-4AFF-4508-A17F-D30258BC2C2A"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String){
        //add apikey to baseURL
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
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

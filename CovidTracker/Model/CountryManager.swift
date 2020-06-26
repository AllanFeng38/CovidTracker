//
//  coinManager.swift
//  CryptoTracker
//
//  Created by Allan Feng on 6/18/20.
//  Copyright © 2020 Allan Feng. All rights reserved.
//

import Foundation


struct CountryManager {
    

    
    let countryArray = [ "World","USA","Spain","Russia","UK","Italy","Brazil","France","Germany","Turkey"]
    
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
    
    func parseJSON(_ data: Data) -> Int? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CovidData.self, from: data)
            let lastCases = decodedData.total_cases
            print(lastCases)
            return lastCases
            
        } catch {
            print(error)
            return nil
        }
    }

    
}

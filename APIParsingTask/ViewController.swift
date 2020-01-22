//
//  ViewController.swift
//  APIParsingTask
//
//  Created by U.M. Hamidul islam on 1/22/20.
//  Copyright © 2020 U.M. Hamidul islam. All rights reserved.
//

import UIKit
/*struct  Country: Decodable {
    let name: String
    let capital: String
    let region: String
    } */
struct Weather {
    fields
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       /* let url = "https://restcountries.eu/rest/v2/all"
        let ulrObj = URL(string: url)
        URLSession.shared.dataTask(with: ulrObj!) {(data, responds, error) in
            do{
                var countries = try JSONDecoder().decode([Country].self, from:
                    data!)
                for country in countries {
                    print(country.name + ": " + country.capital + " Region is: " + country.region)
                    
                }
            } catch{
                print("We got an error")
            }
        }.resume() */
        
        let decoder = JSONDecoder()
        AF.request("https://api.darksky.net/forecast/e03fba5c687227d65dd03e52b231c81d/37.8267,-122.4233").validate().responseJSON { response in
            
            do{
                
                
                let weather = try self.decoder.decode(Weather.self, from: response.data! )
                print(weather.latitude!)
                self.latitudeLabel.text = String(weather.latitude!)
                self.longitudeLabel.text = String(weather.longitude!)
                self.timezoneLabel.text = weather.timezone
                
            }catch{
                
                print("error here")
            }
        
    }


}


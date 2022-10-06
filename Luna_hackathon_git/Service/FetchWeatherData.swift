//
//  FetchWeatherData.swift
//  Luna_hackathon_git
//
//  Created by 강현수 on 2022/10/06.
//

import UIKit
import Alamofire
import Kingfisher

struct FetchWeatherData {
    private let APIKEY = "b2496313fc689b8efd72b0ca5a4d2333"
    func fetchData(cityName: String, completionHandler: @escaping (Weather?, AFError?) -> Void) {
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(APIKEY)"
        DispatchQueue.global().async {
            AF
                .request(url)
                .responseDecodable(of: Weather.self) { response in
                    switch response.result {
                    case .success(let data):
                        DispatchQueue.main.async {
                            completionHandler(data, nil)
                        }
                    case .failure(let error):
                        DispatchQueue.main.async {
                            completionHandler(nil, error)
                        }
                        print(error.localizedDescription, "000")
                    }
                }
        }
    }
}

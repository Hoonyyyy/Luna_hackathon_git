//
//  Weather.swift
//  Luna_hackathon_git
//
//  Created by 강현수 on 2022/10/06.
//

import Foundation

struct Weather: Decodable {
    let weatherInfo: [WeatherInfo]
    let tempInfo: TempInfo
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case weatherInfo = "weather"
        case tempInfo = "main"
        case name
    }
}

struct WeatherInfo: Decodable {
    let id: Int
    let main: String
    let desc: String
    private let icon: String
    var iconURL: URL? { URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png") }
    
    enum CodingKeys: String, CodingKey {
        case id
        case main
        case desc = "description"
        case icon
    }
}
struct TempInfo: Decodable {
    let temp: Float
    let feelsLike: Float
    let tempMin: Float
    let tempMax: Float
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

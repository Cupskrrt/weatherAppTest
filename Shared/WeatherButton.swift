//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Luthfi Khan on 15/05/22.
//

import SwiftUI

struct WeatherButton: View{
    
    var title: String
    var textColor: Color
    var bgColor: Color
    
    var body: some View{
            Text(title)
                .bold()
                .foregroundColor(textColor)
                .frame(width: 280, height: 50)
                .background(bgColor)
                .cornerRadius(10)
                
    }
}

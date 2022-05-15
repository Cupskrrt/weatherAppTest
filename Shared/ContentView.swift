//
//  ContentView.swift
//  Shared
//
//  Created by Luthfi Khan on 15/05/22.
//
// Next kalo dh bisa harus nyobain pake weather api

import SwiftUI

struct ContentView: View {
    //Store data yang g bisa ancur
    @State private var isNight = false
    
    var body: some View {
        //ZStack pasti kepake terus karna layer pertama
        ZStack{
            //Bikin Gradient [ada banyak variasinya]
            //Binding Bool harus pake $
            BgView(isNight: $isNight)
            VStack{
                CityName(cityName: "Cuppertino, CA")
                
                MainWeather(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 45)
                
                HStack{
                    //direfactor dibikin struct baru
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temp: 40)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temp: 40)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "cloud.fill",
                                   temp: 40)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.sun.fill",
                                   temp: 40)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "cloud.sun.fill",
                                   temp: 40)
                }
                .padding()
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .black, bgColor: .white)
                }
                
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
            Text("\(temp)°")
                .foregroundColor(.white)
        }
    }
}

struct BgView: View {
    //bind isNight yang ini ke yang di @State
    @Binding var isNight: Bool
    
    
    var body: some View {
        LinearGradient(colors: [isNight ? .black : . blue , isNight ? .gray : Color("LightBlue")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}


struct CityName: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeather: View {
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 10){
            //buat ngambil icon dari sf icon harus pake systemName
            Image(systemName: imageName)
            //buat ganti warnanya jadi original
                .renderingMode(.original)
                .resizable()
            //buat ganti aspectratio jadi bener
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}


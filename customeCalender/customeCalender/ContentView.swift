//
//  ContentView.swift
//  customeCalender
//
//  Created by Dina Reda on 6/9/20.
//  Copyright © 2020 Dina Reda. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView: View {
   
   
    let daysList = CalenderController().getDates(startDate: Date(), monthsAdded: 1)
   
    var body: some View {
         GeometryReader { gp in
        NavigationView{
                ScrollView(.horizontal){
                        HStack ( spacing: 5){
                            ForEach(self.daysList) { day in
                                calenderView(day:day)
                            }
                            
                        }.frame( height: 150)
                    
                    
            }//.frame(width: 1000, height: 150)
                
           
        }
        }.onTapGesture {
           // change state closing any dropdown here
            
            
        }
    }
    
}
struct calenderView:  View {
    let day :dayItem
    var body : some View{
        VStack{
          VStack(alignment: .center, spacing: 15){//space between the below two items in vstack
            ZStack{
                Color.red
                HStack{
                    Spacer()
                    Text(day.month).font(.custom("JFFlat-Regular", size: 16)).foregroundColor(Color.white)
                    Spacer()
                    
                }.padding([.vertical,.top])
            }.background(Color.red)
            
            Text(String(day.dayNumber)).font(.custom("Rubik-Regular", size: 26))
            Text(day.dayName).font(.custom("JFFlat-Regular", size: 14)).foregroundColor(Color.red)
            Text(String(day.year)).font(.custom("JFFlat-Regular", size: 14)).padding(.bottom)
              
          }.frame(width: 100,height:150)
          .overlay(
              RoundedRectangle(cornerRadius: 15)
                  .stroke(Color.gray, lineWidth: 1)
                  .shadow(color:Color.white, radius: 0.16, x: 0, y: 0).blur(radius: 1)
        ).background(Color.white).cornerRadius(15)
        }
    }
  
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}


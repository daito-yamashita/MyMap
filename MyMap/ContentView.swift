//
//  ContentView.swift
//  MyMap
//
//  Created by daito yamashita on 2021/03/15.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State var inputText: String = ""
    
    @State var dispSearchkey: String = ""
    
    @State var dispMapType: MKMapType = .standard
    
    var body: some View {

        VStack {
            TextField("キーワードを入力してください", text: $inputText, onCommit: {
                    dispSearchkey = inputText
                    print("入力したキーワード：" + dispSearchkey)
            })
            
            .padding()
            
            ZStack(alignment: .bottomTrailing) {
                MapView(searchKey: dispSearchkey, mapType: dispMapType)
                
                Button(action: {
                    // mapTypeプロパティー値をトグル
                    // 標準 -> 航空写真 -> 航空写真+標準
                    // -> 3D Flyover -> 3D Flyover+標準
                    // -> 交通機関
                    if dispMapType == .standard {
                        dispMapType = .satellite
                    } else if dispMapType == .satellite {
                        dispMapType = .hybrid
                    } else if dispMapType == .hybrid {
                        dispMapType = .satelliteFlyover
                    } else if dispMapType == .satelliteFlyover {
                        dispMapType = .hybridFlyover
                    } else if dispMapType == .hybridFlyover {
                        dispMapType = .mutedStandard
                    } else {
                        dispMapType = .standard
                    }
                }) {
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0,
                               height: 35.0,
                               alignment: .leading)
                }
                .padding(.trailing, 20.0)
                
                .padding(.bottom, 30.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Movie Suggestion App
//
//  Created by Prem Kumar Gundu on 6/19/26.
//

import SwiftUI

struct MovieDashboard: View {
    var body: some View {
        ZStack{
            //Background
            Color(.systemGray6)
                .ignoresSafeArea()
            
            //Content
            MovieDashboardContent()
        }
    }
}

struct MovieDashboardContent: View {
    var body: some View {
        ScrollView{
            Section(content: {
                VStack(spacing: 20){
                    ForEach(0..<10){ index in
                        MovieCardView()
                    }
                }
                .padding()
            }, header:
                {
                Text("Movie Dashboard")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
            })
        }
    }
}

struct MovieCardView: View {
    var body: some View {
        HStack(spacing: 15){
            Image(systemName: "movieclapper")
                .frame(maxWidth: 50, maxHeight: .infinity)
                .background(.blue)
                .cornerRadius(5)
            
            VStack(alignment: .leading){
                Text("KGF")
                    .font(.title3)
                    .fontWeight(.bold)
                
                HStack{
                    ForEach(0..<2){ index in
                        Text("Action")
                            .padding(.horizontal, 10)
                            .background(.orange)
                            .cornerRadius(20)
                    }
                }
                
                Text("In the blood-soaked Kolar Gold Fields, Rocky's name strikes fear into his foes. While his allies look up to him, the government sees him as a threat to law and order. Rocky must battle threats from all sides for unchallenged")
                    .lineLimit(3)
                
                HStack{
                    Image(systemName: "star")
                        .foregroundStyle(.orange)
                    Text("8.2")
                        .fontWeight(.bold)
                        .foregroundStyle(.red)
                }
                
            }
            
            Text("2018")
                .font(.title3)
                .fontWeight(.medium)
            
            Image(systemName: "chevron.right")
            
        }
        .foregroundStyle(.white)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.black)
                .shadow(
                    color: .brown,
                    radius: 8,
                    x: 0,
                    y: 4
                )
        }
        .overlay{
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 0.5)
                
                
        }
        
    }
}

#Preview {
    MovieDashboard()
}

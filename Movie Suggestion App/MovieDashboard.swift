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
    let movies: [Movie] = [
        Movie(
            title: "Inception",
            genre: ["Action", "Sci-Fi", "Thriller"],
            description: "A thief who steals corporate secrets through dream-sharing technology is given the inverse task of planting an idea.",
            rating: "8.8",
            year: "2010"
        ),
        
        Movie(
            title: "The Dark Knight",
            genre: ["Action", "Drama", "Thriller"],
            description: "Batman faces the Joker, a criminal mastermind who plunges Gotham into chaos.",
            rating: "9.0",
            year: "2008"
        ),
        
        Movie(
            title: "Interstellar",
            genre: ["Adventure", "Drama", "Sci-Fi"],
            description: "A team of explorers travel through a wormhole in space to ensure humanity's survival.",
            rating: "8.6",
            year: "2014"
        ),
        
        Movie(
            title: "Avengers: Endgame",
            genre: ["Action", "Adventure", "Sci-Fi"],
            description: "The Avengers assemble once more to reverse the damage caused by Thanos.",
            rating: "8.4",
            year: "2019"
        ),
        
        Movie(
            title: "Toy Story",
            genre: ["Animation", "Comedy", "Adventure"],
            description: "Toys come to life when humans are not present, leading to fun-filled adventures.",
            rating: "8.3",
            year: "1995"
        ),
        
        Movie(
            title: "Joker",
            genre: ["Drama", "Thriller"],
            description: "A mentally troubled comedian descends into madness and becomes the Joker.",
            rating: "8.4",
            year: "2019"
        )
    ]
    var body: some View {
        ScrollView{
            Section(content: {
                VStack(spacing: 20){
                    ForEach(movies){ item in
                        MovieCardView(title: item.title, genre: Array(item.genre.prefix(2)), description: item.description, rating: item.rating, year: item.rating)
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

struct Movie: Identifiable{
    let id = UUID()
    let title: String
    let genre: [String]
    let description: String
    let rating: String
    let year: String
}

struct MovieCardView: View {
    
    let title: String
    let genre: [String]
    let description: String
    let rating: String
    let year: String
    
    var body: some View {
        HStack(spacing: 15){
            Image(systemName: "movieclapper")
                .frame(maxWidth: 50, maxHeight: .infinity)
                .background(.blue)
                .cornerRadius(5)
            
            VStack(alignment: .leading){
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                
                HStack{
                    ForEach(genre, id: \.self){ item in
                        Text(item.capitalized)
                            .padding(.horizontal, 10)
                            .background(.orange)
                            .cornerRadius(20)
                    }
                }
                
                Text(description)
                    .lineLimit(3)
                
                HStack{
                    Image(systemName: "star")
                        .foregroundStyle(.orange)
                    Text(rating)
                        .fontWeight(.bold)
                        .foregroundStyle(.red)
                }
                
            }
            
            Text(year)
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

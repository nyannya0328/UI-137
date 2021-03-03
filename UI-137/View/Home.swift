//
//  Home.swift
//  UI-137
//
//  Created by にゃんにゃん丸 on 2021/03/03.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var model : HomeViewModel
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
   
    var body: some View {
        ScrollView{
            
            HStack(alignment:.top,spacing:15){
                
                NavigationLink(destination: Main()) {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    (
                        
                        Text("Kavosoft  ")
                            .foregroundColor(.black)
                        
                        +
                        
                        Text("Amazing")
                            .foregroundColor(.gray)
                    
                    
                    
                    
                    )
                    
                    Text("#ios , #Swift UI , #Kavsoft")
                        .bold()
                    
                    Text("Nyan Nyan Maru")
                        
                        .bold()
                        .kerning(1.3)
                    
                    
                
               
                
                
                
           
            
            let coulums = Array(repeating: GridItem(.flexible(),spacing: 15), count: 2)
            
            LazyVGrid(columns: coulums, alignment: .leading, spacing: 15) {
                
                ForEach(model.Allimages.indices,id:\.self){index in
                    
                    GridItemView(index:index)
                    
                }
                
                
                
            }
            .padding(.top)
                
            }
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding()
            
        }
        .overlay(
        
            ZStack{
                
                
                if model.showImageView{
                    
                    Color.black
                        .opacity(model.bgopacity)
                        .ignoresSafeArea()
                    
                    ImageView()
                }
            }
        )
        .navigationBarHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

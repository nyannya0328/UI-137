//
//  GridItemView.swift
//  UI-137
//
//  Created by にゃんにゃん丸 on 2021/03/03.
//

import SwiftUI

struct GridItemView: View {
    
    @EnvironmentObject var model : HomeViewModel
    
    var index : Int
    var body: some View {
        Button(action: {
            
            withAnimation(.easeInOut){
                model.selectedImageID = model.Allimages[index]
                model.showImageView.toggle()
            }
            
        }) {
            
            ZStack{
                
                
                if index <= 3{
                    
                    Image(model.Allimages[index])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: getWidth(index: index), height: 150)
                        .cornerRadius(15)
                    
                }
                
                if model.Allimages.count > 4 && index == 3{
                    
                    let remaingImages = model.Allimages.count - 4
                    
                    Text("+\(remaingImages)")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .kerning(1.3)
                        
                    
                    
                }
                
               
                
            }
            
        }
    }
    
    func getWidth(index : Int) -> CGFloat{
        
        let width = getrect().width - 100
        
        if model.Allimages.count % 2 == 0{
            
            return width / 2
        }
        else{
            
            if index == model.Allimages.count - 1{
                
                
                return width
            }
            else{
                
                return width / 2
            }
            
            
            
        }
        
        
        
    }
}

struct GridItemView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}

extension View{
    
    func getrect() -> CGRect{
        
        return UIScreen.main.bounds
    }
    
}

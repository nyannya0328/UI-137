//
//  HomeViewModel.swift
//  UI-137
//
//  Created by にゃんにゃん丸 on 2021/03/03.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
 @Published var Allimages : [String] = ["p1","p2","p3","p4","p5","p6"]
    
    @Published var showImageView = false
    @Published var selectedImageID : String = ""
    
    @Published var imageViewoffset : CGSize = .zero
    
    @Published var bgopacity : Double = 1
    
    @Published var imagesScale : CGFloat = 1
    
    func onchanged(value:CGSize){
        
        imageViewoffset = value
        
        let helghegth = UIScreen.main.bounds.height / 2
        
        let progress = imageViewoffset.height / helghegth
        
       
            
            bgopacity = Double(1-(progress < 0 ? -progress : progress))
            
       
    }
    
    func onEnd(value : DragGesture.Value){
        
        var translation = value.translation.height
        
        if translation < 0 {
            
            translation = -translation
            
            
            
        }
        
        if translation < 250{
            
            
            imageViewoffset = .zero
            bgopacity = 1
        }
        else{
            
            showImageView.toggle()
            imageViewoffset = .zero
            bgopacity = 1
        }
        
        
        
    }
    
   
   
}


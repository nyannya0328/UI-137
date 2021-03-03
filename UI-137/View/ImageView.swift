//
//  ImageView.swift
//  UI-137
//
//  Created by にゃんにゃん丸 on 2021/03/03.
//

import SwiftUI

struct ImageView: View {
    @EnvironmentObject var model : HomeViewModel
    @GestureState var draggingoffset : CGSize = .zero
    
    var body: some View {
        ZStack{
            
          
            
            
            ScrollView(.init()){
                
                TabView(selection:$model.selectedImageID){
                    
                    ForEach(model.Allimages,id:\.self){image in
                        
                        
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .tag(image)
                            .scaleEffect(model.selectedImageID == image ? (model.imagesScale > 1 ? model.imagesScale : 1) : 1)
                            .offset(y: model.imageViewoffset.height)
                            .gesture(
                            
                                MagnificationGesture().onChanged({ (value) in
                                    model.imagesScale = value
                                }).onEnded({ (_) in
                                    withAnimation(.spring()){
                                        
                                        
                                        model.imagesScale = 1
                                    }
                                })
                                
                                .simultaneously(with: TapGesture(count: 2).onEnded({
                                    
                                    withAnimation{
                                        
                                        model.imagesScale = model.imagesScale > 1 ? 1 : 10
                                    }
                                    
                                    
                                }))
                            
                            
                            )
                        
                    }
                    
                    
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .overlay(
                
                    Button(action: {
                        
                        model.showImageView.toggle()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.5))
                            .clipShape(Circle())
                        
                        
                    })
                    .padding(10)
                  .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .opacity(model.bgopacity)
                    
                    
                    ,alignment: .topTrailing
                    
                
                )
            }
            .ignoresSafeArea()
            
        }
        .gesture(DragGesture().updating($draggingoffset, body: { (value, outvalue, _) in
            
            outvalue = value.translation
            model.onchanged(value: draggingoffset)
            
            
        }).onEnded(model.onEnd(value:)))
        .transition(.move(edge: .bottom))
        
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}

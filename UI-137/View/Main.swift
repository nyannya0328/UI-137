//
//  Main.swift
//  UI-137
//
//  Created by にゃんにゃん丸 on 2021/03/03.
//

import SwiftUI

struct Main: View {
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    @State var currentpage = 1
    var body: some View {
        ScrollView(.init()){
           
            TabView{
                GeometryReader{proxy in
                    
                    let screen = proxy.frame(in:.global)
                    
                    let offset = screen.minX
                    let scale = 1 + (offset / screen.width)
                    
                    TabView(selection:$currentpage){
                        
                        ForEach(1...6,id:\.self){index in
                            
                            Image("p\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: getrect().width)
                                .cornerRadius(1)
                                .modifier(VerticalModefiy(screen: screen))
                                .tag(index)
                               
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .rotationEffect(.init(degrees: 90))
                    .frame(width: screen.width)
                    .scaleEffect(scale >= 0.88 ? scale : 0.88,anchor:.center)
                    .offset(x: -offset)
                    .blur(radius:(1-scale) * 30)
                }
                DetailView(currentpage: $currentpage)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
              
            
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}

struct DetailView : View{
    @Binding var currentpage : Int
    
    var body: some View{
        
        VStack(spacing:15){
            
            
            Text("Detatil")
                .font(.title)
                .bold()
                .foregroundColor(.black)
                .kerning(1)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top ?? 15)
            
            
            Image("p\(currentpage)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .padding(20)
                .padding(.vertical)
                .cornerRadius(15)
            
            
            VStack(alignment: .leading, spacing: 15) {
                
                
                Text("Dark")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                
                (
                Text("By  ")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    
                    +
                    
                    Text("Nyan Nyan丸")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .kerning(1.5)
                    
                
                
                )
                
              
                
                
                NavigationLink(destination: Home()) {
                    
                    Text("Go Home")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal,10)
                        .frame(maxWidth: .infinity)
                        .background(
                        
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)),lineWidth: 5)
                        
                        )
                    
                }
                .padding(.top,20)
                
                Button(action: {}) {
                    
                    Text("Create 2021")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal,10)
                        .frame(maxWidth: .infinity)
                        .background(
                        
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(#colorLiteral(red: 0.3649502993, green: 0.4379073977, blue: 1, alpha: 1)),lineWidth: 6)
                        
                        )
                    
                }
                .padding(.top,30)
                
                
                
                
            }
            
            Spacer(minLength: 0)
            
            
        }
        .padding()
        .background(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)).ignoresSafeArea())
        
        
        
    }
}

struct VerticalModefiy : ViewModifier {
    let screen : CGRect
    
    func body(content: Content) -> some View {
        return content
            .frame(width: screen.width, height: screen.height)
            .rotationEffect(.init(degrees: -90))
            .frame(width: screen.height, height: screen.width)
    }
}

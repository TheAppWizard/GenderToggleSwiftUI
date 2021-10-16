//
//  ContentView.swift
//  GenderToggleSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 16/10/21.
//  The App Wizard
//  Instagram : theappwizard2408




import SwiftUI


struct ContentView: View {
    var body: some View {
        GenderView()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}























struct GenderView: View {
    
    @State var gender = false
    
    var body: some View {
        ZStack {
            
            self.gender ?
            
            Color.blue.opacity(0.5).edgesIgnoringSafeArea(.all)
            :
            Color.pink.opacity(0.5).edgesIgnoringSafeArea(.all)
            
            
            self.gender ?
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.white.opacity(0.9))
                .blur(radius: 4)
                .frame(width: 350, height: 350)
                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black.opacity(0.1), lineWidth: 5))
                .shadow(color: Color.blue.opacity(0.5), radius: 5, x: 0, y: 0)
            
            :
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.white.opacity(0.9))
                .blur(radius: 4)
                .frame(width: 350, height: 350)
                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black.opacity(0.1), lineWidth: 5))
                .shadow(color: Color.pink.opacity(0.5), radius: 5, x: 0, y: 0)
            
            VStack{
                ZStack{
                self.gender ?
                    
                 Text("M A L E").font(.largeTitle).fontWeight(.thin).foregroundColor(.black)
                       
                    
                
                : Text("F E M A L E").font(.largeTitle).fontWeight(.thin).foregroundColor(.black)
                     
                }
                .offset(x: 0, y: -30)
                
               
                
                ZStack{
                    
                    
                    if gender {
                        MaleArrow(colorM: Color.blue)
                            .rotationEffect(.degrees(-139))
                            .offset(x: 75, y: -49)
                        CustomSwitch(gender: $gender , colorG: Color.blue)
                      }
                   
                    else{
                        FemaleArrow(colorF: Color.pink)
                            .offset(x: -35, y: 60)
                        CustomSwitch(gender: $gender , colorG: Color.pink)
                       }
                        
                    }
               }
          }
    }
}



struct CustomSwitch: View {
    
    @Binding var gender : Bool
    @State var colorG = Color.white
    
    
    var body: some View {
        ZStack {
            Capsule().fill(Color.gray.opacity(0.2)).frame(width: 170, height: 90)
                .overlay(Capsule().stroke(Color.gray.opacity(0.2), lineWidth: 3))
            
            HStack{
                
                if gender {
                    Spacer()

                }
        
                
            ZStack{
               Circle().fill(Color.clear)
                    .frame(width: 70, height: 70)
                    .overlay(Circle().stroke(colorG, lineWidth: 8))
                
            }
            .padding(.horizontal)
            .onTapGesture {
                self.gender.toggle()
            }
                
                if !gender {
                    Spacer()
                }
            
            }
            .frame(width: 170, height: 70)
        }
    }
}


struct FemaleArrow: View {
    
    @State var colorF = Color.white
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(colorF)
                .frame(width: 8, height: 50)
            
            Rectangle()
                .foregroundColor(colorF)
                .frame(width: 8, height: 30)
                .offset(x: -5, y: 0)
                .rotationEffect(.degrees(90))
            
            
        }
        
    }
    
}

struct MaleArrow: View {
    
    @State var colorM = Color.white
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(colorM)
                .frame(width: 8, height: 50)
            
            
            Triangle()
                .fill(colorM)
                .frame(width: 30, height: 30)
                .rotationEffect(.degrees(180))
                .offset(x: 0, y: 20)
            
            
        }
        
    }
    
}


struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

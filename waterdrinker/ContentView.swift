//
//  ContentView.swift
//  waterdrinker
//
//  Created by Vineeth on 23/05/21.
//

import SwiftUI

let bottleColor = Color(red: 0, green: 0.5, blue: 0.75, opacity: 0.5)
let buttonColor = Color(red: 0, green: 0.5, blue: 0.75, opacity: 0.5)
let gradientStart = Color(UIColor(hex: "#59BAFDEE")!)
let gradientEnd = Color(UIColor(hex: "#8ED0FDEE")!)



struct ContentView: View {
    
    @State private var percent = 0.0
    @State private var isOpen = true
    
    private var totalml:CGFloat = 3700
    @State private var waterml:CGFloat = 0
    
    
    var body: some View {
        GeometryReader { metric in
            
            ZStack {
                VStack {
                    CircleWaveView(percent: Int(percent))
                        .frame(width: .infinity, height: .infinity, alignment: .center)
                        .ignoresSafeArea()
                }
                VisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.light))
                    .frame(width: .infinity, height: .infinity, alignment: .center)
                    .opacity(isOpen ? 1 : 0)
                    .animation(.easeInOut)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    VStack{
                        Button(action: {
                            isOpen = !isOpen
                        }, label: {
                            Text("+")
                                .font(Font.system(size: 50))
                                .foregroundColor(Color.white)
                                .padding(.bottom, 7)
                        })
                    }
                    .multilineTextAlignment(.center)
                    .frame(width: 50, height: 50, alignment: .center)
                    .background(buttonColor)
                    .clipShape(Circle())
                    .rotationEffect(.degrees(isOpen ? 135 : 0))
                    .animation(.easeInOut(duration: 0.25))
                }
                VStack{
                    Spacer()
                    VStack(alignment: .center, spacing: 5) {
                        Button(action: {
                            waterml = waterml + 500
                            percent = Double(min(Int(self.waterml / self.totalml * 100), 100))
                            isOpen = !isOpen
                        }, label: {
                            HStack {
                                Image("water-bottle")
                                    .resizable()
                                    .frame(width: 40, height: 40, alignment: .center)
                                    .foregroundColor(.white)
                                Text("500 ml")
                                    .font(Font.system(size: 35))
                                    .foregroundColor(.white)
                            }
                        })
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100, alignment: .center)
                    .background(LinearGradient(
                                    gradient: Gradient(colors: [gradientStart, gradientEnd]),
                                    startPoint: .leading,
                                    endPoint: .trailing))
                    .cornerRadius(20)
                    .padding(.horizontal, 50)
                    .opacity(isOpen ? 1 : 0)
                    .animation(Animation.easeIn(duration: 0.25).delay(0.5))
                    VStack(alignment: .center, spacing: 5) {
                        Button(action: {
                            waterml = waterml + 250
                            percent = Double(min(Int(self.waterml / self.totalml * 100), 100))
                            isOpen = !isOpen
                        }, label: {
                            HStack {
                                Image("water-glass")
                                    .resizable()
                                    .frame(width: 40, height: 40, alignment: .center)
                                    .foregroundColor(.white)
                                Text("250 ml")
                                    .font(Font.system(size: 35))
                                    .foregroundColor(.white)
                            }
                        })
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100, alignment: .center)
                    .background(LinearGradient(
                                    gradient: Gradient(colors: [gradientStart, gradientEnd]),
                                    startPoint: .leading,
                                    endPoint: .trailing))
                    .cornerRadius(20)
                    .padding(.horizontal, 50)
                    .opacity(isOpen ? 1 : 0)
                    .animation(Animation.easeIn(duration: 0.25).delay(0.25))
                    VStack(alignment: .center, spacing: 5) {
                        Button(action: {
                            waterml = waterml + 100
                            percent = Double(min(Int(self.waterml / self.totalml * 100), 100))
                            isOpen = !isOpen
                        }, label: {
                            HStack {
                                Image("water-drop")
                                    .resizable()
                                    .frame(width: 40, height: 40, alignment: .center)
                                    .foregroundColor(.white)
                                Text("100 ml")
                                    .font(Font.system(size: 35))
                                    .foregroundColor(.white)
                            }
                        })
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100, alignment: .center)
                    .background(LinearGradient(
                                    gradient: Gradient(colors: [gradientStart, gradientEnd]),
                                    startPoint: .leading,
                                    endPoint: .trailing))
                    .cornerRadius(20)
                    .padding(.horizontal, 50)
                    .opacity(isOpen ? 1 : 0)
                    .animation(Animation.easeIn(duration: 0.25))
                    Spacer()
                }
                .frame(width: .infinity, height: .infinity, alignment: .center)
                .opacity(isOpen ? 1 : 0)
                .animation(.easeInOut)
                //                .background(Color.red)
                //                Slider(value: self.$percent, in: 0...100)
            }
            //            .padding(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let bottleWidthHalf:CGFloat = rect.width / 10
            let bottleNeakHeight:CGFloat = rect.height / 6
            let bottleSholderHeight:CGFloat = bottleNeakHeight + 10
            
            let p1 = CGPoint(x: rect.width / 2 - bottleWidthHalf, y: 0)
            let p2 = CGPoint(x: rect.width / 2 - bottleWidthHalf, y: bottleNeakHeight)
            let p3 = CGPoint(x: 0, y: bottleSholderHeight)
            let p4 = CGPoint(x: 0, y: rect.height)
            
            
            let p5 = CGPoint(x: rect.width, y: rect.height)
            let p6 = CGPoint(x: rect.width, y: bottleSholderHeight)
            let p7 = CGPoint(x: rect.width / 2 + bottleWidthHalf, y: bottleNeakHeight)
            let p8 = CGPoint(x: rect.width / 2 + bottleWidthHalf, y: 0)
            let p9 = CGPoint(x: rect.width / 2 + bottleWidthHalf, y: 50)
            
            path.move(to: p1)
            
            path.addArc(tangent1End: p1, tangent2End: p2, radius: 0)
            path.addArc(tangent1End: p2, tangent2End: p3, radius: 0)
            path.addArc(tangent1End: p3, tangent2End: p4, radius: 50)
            path.addArc(tangent1End: p4, tangent2End: p5, radius: 0)
            path.addArc(tangent1End: p5, tangent2End: p6, radius: 0)
            path.addArc(tangent1End: p6, tangent2End: p7, radius: 50)
            path.addArc(tangent1End: p7, tangent2End: p8, radius: 0)
            path.addArc(tangent1End: p8, tangent2End: p9, radius: 0)
            path.closeSubpath()
            
        }
    }
}

// https://stackoverflow.com/questions/63397067/fill-circle-with-wave-animation-in-swiftui
struct Wave: Shape {
    
    var offset: Angle
    var percent: Double
    
    var animatableData: Double {
        get { offset.degrees }
        set { offset = Angle(degrees: newValue) }
    }
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        // empirically determined values for wave to be seen
        // at 0 and 100 percent
        let lowfudge = 0.02
        let highfudge = 0.98
        
        let newpercent = lowfudge + (highfudge - lowfudge) * percent
        let waveHeight = 0.015 * rect.height
        let yoffset = CGFloat(1 - newpercent) * (rect.height - 4 * waveHeight) + 2 * waveHeight
        let startAngle = offset
        let endAngle = offset + Angle(degrees: 360)
        
        p.move(to: CGPoint(x: 0, y: yoffset + waveHeight * CGFloat(sin(offset.radians))))
        
        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 5) {
            let x = CGFloat((angle - startAngle.degrees) / 360) * rect.width
            p.addLine(to: CGPoint(x: x + 10, y: yoffset + waveHeight * CGFloat(sin(Angle(degrees: angle).radians))))
        }
        
        p.addLine(to: CGPoint(x: rect.width, y: rect.height))
        p.addLine(to: CGPoint(x: 0, y: rect.height))
        p.closeSubpath()
        
        return p
    }
}

struct CircleWaveView: View {
    
    @State private var waveOffset = Angle(degrees: 0)
    let percent: Int
    
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                Text("\(self.percent)%")
                    .foregroundColor(.black)
                    .font(Font.system(size: 0.25 * min(geo.size.width, geo.size.height) ))
                Rectangle()
                    .stroke(bottleColor)
                    .overlay(
                        Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: Double(percent)/100)
                            .fill(bottleColor)
                            .clipShape(Rectangle().scale(1))
                    )
            }
        }
        //        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                self.waveOffset = Angle(degrees: 360)
            }
        }
    }
}


struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

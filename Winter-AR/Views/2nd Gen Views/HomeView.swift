//
//  HomeView.swift
//  Winter-AR
//
//  Created by Brayton Lordianto on 12/24/22.
//

import SwiftUI

// 1. An option to go to the AR View
// 2. An option to go to the Gallery by WebView
struct HomeView: View {
    @State var isShowing3D = false
    @State var isShowingWebsite = false
    var body: some View {
        ZStack {
            VStack {
                welcomeText
                scrollCards
            }
            .background(iceFrameImage)
        }
        .fullScreenCover(isPresented: $isShowing3D) {
            ZStack {
                SnapshotARView().ignoresSafeArea()
                VStack { cancelButton(option: 1) }
            }
        }
        .fullScreenCover(isPresented: $isShowingWebsite) {
            ZStack {
                GalleryWebView()
                VStack { cancelButton(option: 2) }
            }

        }
    }
}

extension HomeView {
    func cancelButton(option: Int) -> some View {
        Button(action: {
            if option == 1 {
                self.isShowing3D.toggle()
            } else {
                self.isShowingWebsite.toggle()
            }
        }) {
            Image(systemName: "xmark")
                .font(.system(size: 40))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .buttonStyle(.bordered)
        .buttonBorderShape(.roundedRectangle)
        .cornerRadius(20)
        .padding()
        .padding(.top, 10)

    }
}

extension HomeView {
    var iceFrameImage: some View {
        Image("ice_frame")
            .resizable().scaledToFill()
            .ignoresSafeArea()
    }
    
    var welcomeText: some View {
        Text("Experience A Christmas\n Anywhere!")
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .font(.largeTitle)
            .padding()
        //            .background(.thinMaterial)
            .cornerRadius(12)
            .padding(.bottom)
    }
    
    var img1: Image {
        Image("close_up_tree")
    }
    
    var button1: Button<some View> {
        Button("Experience Christmas in 3D") {
            self.isShowing3D.toggle()
        }
    }
    
    var img2: Image {
        Image("christmas_gallery")
    }
    
    var button2: Button<some View> {
        Button("Check out your and \n other people's best moments!") {
            self.isShowingWebsite.toggle()
        }
    }
    
    
    func cardView(_ image: Image, _ button: Button<some View>) -> some View {
        ZStack {
            VStack {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 500)
                    .cornerRadius(16)
            }.ignoresSafeArea()
            
            button
                .multilineTextAlignment(.center)
                .font(.title3)
                .buttonStyle(GrowingButton())
                .offset(x: 0, y: 300)
            
        }
    }
    var scrollCards: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                GeometryReader { geometry in
                    cardView(img1, button1)
                        .rotation3DEffect(
                            Angle(
                                degrees: Double((geometry.frame(in: .global).minX - 20) / -20)
                            ),
                            axis: (x: 0, y: 1, z: 0),
                            anchor: .center,
                            anchorZ: 0.0,
                            perspective: 1.0
                        )
                }
                .frame(width: 300)
                .padding(.horizontal, 50)
                
                GeometryReader { geometry in
                    cardView(img2, button2)
                        .rotation3DEffect(
                            Angle(
                                degrees: Double((geometry.frame(in: .global).minX - 20) / -20)
                            ),
                            axis: (x: 0, y: 1, z: 0),
                            anchor: .center,
                            anchorZ: 0.0,
                            perspective: 1.0
                        )
                }
                .frame(width: 300)
                .padding(.horizontal, 50)
                
            }
        }
    }
}
struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

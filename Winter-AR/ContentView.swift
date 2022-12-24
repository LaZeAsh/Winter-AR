//
//  ContentView.swift
//  Winter-AR
//
//  Created by Ash on 12/23/22.
//

import SwiftUI
import RealityKit

let backgroundGradient = LinearGradient(
    colors: [Color.black], startPoint: .top, endPoint: .bottom)
struct ContentView : View {
    let txt = "Enable Augmented Reality Mode"
    @State public var enableAR = false
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // makes background black
            VStack {
                Button(txt){
                    enableAR.toggle()
                }
                if enableAR {
                    
                }
        }
    //        return         ARViewContainer().edgesIgnoringSafeArea(.all)
        }
    }
}


struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

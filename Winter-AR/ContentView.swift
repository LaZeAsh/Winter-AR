//
//  ContentView.swift
//  Winter-AR
//
//  Created by Ash on 12/23/22.
//

import SwiftUI
import RealityKit
import ARKit

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
                .buttonStyle(ButtonStyling())
        }
            .fullScreenCover(isPresented: $enableAR) {
                ZStack {
                    ARViewContainer()
                    snapshotButton
                }
            }
    //        return         ARViewContainer().edgesIgnoringSafeArea(.all)
        }
    }
}

extension ContentView {
    var snapshotButton: some View {
        Button {
            // (Placeholder): Take a snapshot
            ARVariables.arView.snapshot(saveToHDR: false) { (image) in

              // Compress the image
              let compressedImage = UIImage(data: (image?.pngData())!)

              // Save in the photo album
              UIImageWriteToSavedPhotosAlbum(compressedImage!, nil, nil, nil)

                print("hi")
            }
        } label: {
            Image(systemName: "camera")
                .frame(width:60, height:60)
                .font(.title)
                .background(.white.opacity(0.75))
                .cornerRadius(30)
                .padding()
        }
        .position(x: 200, y: 625)
//        .border(Color.gray)
    }
}


struct ButtonStyling: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .foregroundColor(Color.red)
                .padding()
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
//        let arView = ARView(frame: .zero)
        
        
        // Load the "Box" scene from the "Experience" Reality File
        let winterModel = try! ModelEntity.loadModel(named: "Tj")
        let anchor = AnchorEntity()
        anchor.addChild(winterModel)
        ARVariables.arView.scene.anchors.append(anchor)
        
        return ARVariables.arView
        
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

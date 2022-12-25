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
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    let txt = "Enable Augmented Reality Mode"
    @State public var enableAR = false
    var body: some View {
        ZStack {
            Color.teal.edgesIgnoringSafeArea(.all) // makes background blue
            
            VStack {
                Text("Winter-AR")
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 50, alignment: .center)
                    .font(.title)
                    .ignoresSafeArea(.all)
                    .position(x: 195, y: 50)
                Image("olaf")
                    .resizable()
                    .frame(width: 250, height: 500)
                    .position(x: 195, y: 100)
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
                guard let image: UIImage = image else { return }
                uploadImage(image: image)
              // Compress the image
                
//              let compressedImage = UIImage(data: (image?.pngData())!)
//
//              // Save in the photo album
//              UIImageWriteToSavedPhotosAlbum(compressedImage!, nil, nil, nil)

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
                .foregroundColor(Color.white)
                .padding()
                .controlSize(.large)
                .background(Color.mint)
                .cornerRadius(8)
                .position(x: 195, y: 170)
//                .frame(height: 69)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
//        let arView = ARView(frame: .zero)
        
       
        // Load the "Box" scene from the "Experience" Reality File
        let winterModel = try! ModelEntity.loadModel(named: "Tj")
        
        let anchor2 = try! Experience.loadBox()
        let anchor = AnchorEntity()
        anchor.scale = [20, 20, 20]
        anchor.addChild(winterModel)
        anchor.position -= [0, 3, 0]
        ARVariables.arView.scene.anchors.append(anchor)
        ARVariables.arView.scene.anchors.append(anchor2)
//        ARVariables.arView.environment.sceneUnderstanding.options = .occlusion (use it when in an open environment)
        let newTimer = Timer(timeInterval: 123, repeats: true) { newTimer in
                playSound()    // Synchronous
        }
        RunLoop.current.add(newTimer, forMode: .common)
        
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

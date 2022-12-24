//
//  ContentView.swift
//  Winter-AR
//
//  Created by Ash on 12/23/22.
//

import SwiftUI
import RealityKit
import ARKit
import AVFoundation

var player: AVAudioPlayer?

func playSound() {
    guard let url = Bundle.main.url(forResource: "music", withExtension: "mp3") else { return }

    do {
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try AVAudioSession.sharedInstance().setActive(true)

        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

        guard let player = player else { return }

        player.play()

    } catch let error {
        print(error.localizedDescription)
    }
}
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
        
        let anchor2 = try! Experience.loadBox()
        let anchor = AnchorEntity()
        anchor.scale = [20, 20, 20]
        anchor.addChild(winterModel)
        anchor.position -= [0, 1, 0]
        ARVariables.arView.scene.anchors.append(anchor)
        ARVariables.arView.scene.anchors.append(anchor2)
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

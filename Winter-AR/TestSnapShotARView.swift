//
//  TestSnapShotARView.swift
//  Winter-AR
//
//  Created by Brayton Lordianto on 12/23/22.
//

import SwiftUI
import RealityKit

struct TestSnapShotARView: View {
    var body: some View {
        ZStack {
            Text("hi")

            TestSnapShotARViewContainer()

//            snapshotButton
        }
    }
}

struct ARVariables{
    static var arView = ARView()
}



struct TestSnapShotARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
//        ARVariables.arView = ARView()

        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
//        // Add the box anchor to the scene
        ARVariables.arView.scene.anchors.append(boxAnchor)


        return ARVariables.arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
}

struct TestSnapShotARView_Previews: PreviewProvider {
    static var previews: some View {
        TestSnapShotARView()
    }
}

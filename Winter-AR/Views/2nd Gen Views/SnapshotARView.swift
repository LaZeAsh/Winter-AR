//
//  SnapshotARView.swift
//  Winter-AR
//
//  Created by Brayton Lordianto on 12/24/22.
//

import SwiftUI

struct SnapshotARView: View {
    @State var isShowingAlert = false
    var body: some View {
        ZStack {
            ARViewContainer()
            snapshotButton
        }
        .alert(isPresented: $isShowingAlert) {
            Alert(
                title: Text("Holiday Snaps!"),
                message: Text("Your snapshot is now recorded " +
                                "in the gallery and your app!")
            )
        }
    }
}

extension SnapshotARView {
    var snapshotButton: some View {
        Button {
            // (Placeholder): Take a snapshot
            ARVariables.arView.snapshot(saveToHDR: false) { (image) in
                guard let image: UIImage = image else { return }
                uploadImage(image: image)
                let compressedImage = UIImage(data: (image.pngData())!)
                UIImageWriteToSavedPhotosAlbum(compressedImage!, nil, nil, nil)
                isShowingAlert.toggle()
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
    }

}

struct SnapshotARView_Previews: PreviewProvider {
    static var previews: some View {
        SnapshotARView()
    }
}

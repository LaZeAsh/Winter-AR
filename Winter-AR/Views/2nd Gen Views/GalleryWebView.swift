//
//  GalleryWebView.swift
//  Winter-AR
//
//  Created by Brayton Lordianto on 12/24/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    var url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct GalleryWebView: View {
    var body: some View {
        WebView(url: URL(string: "https://irlsantar.netlify.app")!)
            .ignoresSafeArea()
    }
}

struct GalleryWebView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryWebView()
    }
}

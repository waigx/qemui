//
//  ImageSize.swift
//  qemui
//
//  Created by Igor Wang on 4/14/20.
//  Copyright © 2020 Yigong Wang. All rights reserved.
//

import SwiftUI

class NumberStr : ObservableObject {
    @Published var text : String
    init(_ text: String) {
        self.text = text
    }
}

struct ImageSizeSlider: View {
    @State var imageSize = 20.0
    @ObservedObject var imageSizeStr = NumberStr("20.0")
    private var minSize = 8.0
    private var maxSize = 1024.0
    
    var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .leading) {
                Text("Image Size")
                    .font(.subheadline)
                    .padding()
                HStack {
                    VStack {
                        Slider(value: self.$imageSize, in: self.minSize...self.maxSize, step: 1,
                               onEditingChanged: { _ in
                                self.imageSizeStr.text = String(self.imageSize)
                        })
                        HStack {
                            Text("\(Int(self.minSize)) GiB")
                            Spacer()
                            Text("\(Int(self.maxSize)) GiB")
                        }
                    }
                    .padding(.leading)
                    .frame(width: geometry.size.width * 0.7)
                    Divider()
                    HStack {
                        TextField("", text: Binding(
                            get: {self.imageSizeStr.text},
                            set: {
                                if (Double($0) != nil) {
                                    self.imageSizeStr.text = $0
                                } else {
                                    self.imageSizeStr.text = String($0.dropLast())
                                }
                        }), onCommit: {
                            self.imageSize = Double(self.imageSizeStr.text) ?? self.imageSize
                        })
                        Text("GiB")
                    }
                    .padding()
                    .frame(width: geometry.size.width * 0.3)
                }
            }
            .frame(height: 80)
        }
    }
}

struct ImageSize_Previews: PreviewProvider {
    static var previews: some View {
        ImageSizeSlider()
    }
}


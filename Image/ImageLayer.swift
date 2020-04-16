//
//  ImageLayer.swift
//  qemui
//
//  Created by Igor Wang on 4/14/20.
//  Copyright © 2020 Yigong Wang. All rights reserved.
//

import SwiftUI

struct ImageLayer: View {
    @State var sliderValue = 0.0
    var body: some View {
        VStack (alignment: .trailing) {
            ImageSizeSlider()
        }
        .frame(minWidth: 500, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)
    }
}

struct ImageLayer_Previews: PreviewProvider {
    static var previews: some View {
        ImageLayer()
    }
}

//
//  ContentView.swift
//  ImagePicker
//
//  Created by Buhle Radzilani on 2024/06/25.
//
import PhotosUI
import SwiftUI



struct ContentView: View {
    @State var selected: [PhotosPickerItem] = []
    //loading the contents of that image
    @State var data: Data?
    
    
    var body: some View {
        VStack{
            if let data = data, let uiimage = UIImage(data: data){
                Image(uiImage: uiimage)
                    .resizable()
            }
            Spacer()
            PhotosPicker(selection: $selected, matching: .images) {
               Text("Pick Photo")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

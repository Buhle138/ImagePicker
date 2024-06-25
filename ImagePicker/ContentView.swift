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
            PhotosPicker(selection: $selected, maxSelectionCount: 1, matching: .images) {
               Text("Pick Photo")
            }
            .onChange(of: selected) { newValue in
                guard let item = selected.first else{
                    return
                }
                item.loadTransferable(type: Data.self) { result in
                    switch result {
                    case.success(let data):
                        if let data = data {
                            self.data = data
                        }else{
                            print("Data is nil")
                        }
                    case .failure(let failure):
                       fatalError("\(failure)")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

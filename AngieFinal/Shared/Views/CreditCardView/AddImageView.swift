//
//  AddImageView.swift
//  Finance App Dark Theme
//
//  Created by Angie Kim on 5/1/23.
//

//
//  AddImageView.swift
//

import SwiftUI
import PhotosUI

struct AddImageView: View {
    @State var label:String = ""
    @State var assetName:String = ""
    @State var systemName:String = ""
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var document:Document
    
    var body: some View {
        VStack {
            ZStack {
                Image(assetName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            }
            HStack {
                Button("Add") {
                    print("AddImageView Add")
                    let _ = document.addItem(
                        label: label,
                        assetName: assetName,
                        systemName: systemName
                    )
                    dismiss()
                }
                Spacer()
                Button("Cancel") {
                    print("AddImageView Cancel")
                    dismiss()
                }
            }.padding(10)
            Form {
                TextField("Put the name of the card", text: $label)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                TextField("Put the card number", text: $assetName)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                TextField("Expiration Date (MM/YY)", text: $systemName)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)

            }
        }
    }


struct AddImageView_Previews: PreviewProvider {
    static var previews: some View {
        AddImageView()
    }
}


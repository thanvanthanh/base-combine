//
//  SearchBarView.swift
//  base-combine
//
//  Created by Thân Văn Thanh on 29/08/2023.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var text: String
    
    var body: some View {
        VStack {
            
            ZStack {
                // background
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
                    .frame(height: 36)
                
                HStack(spacing: 6) {
                    Spacer()
                        .frame(width: 0)
                    
                    // 􀊫
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    // TextField
                    TextField("Search", text: $text)
                    // 􀁑
                    if !text.isEmpty {
                        Button {
                            text.removeAll()
                        } label: {
                            Image(systemName: "xmark.circle")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 6)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant(""))
    }
}

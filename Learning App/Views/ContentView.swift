//
//  ContentView.swift
//  Learning App
//
//  Created by J M on 2/11/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count) { index in
                        NavigationLink {
                            ContentDetailView()
                                .onAppear {
                                    model.beginLesson(index)
                                }
                        } label: {
                            ContentViewRow(index: index)
                        }
                    }
                }
            }
            .accentColor(Color.black)
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}

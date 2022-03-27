//
//  ContentView.swift
//  Learning App
//
//  Created by J M on 2/9/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading){
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                
                ScrollView {
                    LazyVStack (spacing: 20) {
                        ForEach(model.modules) { module in
                            VStack (spacing: 20) {
                                NavigationLink (
                                    destination:
                                        ContentView()
                                        .onAppear {
                                            model.beginModule(module.id)
                                        },
                                    tag: module.id,
                                    selection: $model.currentContentSelected)
                                {
                                    HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                }
                                
                                NavigationLink(destination:
                                                TestView()
                                                .onAppear(perform: {
                                                    model.beginTest(module.id)
                                                }),
                                               tag: module.id,
                                               selection: $model.currentTestSelected)
                                {
                                    HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Questions", time: module.test.time)
                                }
                            }
                        }
                    }
                    .accentColor(Color.black)
                    .padding()
                }
            }
            .navigationTitle("Get Started")
            .onChange(of: model.currentContentSelected) { changedValue in
                if changedValue == nil {
                    model.currentModule = nil
                }
            }
            .onChange(of: model.currentTestSelected) { changedValue in
                if changedValue == nil {
                    model.currentModule = nil
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}

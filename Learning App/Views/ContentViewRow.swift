//
//  ContentViewRow.swift
//  Learning App
//
//  Created by J M on 2/12/22.
//

import SwiftUI

struct ContentViewRow: View {
    @EnvironmentObject var model:ContentModel
    var index:Int
    
    var lesson:Lesson {
        if model.currentModule != nil && index < model.currentModule!.content.lessons.count {
            return model.currentModule!.content.lessons[index]
        } else {
            return Lesson(id: 0, title: "Loading...", video: "Loading...", duration: "Loading...", explanation: "Loading...")
        }
    }
    
    var body: some View {
        ZStack (alignment: .leading){
            Rectangle()
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            
            HStack (spacing: 30) {
                Text(String(index + 1))
                    .bold()
                
                VStack (alignment: .leading){
                    Text(lesson.title)
                        .bold()
                    Text(lesson.duration)
                }
            }
            .padding()
        }
        .padding(.bottom, 5)
    }
}

//
//  ContentDetailView.swift
//  Learning App
//
//  Created by J M on 2/12/22.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        let lesson = model.currentLesson
        let url = URL(string: constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack {
            // MARK: Video
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            // MARK: Description
            CodeTextView()
            
            // MARK: Next Lesson Button
            if model.hasNextLesson() {
                Button {
                    model.nextLesson()
                } label: {
                    ZStack {
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }
            } else {
                Button {
                    model.currentContentSelected = nil
                } label: {
                    ZStack {
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        
                        HStack {
                            Text("Complete")
                                .foregroundColor(Color.white)
                            .bold()
                            
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(Color.white)
                        }
                    }
                }
            }

        }
        .padding()
        .navigationTitle(lesson?.title ?? "")
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}

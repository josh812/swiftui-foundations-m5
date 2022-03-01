//
//  TestResultView.swift
//  Learning App
//
//  Created by J M on 2/28/22.
//

import SwiftUI

struct TestResultView: View {
    @EnvironmentObject var model:ContentModel
    var numCorrect:Int
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(resultHeading)
                .bold()
                .font(.largeTitle)
            
            Spacer()
            
            Text("You Got \(numCorrect) out of \(model.currentModule?.test.questions.count ?? 0) Questions Correct!")
            
            Spacer()
            
            Button {
                model.currentTestSelected = nil
            } label: {
                ZStack {
                    RectangleCard(color: Color.green)
                        .frame(height: 48)
                    
                    Text("Complete")
                        .bold()
                        .foregroundColor(Color.white)
                }
            }
            .padding()
            
            Spacer()
        }
    }
    
    var resultHeading:String {
        guard model.currentModule != nil else {
            return ""
        }
        
        let pct = Double(numCorrect)/Double(model.currentModule!.test.questions.count)
        
        if pct > 0.5 {
            return "Awesome!"
        } else if pct > 0.2 {
            return "Doing Great!"
        } else {
            return "Keep Learning."
        }
    }
}

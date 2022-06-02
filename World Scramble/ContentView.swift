//
//  ContentView.swift
//  World Scramble
//
//  Created by Simran Preet Singh Narang on 2022-06-01.
//

import SwiftUI

struct ContentView: View {
    
    @State var words: [String] = []
    @State var usedWords = [String]()
    @State var rootWord = ""
    @State var newWord = ""
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit {
                addNewWord()
            }
        }
            
    }
    
    func addNewWord() {
        
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        // Extra validation to come
        
        usedWords.insert(answer, at: 0)
        newWord = ""
    }
    
    func loadFile() {
        
        guard let fileUrl = Bundle.main.url(forResource: "start", withExtension: "txt"),
              let fileContents = try? String(contentsOf: fileUrl) else { return }
        
        self.words = fileContents.components(separatedBy: "\n")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

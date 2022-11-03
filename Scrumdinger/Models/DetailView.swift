//
//  DetailView.swift
//  Scrumdinger
//
//  Created by connor dillon on 02/11/2022.
//

import Foundation
import SwiftUI

struct DetailView : View {
    let scrum: DailyScrum
    @State private var isPresentingView = false
    
    var body: some View {
        List{
            Section(header: Text("Meeting Info")){
                NavigationLink(destination: MeetingView()) {
                    Label("Stating Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("\(scrum.theme.name)")
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Attendees")){
                ForEach(scrum.attendees) {attendee in Label(attendee.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit"){
                isPresentingView = true
            }
        }
        .sheet(isPresented: $isPresentingView){
            NavigationView {
                DetailEditView()
                .navigationTitle("Edit view")
                .toolbar{
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel"){
                            isPresentingView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done"){
                            isPresentingView = false
                        }
                    }
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(scrum: DailyScrum.sampleData[0])
        }
    }
}

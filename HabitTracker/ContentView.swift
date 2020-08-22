//
//  ContentView.swift
//  HabitTracker
//
//  Created by Paul Richardson on 15.08.2020.
//  Copyright © 2020 Paul Richardson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
	@ObservedObject var habits = Habits()
	@State private var isShowingSheet = false
	
	var body: some View {
		NavigationView {
			List {
				ForEach(habits.items) { activity in
					NavigationLink(destination: ActivityView(habits: self.habits, activity: activity)) {
						Image(systemName: "\(activity.counter).circle")
						Text(activity.title)
							.font(.headline)
						Text(activity.description)
							.font(.subheadline)
					}
				}
			.onDelete(perform: removeItems)
			}
			.navigationBarTitle(Text("Habits"))
			.navigationBarItems(leading: EditButton(),
													trailing: Button(action: {
														self.isShowingSheet = true
													}) {
														Image(systemName: "plus")
			})
		}
		.sheet(isPresented: $isShowingSheet) {
			AddView(habits: self.habits)
		}
	}
	
	func removeItems(at offsets: IndexSet) {
		// TODO: This throws a fatal error
		habits.items.remove(atOffsets: offsets)
	}
	
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

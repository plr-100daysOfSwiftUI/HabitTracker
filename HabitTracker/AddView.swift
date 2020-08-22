//
//  AddView.swift
//  HabitTracker
//
//  Created by Paul Richardson on 15.08.2020.
//  Copyright © 2020 Paul Richardson. All rights reserved.
//

import SwiftUI

struct AddView: View {
	
	@Environment(\.presentationMode) var presentationMode
	@ObservedObject var habits: Habits
	@State private var title = ""
	@State private var description = ""
	
	var body: some View {
		NavigationView {
			Form {
				TextField("Title", text: $title)
				TextField("Description", text: $description)
			}
			.navigationBarTitle("Add an Activity")
			.navigationBarItems(trailing: Button("Save") {
				let activity = Activity(title: self.title, description: self.description)
				self.habits.items.append(activity)
				self.presentationMode.wrappedValue.dismiss()
			})
		}
	.padding()
	}
	
}

struct AddView_Previews: PreviewProvider {
	static var previews: some View {
		AddView(habits: Habits())
	}
}

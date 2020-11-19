//
//  ActivityView.swift
//  HabitTracker
//
//  Created by Paul Richardson on 15.08.2020.
//  Copyright © 2020 Paul Richardson. All rights reserved.
//

import SwiftUI

struct ActivityView: View {
	
	@ObservedObject var habits: Habits
	var activity: Activity
	
	fileprivate func incrementCounter() {
		var newActivity = self.activity
		newActivity.incrementCounter()
		
		if let index = self.habits.items.firstIndex(of: self.activity) {
			self.habits.items[index] = newActivity
		}
	}
	
	var body: some View {
		VStack {
			Text(activity.title)
				.font(.title)
				.padding()
			Text(activity.description)
			.padding()
			Button(action: incrementCounter) {
				Image(systemName: "\(activity.counter).circle.fill")
					.resizable()
					.scaledToFit()
					.overlay(
						Circle()
							.stroke(
								Color.secondary, lineWidth: 1.5
							))
					.frame(width: 96.0, height: 96.0)
					.foregroundColor(.green)
			}
			.padding()

			Spacer()
		}
	}
}

struct ActivityView_Previews: PreviewProvider {
	static let activity = Activity(id: UUID(), title: "test", description: "this is a test", counter: 0)
	static var previews: some View {
		ActivityView(habits: Habits(), activity: activity)
	}
}

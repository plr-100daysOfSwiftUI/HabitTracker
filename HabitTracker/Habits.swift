//
//  Habits.swift
//  HabitTracker
//
//  Created by Paul Richardson on 15.08.2020.
//  Copyright © 2020 Paul Richardson. All rights reserved.
//

import Foundation

class Habits: ObservableObject {
		
	@Published var items = [Activity]() {
		didSet {
			let encoder = JSONEncoder()
			if let encoded = try? encoder.encode(items) {
				UserDefaults.standard.set(encoded, forKey: "Habits")
			}
		}
	}
		
	init() {
		
		if let data = UserDefaults.standard.data(forKey: "Habits") {
			let decoder = JSONDecoder()
			if let habits = try? decoder.decode([Activity].self, from: data) {
				self.items = habits
				return
			}
		}
		
		self.items = []
	}
	
}

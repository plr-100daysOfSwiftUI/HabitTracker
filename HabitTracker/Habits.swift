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
		
		// TODO: load from user defaults
		self.items = []
	}
	
}

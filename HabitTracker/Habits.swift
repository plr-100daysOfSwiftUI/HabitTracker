//
//  Habits.swift
//  HabitTracker
//
//  Created by Paul Richardson on 15.08.2020.
//  Copyright © 2020 Paul Richardson. All rights reserved.
//

import Foundation

class Habits: ObservableObject {
		
	@Published var items = [Activity]()
	// TODO: make a setter to save to user defaults
	
	init() {
		
		// TODO: load from user defaults
		self.items = []
	}
	
}

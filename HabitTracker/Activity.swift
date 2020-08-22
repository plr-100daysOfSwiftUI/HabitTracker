//
//  Activity.swift
//  HabitTracker
//
//  Created by Paul Richardson on 15.08.2020.
//  Copyright © 2020 Paul Richardson. All rights reserved.
//

import Foundation
import SwiftUI

struct Activity: Codable, Identifiable, Equatable {
	var id = UUID()
	var title: String
	var description: String
	var counter: Int = 0
	
	mutating func incrementCounter() {
		counter += 1
	}
}

//
//  ChagnedLevelDelegate.swift
//  MyFirstApp
//
//  Created by Lefteris Kostakis on 2/3/23.
//

import Foundation

protocol ChangedLevelDelegate {
    var selectedLevel: Settings.DifficultyLevel {get set}
}

//
//  TopScoresViewController.swift
//  MyFirstApp
//
//  Created by Lefteris Kostakis on 20/2/23.
//

import UIKit

class TopScoresViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Leaders"
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.register(UINib(nibName: "\(TopScoreCell.self)", bundle: nil), forCellReuseIdentifier: TopScoreCell.reuseIdentifier)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let level = Settings.viewController?.selectedLevel
        return HighScoreTable.scoreTable[level!]?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(TopScoreCell.self)", for: indexPath) as? TopScoreCell
        else { fatalError("Could not create TeamCell") }
        
        let level = Settings.viewController?.selectedLevel
        guard let players = HighScoreTable.scoreTable[level!] else {
            return UITableViewCell()
        }

        return cell.configure(name: players[indexPath.row].name, score: players[indexPath.row].score, date: players[indexPath.row].date)
    }

}

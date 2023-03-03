//
//  StackViewController.swift
//  MyFirstApp
//
//  Created by Lefteris Kostakis on 3/3/23.
//

import UIKit

class StackViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "\(TopScoreCell.self)", bundle: nil), forHeaderFooterViewReuseIdentifier: TopScoreCell.reuseIdentifier)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(TopScoreCell.self)", for: indexPath) as? TopScoreCell
        else { fatalError("Could not create TeamCell") }
        
//        let team = teams[indexPath.row]
        cell.backgroundColor = .systemGray6
        return cell
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

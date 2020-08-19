//
//  FeedViewController.swift
//  InstaCloneApp
//
//  Created by Yusuf Sinan Ulukanligil on 2020-08-15.
//  Copyright © 2020 Yusuf Sinan Ulukanligil. All rights reserved.
//

import UIKit

class FeedViewController: ViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.feedTableView.delegate = self
        self.feedTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.feedImage.image = UIImage(named: "select.png")
        cell.feedEmail.text = "user@hotmail.com"
        cell.feedComment.text = "Very nice"
        cell.numberoFlikes.text = "0"
        return cell
    }
    



}

//
//  FeedViewController.swift
//  InstagramFirebase
//
//  Created by MD Tanvir Alam on 8/4/21.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableFeed: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableFeed.delegate = self
        tableFeed.dataSource = self

    }
    
    //MARK:- Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableFeed.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTableViewCell
        cell.useremailLabel.text = "Tanvirgeek@gmail.com"
        cell.likeCountLabel.text = "0"
        cell.commentLabel.text = "This is a big comment This is a big comment This is a big comment This is a big comment This is a big comment This is a big comment This is a big comment This is a big comment"
        //cell.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        cell.feedImage.image = UIImage(named: "select")
        return cell
    }

}

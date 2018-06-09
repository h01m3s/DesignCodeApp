//
//  BookmarksTableViewController.swift
//  DesignCodeApp
//
//  Created by Weijie Lin on 6/8/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class BookmarksTableViewController: UITableViewController {
    
    var bookmarks: [[String: String]] = allBookmarks
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookmarkCell") as! BookmarkTableViewCell
        let bookmark = bookmarks[indexPath.row]
        cell.chapterTitleLabel.text = bookmark["section"]!.uppercased()
        cell.titleLabel.text = bookmark["part"]
        cell.bodyLabel.text = bookmark["content"]
        cell.chapterNumberLabel.text = bookmark["chapter"]
        cell.badgeImageView.image = UIImage(named: "Bookmarks/" + bookmark["type"]!)
        
        return cell
    }
    
}

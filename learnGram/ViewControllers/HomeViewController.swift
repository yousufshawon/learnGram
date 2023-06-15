//
//  HomeViewController.swift
//  learnGram
//
//  Created by Yousuf on 25/5/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    static let storyboardId = "HomeViewController"
    @IBOutlet private var tableView : UITableView!
    
    private let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("HomeViewController: viewDidLoad")

        // Do any additional setup after loading the view.
        viewModel.getPhotos() { result in
            self.tableView.reloadData()
            if(result) {
               print("Photo founnd")
            } else {
                print("No photo found")
            }
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("HomeViewController: tableView numberOfRowsInSection section -> \(section)")
        return viewModel.feedItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("HomeViewController: tableView cellForRowAt section -> \(indexPath.section) row -> \(indexPath.row)")
        let text = "Section -> \(indexPath.section) Row -> \(indexPath.row)"
     
        let feedCell = getFeedCell(tableView: tableView)
        feedCell.bindView(index: indexPath.row, feedItem: viewModel.feedItems[indexPath.row])
        
        return feedCell;
    }
    
    
    private func getFeedCell(tableView:UITableView) -> FeedItemViewCell {
        
        var feedCell : FeedItemViewCell
        
        if let oldCell = tableView.dequeueReusableCell(withIdentifier: FeedItemViewCell.identifierId) as? FeedItemViewCell {
            feedCell = oldCell
            print("Recycled cell")
        } else {
            feedCell = Bundle.main.loadNibNamed(FeedItemViewCell.identifierId, owner: self)?.first as! FeedItemViewCell
            print("New cell")
        }
        
        return feedCell
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

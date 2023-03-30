//
//  ViewController.swift
//  StickyHeader
//
//  Created by Phincon on 30/03/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundCard: UIView!
    @IBOutlet weak var topConstraintView: NSLayoutConstraint!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var headerSubTitle: UILabel!
    @IBOutlet weak var phoneImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "pusyangggg"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension ViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        
        let swipingDown = y <= 0
        let shouldSnap = y > 30
        let headerViewHeight = HeaderView.frame.height // label + spacer (102)
        
        UIView.animate(withDuration: 1) {
            self.headerTitle.alpha = swipingDown ? 1.0 : 0.0
            self.headerSubTitle.alpha = swipingDown ? 1.0 : 0.0
            self.phoneImage.alpha = swipingDown ? 1.0 : 0.0
        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.4, delay: 0, options: [], animations: {
            self.HeaderView.backgroundColor = shouldSnap ? .white : .orange
            self.topConstraintView?.constant = shouldSnap ? -headerViewHeight : 0
            self.view.layoutIfNeeded()
        })
        
    }
}


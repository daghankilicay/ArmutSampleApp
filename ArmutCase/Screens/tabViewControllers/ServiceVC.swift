//
//  ServiceVC.swift
//  ArmutCase
//
//  Created by Dağhan KILIÇAY on 4.09.2020.
//  Copyright © 2020 Dağhan KILIÇAY. All rights reserved.
//

import UIKit
import SDWebImage

class ServiceVC: BaseVC,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
    
    var trendings : [Trending]?
    var mainResponse : MainResponse?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showProgress()
        self.addNavLogo()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
        self.getHomePage()
        self.tableView.frame = CGRect(x: 0, y: 0, width: screen().width, height: screen().height - (self.tabBarController?.tabBar.frame.size.height)!)
    }
    
    private func getHomePage(){
        API().getHome { (data, error) in
            if error == nil{
                if data.value != nil{
                    self.mainResponse = data.value
                    self.tableView.reloadData()
                    self.hideProgress()
                }else{
                    self.showReloadAlert(message: "\(error?.localizedDescription ?? "")")
                }
            }else{
                self.showReloadAlert(message: "\(error?.localizedDescription ?? "")")
            }
            
        }
    }
    
    private func showReloadAlert (message:String?){
        let message = "Sunucu üzerinden hata alındı.Hata Kodu : \(message ?? "")"
        let alertController = UIAlertController(title: "Armut", message: message , preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "ÇIKIŞ", style: .cancel) {
            UIAlertAction in
            self.alertExit()
        }
        let reLoadAction = UIAlertAction(title: "Yeniden Dene", style: .default) {
            UIAlertAction in
            self.reloadHomePage()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(reLoadAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertExit (){
        exit(0)
    }
    
    private func reloadHomePage(){
        self.getHomePage()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mainResponse?.trending != nil{
            return 3
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2{
            return 300
        }
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = dequeueCell(identifier: "TrendingCell", tableView: self.tableView) as? TrendingCell
            cell?.trending = self.mainResponse?.trending
            cell?.lblTitle.text = TitleEnums.trending.rawValue
            cell?.itemSelected = { (id)->Void in self.showDetail(id: id)}
            return cell!
        }else if indexPath.row == 1{
            let cell = dequeueCell(identifier: "OtherCell", tableView: self.tableView) as? OtherCell
            cell?.trending = self.mainResponse?.other
            cell?.lblTitle.text = TitleEnums.other.rawValue
            cell?.itemSelected = { (id)->Void in self.showDetail(id: id)}
            return cell!
        }else if indexPath.row == 2{
            let cell = dequeueCell(identifier: "PostCell", tableView: self.tableView) as? PostCell
            cell?.post = self.mainResponse?.posts
            cell?.lblTitle.text = TitleEnums.post.rawValue
            cell?.itemSelected = { (post)->Void in self.showBlogDetail(post: post)}
            return cell!
        }
        return UITableViewCell.init()
    }
}

//
//  ViewController.swift
//  ArmutCase
//
//  Created by Dağhan KILIÇAY on 4.09.2020.
//  Copyright © 2020 Dağhan KILIÇAY. All rights reserved.
//

import UIKit


class BaseVC: UIViewController {
    
    var progress : ProgressView?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func addNavLogo() {
        let image: UIImage = UIImage(named: "armut-logo-color")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    
    func showDetail(id:Int) {
        self.showProgress()
        let detailView = UIStoryboard(name: "Detail", bundle: Bundle.main).instantiateInitialViewController() as? DetailVC
        API().getDetail(id: id) { (data, error) in
            if error == nil{
                if data.value != nil{
                    detailView?.detailResponse = data.value
                    self.modalPresentationStyle = .fullScreen
                    self.present(detailView!, animated: true, completion: nil)
                    self.hideProgress()
                }else{
                    self.showAlertMessage(message: "Beklenmedik bir hata oluştu")
                }
            }else{
                self.showAlertMessage(message: error!.localizedDescription)
            }
        }
    }
    
    func showBlogDetail(post:Post) {
        let detailBlogVC = UIStoryboard(name: "Detail", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailBlogVC") as? DetailBlogVC
        detailBlogVC?.post = post
        self.modalPresentationStyle = .fullScreen
        self.present(detailBlogVC!, animated: true, completion: nil)
    }
    
    func dequeueCell(identifier:String, tableView:UITableView) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier:identifier)
        if cell == nil {
            tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        }
        return cell!
    }
    
    func showAlertMessage(message:String) {

        let alertController = UIAlertController(title: "Armut", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "TAMAM", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showProgress(){
        self.progress = ProgressView.showProgress()
    }
    
    func hideProgress() {
        self.progress?.removeFromSuperview()
    }

}


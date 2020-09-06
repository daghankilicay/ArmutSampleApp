//
//  DetailVC.swift
//  ArmutCase
//
//  Created by Dağhan KILIÇAY on 5.09.2020.
//  Copyright © 2020 Dağhan KILIÇAY. All rights reserved.
//

import UIKit

class DetailVC: BaseVC,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnContinue: UIButton!
    var detailResponse : DetailResponse?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let height = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

        self.tableView.frame = CGRect(x: 0, y: height , width: screen().width, height: screen().height - height - self.btnContinue.frame.height)
        self.btnContinue.addTarget(self, action: #selector(self.clickedContinue), for: .touchUpInside)
        print("")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: animated)
//        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2{
            return 175
        }
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            
            let cell = dequeueCell(identifier: "DetailHeaderCell", tableView: self.tableView) as? DetailHeaderCell
            cell?.btnBack.addTarget(self, action: #selector(self.dismissViewController), for: .touchUpInside)
            cell?.showContent(detail: self.detailResponse)
            return cell!
        }else if indexPath.row == 1{
            let cell = dequeueCell(identifier: "DetailInfoCell", tableView: self.tableView) as? DetailInfoCell
            cell?.showContent(detail: self.detailResponse)
            return cell!
        }else if indexPath.row == 2{
            let cell = dequeueCell(identifier: "DetailWorkCell", tableView: self.tableView) as? DetailWorkCell
            return cell!
        }
        return UITableViewCell.init()
    }
    
    @objc private func dismissViewController(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func clickedContinue(){
        self.showAlertMessage(message: "Sistemsel bir hata oluştu")
    }
}

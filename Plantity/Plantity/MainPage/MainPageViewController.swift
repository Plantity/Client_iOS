//
//  LogPageViewController.swift
//  Plantity
//
//  Created by 김다연 on 2022/07/25.
//

import UIKit

class MainPageViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate=self
        tableView.dataSource=self
        //카드 사이에 선 없애주기
        tableView.separatorStyle = .none
        
        let cardNib = UINib(nibName: "CardTableViewCell", bundle: nil)
        tableView.register(cardNib, forCellReuseIdentifier: "CardTableViewCell")
        // Do any additional setup after loading the view.
        
        
    }
    



}

extension MainPageViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardTableViewCell",for: indexPath)as? CardTableViewCell else{
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        600
    }
    


    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? CardTableViewCell else{
            return
        }

        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }



    
}


extension MainPageViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    //카드갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath)as?
                CardCollectionViewCell else{
                    return UICollectionViewCell()
                }
        cell.layer.cornerRadius = 12
        return cell

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 450)
    }


}

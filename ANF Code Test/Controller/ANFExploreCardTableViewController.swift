//
//  ANFExploreCardTableViewController.swift
//  ANF Code Test
//


import UIKit

class ANFExploreCardTableViewController: UITableViewController {
    
    //MARK:- Properties
    
    private let apiCaller = APICaller()
    private var promoCard: [PromoCardModel] = []
    
    //MARK:- LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }
    
    //MARK:- Methods
    
    func setupUI() {
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    func fetchData() {
        apiCaller.exploreData { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let exploreData):
                self.promoCard = exploreData
            case .failure( _):
                break
            }
        }
    }
    
    //MARK:- TableView Delegate & DataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return promoCard.count

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: PromoCardCell.identifier, for: indexPath) as! PromoCardCell
        cell.configureView(dataModel: promoCard[indexPath.row])        
        return cell
    }
}

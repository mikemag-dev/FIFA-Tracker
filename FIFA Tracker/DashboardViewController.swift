//
//  ViewController.swift
//  FIFA Tracker
//
//  Created by Mike Maguire on 8/30/17.
//  Copyright © 2017 UpnUp. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    static let SUMMARY_TABLEVIEW_CELL_ID = "SUMMARY_TABLEVIEW_CELL_ID"
    
    let names = ["Carson", "Matt", "Hunter", "Mike", "Braham"]
    
    lazy var tableView : UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(SummaryTableViewCell.self, forCellReuseIdentifier: DashboardViewController.SUMMARY_TABLEVIEW_CELL_ID)
        tv.dataSource = self
        tv.delegate = self
        return tv
    }()
    
    lazy var addGameResultButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        setupConstraints()
    }
    
    func addSubviews(){
        view.addSubview(tableView)
    }
    
    func setupConstraints(){
        let viewsDict : [String:AnyObject] = [
            "tableView":tableView,
            "topLayoutGuide":topLayoutGuide
        ]
        var allConstraints = [NSLayoutConstraint]()
        
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[tableView]|", options: [], metrics: nil, views: viewsDict)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[topLayoutGuide][tableView]|", options: [], metrics: nil, views: viewsDict)
        
        NSLayoutConstraint.activate(allConstraints)
    }
    
    func handleAddGame(){
        navigationController!.pushViewController(AddGameResultViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DashboardViewController.SUMMARY_TABLEVIEW_CELL_ID) as! SummaryTableViewCell
        
        cell.nameLabel.text = names[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

class SummaryTableViewCell : UITableViewCell{
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let gamesPlayedHeaderLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Games Played"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let winsHeaderLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Wins"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let lossesHeaderLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Losses"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let gamesPlayedLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "0"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let winsLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "0"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let lossesLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "0"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func addSubviews(){
        addSubview(nameLabel)
        addSubview(gamesPlayedHeaderLabel)
        addSubview(gamesPlayedLabel)
        addSubview(winsHeaderLabel)
        addSubview(winsLabel)
        addSubview(lossesHeaderLabel)
        addSubview(lossesLabel)
    }
    
    func setupConstraints(){
        let viewsDict = [
            "nameLabel":nameLabel,
            "gamesPlayedHeaderLabel":gamesPlayedHeaderLabel,
            "gamesPlayedLabel":gamesPlayedLabel,
            "winsHeaderLabel":winsHeaderLabel,
            "winsLabel":winsLabel,
            "lossesHeaderLabel":lossesHeaderLabel,
            "lossesLabel":lossesLabel
        ]
        var allConstraints = [NSLayoutConstraint]()
        
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[nameLabel][gamesPlayedHeaderLabel(==nameLabel)][winsHeaderLabel(==nameLabel)][lossesHeaderLabel(==nameLabel)]|", options: [], metrics: nil, views: viewsDict)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[gamesPlayedHeaderLabel][gamesPlayedLabel]", options: [.alignAllCenterX], metrics: nil, views: viewsDict)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[winsHeaderLabel][winsLabel]", options: [.alignAllCenterX], metrics: nil, views: viewsDict)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[lossesHeaderLabel][lossesLabel]", options: [.alignAllCenterX], metrics: nil, views: viewsDict)
        
        allConstraints += [nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)]
        allConstraints += [gamesPlayedHeaderLabel.bottomAnchor.constraint(equalTo: centerYAnchor)]
        allConstraints += [winsHeaderLabel.bottomAnchor.constraint(equalTo: centerYAnchor)]
        allConstraints += [lossesHeaderLabel.bottomAnchor.constraint(equalTo: centerYAnchor)]
        
        NSLayoutConstraint.activate(allConstraints)
    }
    
}


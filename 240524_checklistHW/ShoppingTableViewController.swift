//
//  ShoppingTableViewController.swift
//  240524_checklistHW
//
//  Created by 박다현 on 5/24/24.
//

import UIKit

struct ShoppingList{
    let list:String
    var complete:Bool
    var important:Bool
}

class ShoppingTableViewController: UITableViewController {

    @IBOutlet var addListView: UIView!
    @IBOutlet var addListTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var shoppingList = [
        ShoppingList(list: "그립톡 구매하기", complete: true, important: true),
        ShoppingList(list: "사이다 구매", complete: false, important: false),
        ShoppingList(list: "아이패드 케이스 최저가 알아보기", complete: false, important: false),
        ShoppingList(list: "양말", complete: false, important: true),
    ]{
        didSet{
            filteredData = shoppingList
            tableView.reloadData()
        }
    }
    
    var checkfilter:Bool = false
    var isImportantfilter:Bool = false
    lazy var filteredData:[ShoppingList] = shoppingList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureNavi()
        
        tableView.rowHeight = 55
        tableView.separatorStyle = .none
    }
    
    func configureNavi(){
        navigationItem.title = "쇼핑"
        
        let checkBoxButton = UIBarButtonItem(image: UIImage(systemName: "checkmark.square"), style: .plain, target: self, action: #selector(checkfilterClicked))
        navigationItem.leftBarButtonItem = checkBoxButton
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        let starButton = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(isImportantfilterClicked))
        navigationItem.rightBarButtonItem = starButton
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    func configure(){
        addListView.backgroundColor = UIColor(red: 0.92, green: 0.92, blue: 0.92, alpha: 1.00)
        addListView.layer.cornerRadius = 10
        
        addListTextField.backgroundColor = .clear
        addListTextField.placeholder = "무엇을 구매하실 건가요?"
        addListTextField.borderStyle = .none

        addButton.backgroundColor  = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1.00)
        addButton.layer.cornerRadius = 8
        addButton.setTitleColor(.black, for: .normal)
        
    
    }
    
    @objc func checkfilterClicked(){
        if checkfilter{
            navigationItem.leftBarButtonItem?.image = UIImage(systemName: "checkmark.square")
            filteredData = shoppingList
            tableView.reloadData()
        }else{
            navigationItem.leftBarButtonItem?.image = UIImage(systemName: "checkmark.square.fill")
            filteredData = filteredData.filter({ $0.complete })
            tableView.reloadData()
        }
        checkfilter.toggle()
    }
    
    @objc func isImportantfilterClicked(){
        if isImportantfilter{
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "star")
            filteredData = shoppingList
            tableView.reloadData()
        }else{
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "star.fill")
            filteredData = filteredData.filter({ $0.important })
            tableView.reloadData()
        }
        isImportantfilter.toggle()
    }
    
    
    
    
    @IBAction func addButtonClicked(_ sender: Any) {
        guard let text = addListTextField.text else { return }
        if !text.trimmingCharacters(in: .whitespaces).isEmpty{
            let newList = ShoppingList(list: text, complete: false, important: false)
            shoppingList.append(newList)
            addListTextField.text = ""
        }
    }
    
    @IBAction func checkButtonClicked(_ sender: UIButton) {
        shoppingList[sender.tag].complete.toggle()
        //tableView.reloadRows(at: [IndexPath(item: sender.tag, section: 0)], with: .none)
    }
    
    @IBAction func starButtonClicked(_ sender: UIButton) {
        shoppingList[sender.tag].important.toggle()
        //tableView.reloadRows(at: [IndexPath(item: sender.tag, section: 0)], with: .none)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        let row = filteredData[indexPath.row]
        cell.configureData(row:row)
        cell.checkButton.tag = indexPath.row
        cell.starButton.tag = indexPath.row
        return cell
    }
}

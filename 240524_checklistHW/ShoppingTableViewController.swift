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
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        tableView.rowHeight = 55
        navigationItem.title = "쇼핑"
    }
    
    func configure(){
        addListView.backgroundColor = .lightGray.withAlphaComponent(0.2)
        addListView.layer.cornerRadius = 10
        
        addListTextField.backgroundColor = .clear
        addListTextField.placeholder = "무엇을 구매하실 건가요?"
        addListTextField.borderStyle = .none

        addButton.backgroundColor  = .lightGray.withAlphaComponent(0.4)
        addButton.layer.cornerRadius = 8
        addButton.setTitleColor(.black, for: .normal)
        
    
    }

    @IBAction func addButtonClicked(_ sender: Any) {
        guard let text = addListTextField.text else { return }
        if !text.trimmingCharacters(in: .whitespaces).isEmpty{
            let newList = ShoppingList(list: text, complete: false, important: false)
            shoppingList.append(newList)
            addListTextField.text = ""
            tableView.reloadData()
        }
    }
    
    @IBAction func checkButtonClicked(_ sender: UIButton) {
        shoppingList[sender.tag].complete.toggle()
        tableView.reloadRows(at: [IndexPath(item: sender.tag, section: 0)], with: .none)
    }
    
    @IBAction func starButtonClicked(_ sender: UIButton) {
        shoppingList[sender.tag].important.toggle()
        tableView.reloadRows(at: [IndexPath(item: sender.tag, section: 0)], with: .none)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        let row = shoppingList[indexPath.row]
        cell.listLabel.text = row.list
        
        let check = row.complete ? "checkmark.square.fill" : "checkmark.square"
        cell.checkButton.setImage(UIImage(systemName: check), for: .normal)
        
        let fav = row.important ? "star.fill" : "star"
        cell.starButton.setImage(UIImage(systemName: fav), for: .normal)
        
        cell.listBoxView.backgroundColor = .lightGray.withAlphaComponent(0.2)
        cell.listBoxView.layer.cornerRadius = 10
        cell.checkButton.tintColor = .black
        cell.starButton.tintColor = .black
        cell.starButton.backgroundColor = .clear
        
        cell.checkButton.tag = indexPath.row
        cell.starButton.tag = indexPath.row

        return cell
    }
}

//
//  BookListViewController.swift
//  BookList
//
//  Created by Юлия Караневская on 4/27/21.
//

import UIKit

class BookListViewController: UIViewController {
    
    var tableView = UITableView()
    var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Book list"
        books = fetchData()
        configureTableView()
        
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        //set delegates
        setTableViewDelegates()
        
        //set row height
        tableView.rowHeight = 170
        
        //register cells
        tableView.register(BookCell.self, forCellReuseIdentifier: "bookCell")
        
        //set constraints
        pinTableView()
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func pinTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
}

extension BookListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell") as! BookCell
        let book = books[indexPath.row]
        cell.set(book: book)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    
}

extension BookListViewController {
    func fetchData() -> [Book] {
        let book1 = Book(bookImage: Images.dune!, name: "Dune", author: "by Frank Herbert", price: "$15.39")
        let book2 = Book(bookImage: Images.educated!, name: "Educated", author: "by Tara Westover", price: "$17.99")
        let book3 = Book(bookImage: Images.girlInTheDark!, name: "Girl in the dark", author: "by Anna Lyndsey", price: "$11.15")
        let book4 = Book(bookImage: Images.loner!, name: "Loner", author: "by Georgina Young", price: "$16.33")
        let book5 = Book(bookImage: Images.moreMiracleThanBird!, name: "More miracle than bird", author: "by Alice Miller", price: "$12.35")
        let book6 = Book(bookImage: Images.sinEater!, name: "Sin eater", author: "by Megan Campisi", price: "$15.19")
        let book7 = Book(bookImage: Images.theLastPikachu!, name: "The last Pikachu", author: "by Ben H. Winters", price: "$10.99")
        let book8 = Book(bookImage: Images.theSwallows!, name: "The swallows", author: "by Lisa Lutz", price: "$21.16")
        let book9 = Book(bookImage: Images.veryNice!, name: "Very nice", author: "by Marcy Dermansky", price: "$19.99")
        
        return [book1, book2, book3, book4, book5, book6, book7, book8, book9]
    }
}

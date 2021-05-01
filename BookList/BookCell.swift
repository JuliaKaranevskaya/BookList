//
//  BookCell.swift
//  BookList
//
//  Created by Юлия Караневская on 4/27/21.
//

import UIKit

class BookCell: UITableViewCell {
    
    var bookImageView = UIImageView()
    var bookNameLabel = UILabel()
    var bookAuthorLabel = UILabel()
    var bookPriceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(bookImageView)
        addSubview(bookNameLabel)
        addSubview(bookAuthorLabel)
        addSubview(bookPriceLabel)
        configureImageView()
        configureNameLabel()
        configureAuthorLabel()
        configurePriceLabel()
        setImageViewConstraints()
        setNameLabelConstraints()
        setAuthorLabelConstraints()
        setPriceLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func set(book: Book) {
        bookImageView.image = book.bookImage
        bookNameLabel.text = book.name
        bookAuthorLabel.text = book.author
        bookPriceLabel.text = book.price
    }
    
    func configureImageView() {
        bookImageView.layer.cornerRadius = 10
        bookImageView.clipsToBounds = true
        
    }
    
    func configureNameLabel() {
        bookNameLabel.numberOfLines = .zero
        bookNameLabel.adjustsFontSizeToFitWidth = true
        bookNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        
    }
    
    func configureAuthorLabel() {
        bookAuthorLabel.numberOfLines = .zero
        bookAuthorLabel.adjustsFontSizeToFitWidth = true
        bookAuthorLabel.font = UIFont.systemFont(ofSize: 18)
        bookAuthorLabel.tintColor = .gray
    }
    
    func configurePriceLabel() {
        bookPriceLabel.numberOfLines = .zero
        bookPriceLabel.adjustsFontSizeToFitWidth = true
        bookPriceLabel.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    func setImageViewConstraints() {
        bookImageView.translatesAutoresizingMaskIntoConstraints = false
        bookImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        bookImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        bookImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        bookImageView.widthAnchor.constraint(equalTo: bookImageView.heightAnchor, multiplier: 2/3).isActive = true
        
    }
    
    func setNameLabelConstraints() {
        bookNameLabel.translatesAutoresizingMaskIntoConstraints = false
        bookNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        bookNameLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 20).isActive = true
        bookNameLabel.bottomAnchor.constraint(lessThanOrEqualTo: bookAuthorLabel.topAnchor, constant: 20).isActive = true
        bookNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
    }
    
    func setAuthorLabelConstraints() {
        bookAuthorLabel.translatesAutoresizingMaskIntoConstraints = false
        bookAuthorLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 20).isActive = true
        bookAuthorLabel.topAnchor.constraint(equalTo: bookNameLabel.bottomAnchor, constant: 10).isActive = true
        bookAuthorLabel.bottomAnchor.constraint(lessThanOrEqualTo: bookPriceLabel.topAnchor, constant: 20).isActive = true
        bookAuthorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
    }
    
    
    func setPriceLabelConstraints() {
        bookPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        bookPriceLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 20).isActive = true
        bookPriceLabel.topAnchor.constraint(greaterThanOrEqualTo: bookAuthorLabel.bottomAnchor, constant: 20).isActive = true
        bookPriceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        bookPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
    }
    
    
}

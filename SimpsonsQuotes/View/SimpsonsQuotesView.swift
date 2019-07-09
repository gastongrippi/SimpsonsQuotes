//
//  SimpsonsQuotesView.swift
//  SimpsonsQuotes
//
//  Created by gaston on 6/29/19.
//  Copyright © 2019 gaston. All rights reserved.
//

import UIKit
import SnapKit

public class SimpsonsQuotesView: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    var quotesQuantity = UITextField.init(frame: .zero)
    var searchQuotesButton = UIButton.init(frame: .zero)
    var quotesTableView = UITableView.init(frame: .zero)
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)

    var quoteDelegate: SimpsonsQuotesPresenter?

    
    // MARK: lifecycle
    override public func loadView() {
        loadNavigationBarStyles()
        setDelegates()
        addQuotesSubViews()
        addViesConstraints()
    }
    
    // MARK: Private methods
    private func loadNavigationBarStyles() {
        // Set navigation controller styles
        self.title = "Simpsons"
        self.view = UIView.init(frame: .zero)
        self.view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .orange
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    private func setDelegates() {
        quoteDelegate = SimpsonsQuotesPresenter(delegate: self)
        quotesQuantity.delegate = self
        self.quotesTableView.delegate = self
        self.quotesTableView.dataSource = self
    }
    
    private func addQuotesSubViews() {
        // Initialize quotes quantity text field
        quotesQuantity.placeholder = "Quotes quantity"
        quotesQuantity.setBottomBorder()
        self.view.addSubview(quotesQuantity)
        
        // Initialize quotes button
        searchQuotesButton.setTitle("Search quotes", for: .normal)
        searchQuotesButton.addTarget(self, action:#selector(loadQuotes) , for: .touchUpInside)
        searchQuotesButton.setTitleColor(.black, for: .normal)
        searchQuotesButton.titleLabel?.numberOfLines = 1
        searchQuotesButton.titleLabel?.adjustsFontSizeToFitWidth = true
        searchQuotesButton.backgroundColor = .lightGray
        self.view.addSubview(searchQuotesButton)
        
        // Initialize quotes table view
        quotesTableView.estimatedRowHeight = 80.0
        quotesTableView.rowHeight = UITableViewAutomaticDimension
        self.view.addSubview(quotesTableView)
    }
    
    private func addViesConstraints() {
        // Add constraints to quotes quantity text field
        quotesQuantity.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(self.getNavigationBarHeight() + 20.0)
            make.left.equalTo(self.view).offset(10)
            make.right.equalTo(self.view).offset(-150)
        }
        
        // Add constraints to quotes button
        searchQuotesButton.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(self.view).offset(-20)
            make.left.equalTo(self.quotesQuantity.snp.right).offset(20)
            make.bottom.equalTo(self.quotesQuantity.snp.bottom)
        }
        
        // Add constraints to table view
        quotesTableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(quotesQuantity.snp.bottom).offset(10)
            make.bottom.left.right.equalTo(self.view)
        }
    }
    
    @objc private func loadQuotes() {
        // Add it to the view where you want it to appear
        quotesTableView.addSubview(activityIndicator)
        // Set up its size (the super view bounds usually)
        activityIndicator.frame = quotesTableView.bounds
        activityIndicator.startAnimating()
        if let quantityText = quotesQuantity.text {
            let quantity = Int(quantityText) ?? 0
            quoteDelegate?.getQuotes(quantity)
        }
    }
    
    // MARK: UITextFieldDelegate
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}


extension SimpsonsQuotesView: SimpsonsQuotesViewDelegate {
    // MARK: SimpsonsQuotesViewDelegate
    func reloadQuotesTableView() {
        self.quotesTableView.reloadData()
    }
    
    func removeLoadingIndicator() {
        activityIndicator.removeFromSuperview()
    }
    
    func showErrorMessage(_ error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


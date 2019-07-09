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
        title = k.QuotesView.QuotesScreenTitle
        view = UIView.init(frame: .zero)
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .orange
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    private func setDelegates() {
        quoteDelegate = SimpsonsQuotesPresenter(delegate: self)
        quotesQuantity.delegate = self
        quotesTableView.delegate = self
        quotesTableView.dataSource = self
    }
    
    private func addQuotesSubViews() {
        // Initialize quotes quantity text field
        quotesQuantity.placeholder = k.QuotesView.QuotesPlaceholder
        quotesQuantity.setBottomBorder()
        view.addSubview(quotesQuantity)
        
        // Initialize quotes button
        searchQuotesButton.setTitle(k.QuotesView.QuotesSearchButton, for: .normal)
        searchQuotesButton.addTarget(self, action:#selector(loadQuotes) , for: .touchUpInside)
        searchQuotesButton.setTitleColor(.black, for: .normal)
        searchQuotesButton.titleLabel?.numberOfLines = 1
        searchQuotesButton.titleLabel?.adjustsFontSizeToFitWidth = true
        searchQuotesButton.backgroundColor = .lightGray
        view.addSubview(searchQuotesButton)
        
        // Initialize quotes table view
        quotesTableView.estimatedRowHeight = CGFloat(k.QuotesView.EstimatedSimpsonQuoteHeight)
        quotesTableView.rowHeight = UITableViewAutomaticDimension
        view.addSubview(quotesTableView)
    }
    
    private func addViesConstraints() {
        // Add constraints to quotes quantity text field
        quotesQuantity.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view).offset(getNavigationBarHeight() + CGFloat(k.Constraints.GeneralPadding*2))
            make.left.equalTo(view).offset(k.Constraints.GeneralPadding)
            make.width.equalTo(k.QuotesView.QuotesQuantityWidth)
        }
        
        // Add constraints to quotes button
        searchQuotesButton.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(view).offset(-k.Constraints.GeneralPadding)
            make.left.equalTo(quotesQuantity.snp.right).offset(CGFloat(k.Constraints.GeneralPadding*2))
            make.bottom.equalTo(quotesQuantity.snp.bottom)
        }
        
        // Add constraints to table view
        quotesTableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(quotesQuantity.snp.bottom).offset(k.Constraints.GeneralPadding)
            make.bottom.left.right.equalTo(view)
        }
    }
    
    @objc private func loadQuotes() {
        if let quantityText = quotesQuantity.text {
            if let quantity = Int(quantityText) {
                quoteDelegate?.getQuotes(quantity)
            } else {
                showErrorMessage(k.ErrorMessages.NoQuotesQuantity)
            }
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
        quotesTableView.reloadData()
    }
    
    func showErrorMessage(_ error: String) {
        let alert = UIAlertController(title: k.Alerts.Error, message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: k.Alerts.Ok, style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showLoadingOnTable() {
        // Add it to the view where you want it to appear
        quotesTableView.addSubview(activityIndicator)
        // Set up its size (the super view bounds usually)
        activityIndicator.frame = quotesTableView.bounds
        activityIndicator.startAnimating()
    }
    
    func removeLoadingIndicator() {
        activityIndicator.removeFromSuperview()
    }
}


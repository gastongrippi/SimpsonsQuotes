//
//  SimpsonsQuotesDelegate.swift
//  SimpsonsQuotes
//
//  Created by gaston on 30/06/2019.
//  Copyright © 2019 gaston. All rights reserved.
//
import UIKit

protocol SimpsonsQuotesViewDelegate {
    func reloadQuotesTableView()
    func showErrorMessage(_ error: String)
    func showLoadingOnTable()
    func removeLoadingIndicator()
}

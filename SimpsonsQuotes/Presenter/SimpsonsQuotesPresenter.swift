//
//  ViewController.swift
//  SimpsonsQuotes
//
//  Created by gaston on 6/29/19.
//  Copyright © 2019 gaston. All rights reserved.
//

import Alamofire

public class SimpsonsQuotesPresenter {
    private var endpoint = k.simpsonsQuoteEndpoint
    private var viewDelegate: SimpsonsQuotesViewDelegate
    private var quotes = [SimpsonQuote]()
    
    // MARK: Initialize
    init(delegate: SimpsonsQuotesViewDelegate) {
        viewDelegate = delegate
    }
    
    // MARK: private methods
    func getQuotes(_ quantity: Int) {
        viewDelegate.showLoadingOnTable()
        quotes = []
        weak var weakSelf: SimpsonsQuotesPresenter? = self
        let request = "\(endpoint)\(quantity)"
        Alamofire.request(request,
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding(options:.prettyPrinted),
                          headers: nil).validate().responseJSON { (DefaultDataResponse) in
                            weakSelf?.viewDelegate.removeLoadingIndicator()

                            switch DefaultDataResponse.result {
                            case .success: break
                                
                            case .failure(let error):
                                print(error)
                                weakSelf?.viewDelegate.showErrorMessage(k.ErrorMessages.Generic)
                                return
                            }
                            
                            if let data = DefaultDataResponse.data {
                                if let jsonResult = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                                    
                                    if (jsonResult == nil) {
                                        weakSelf?.viewDelegate.showErrorMessage(k.ErrorMessages.NoQuotesReturned)
                                        return
                                    } else {
                                        if let jsonResult = jsonResult {
                                            for quote in jsonResult {
                                                let jsonData = try? JSONSerialization.data(withJSONObject: quote, options: .prettyPrinted)
                                                if let quote = try? JSONDecoder().decode(SimpsonQuote.self, from: jsonData!) {
                                                    print(quote)
                                                    weakSelf?.quotes.append(quote)
                                                }
                                            }
                                            weakSelf?.viewDelegate.reloadQuotesTableView()
                                        }
                                    }
                                }
                            }
                        }
    }
    
    func getQuotesQuantity() -> Int {
        return quotes.count
    }
    
    //MARK: Simpsons Quote Model info
    func getCharacterName(index: Int) -> String {
        return quotes[index].character
    }
    
    func getCharacterQuote(index: Int) -> String {
        return quotes[index].quote
    }
    
    func getCharacterImage(index: Int) -> String {
        return quotes[index].image
    }
    
    func getImageDirection(index: Int) -> String {
        return quotes[index].direction
    }
    
}



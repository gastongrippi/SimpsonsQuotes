//
//  SimpsonsQuotesTableViewDelegate.swift
//  SimpsonsQuotes
//
//  Created by gaston on 30/06/2019.
//  Copyright © 2019 gaston. All rights reserved.
//

import UIKit
import SDWebImage

extension SimpsonsQuotesView : UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quoteDelegate?.getQuotesQuantity() ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imageDirection = quoteDelegate?.getImageDirection(index: indexPath.row) ?? "Right"
        
        let cell = SimpsonsQuotesTableViewCell(style: .default, reuseIdentifier: "quoteCell", direction: imageDirection)
        cell.characterName.text = quoteDelegate?.getCharacterName(index: indexPath.row)
        cell.characterQuote.text = quoteDelegate?.getCharacterQuote(index: indexPath.row)
        
        let imageURL = quoteDelegate?.getCharacterImage(index: indexPath.row) ?? ""
        cell.characterImage.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "doughnut"), completed: nil)
        
        // Make sure the constraints have been added to this cell, since it may have just been created from scratch
        cell.needsUpdateConstraints()
        cell.updateConstraintsIfNeeded()
        
        return cell
    }
}

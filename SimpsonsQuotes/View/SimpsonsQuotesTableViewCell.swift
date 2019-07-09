//
//  SimpsonsQuotesTableViewCell.swift
//  SimpsonsQuotes
//
//  Created by gaston on 07/07/2019.
//  Copyright © 2019 gaston. All rights reserved.
//

import UIKit
import SnapKit

public class SimpsonsQuotesTableViewCell: UITableViewCell {
    
    //MARK: properties
    var characterImage = UIImageView(frame: .zero)
    var characterQuote = UILabel(frame: .zero)
    var characterName = UILabel(frame: .zero)
    var imageDirection : String?
    
    
    //MARK: Initializers
    convenience init(style: UITableViewCellStyle, reuseIdentifier: String?, direction: String) {
        self.init(style: style, reuseIdentifier: reuseIdentifier)
        imageDirection = direction
        selectionStyle = .none;
        initializeCharacterImage()
        initializeCharacterquote()
        initializeCharacterName()
    }
    
    override public func updateConstraints() {
        super.updateConstraints()
        applyCharacterImageConstraints()
        applyCharacterquoteConstraints()
        applyCharacterNameConstraints()
    }
    
    //MARK: Private methods
    
    private func initializeCharacterImage() {
        characterImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func initializeCharacterquote() {
        characterQuote.textColor = .black
        characterQuote.font = UIFont(name:"Trebuchet-BoldItalic" , size: 16)
        characterQuote.numberOfLines = 0
    }
    
    private func initializeCharacterName() {
        characterName.textColor = .lightGray
        characterName.font = UIFont(name:"TrebuchetMS" , size: 14)
    }
    
    private func applyCharacterImageConstraints() {
        contentView.addSubview(characterImage)
        characterImage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top)
            make.height.equalTo(70)
            make.bottom.lessThanOrEqualTo(contentView.snp.bottom)
            make.width.equalTo(50)
            make.right.equalTo(contentView.snp.right)
        }
    }
    
    private func applyCharacterquoteConstraints() {
        contentView.addSubview(characterQuote)
        characterQuote.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top)
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(characterImage.snp.left)
            make.bottom.lessThanOrEqualTo(contentView.snp.bottom)
        }
    }
    
    private func applyCharacterNameConstraints() {
        contentView.addSubview(characterName)
        characterName.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(characterQuote.snp.bottom)
            make.bottom.lessThanOrEqualTo(contentView.snp.bottom)
            make.right.equalTo(characterImage.snp.left)
            make.left.equalTo(contentView.snp.left)
        }
    }
    
}

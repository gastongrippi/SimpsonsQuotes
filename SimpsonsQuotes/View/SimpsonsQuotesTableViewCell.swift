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
    convenience init(style: UITableViewCellStyle, reuseIdentifier: String?, direction: String = k.ImageDirection.Right) {
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
        characterQuote.font = UIFont(name:k.Fonts.trebuchetBoldItalic , size: 16)
        characterQuote.numberOfLines = 0
    }
    
    private func initializeCharacterName() {
        characterName.textColor = .lightGray
        characterName.font = UIFont(name:k.Fonts.TrebuchetMS , size: 14)
    }
    
    private func applyCharacterImageConstraints() {
        contentView.addSubview(characterImage)
        characterImage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(k.Constraints.GeneralPadding)
            make.bottom.lessThanOrEqualTo(contentView.snp.bottom).offset(-k.Constraints.GeneralPadding)
            make.height.equalTo(k.QuotesCell.CharacterHeight)
            make.width.equalTo(k.QuotesCell.CharacterWidth)
            if (imageDirection == k.ImageDirection.Right) {
                make.right.equalTo(contentView.snp.right).offset(-k.Constraints.GeneralPadding)
            } else {
                make.left.equalTo(contentView.snp.left).offset(k.Constraints.GeneralPadding)
            }
        }
    }
    
    private func applyCharacterquoteConstraints() {
        contentView.addSubview(characterQuote)
        characterQuote.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(k.Constraints.GeneralPadding)
            make.bottom.lessThanOrEqualTo(contentView.snp.bottom).offset(-k.Constraints.GeneralPadding)
            if (imageDirection == k.ImageDirection.Right) {
                make.left.equalTo(contentView.snp.left).offset(k.Constraints.GeneralPadding)
                make.right.equalTo(characterImage.snp.left).offset(-k.Constraints.GeneralPadding)
            } else {
                make.left.equalTo(characterImage.snp.right).offset(k.Constraints.GeneralPadding)
                make.right.equalTo(contentView.snp.right).offset(-k.Constraints.GeneralPadding)
            }
        }
    }
    
    private func applyCharacterNameConstraints() {
        contentView.addSubview(characterName)
        characterName.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(characterQuote.snp.bottom).offset(k.Constraints.GeneralPadding)
            make.bottom.lessThanOrEqualTo(contentView.snp.bottom).offset(-k.Constraints.GeneralPadding)
            if (imageDirection == k.ImageDirection.Right) {
                make.right.equalTo(characterImage.snp.left).offset(-k.Constraints.GeneralPadding)
                make.left.equalTo(contentView.snp.left).offset(k.Constraints.GeneralPadding)
            } else {
                make.right.equalTo(contentView.snp.right).offset(-k.Constraints.GeneralPadding)
                make.left.equalTo(characterImage.snp.right).offset(k.Constraints.GeneralPadding)
            }
        }
    }
    
}

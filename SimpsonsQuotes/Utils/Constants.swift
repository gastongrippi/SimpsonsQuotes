//
//  File.swift
//  SimpsonsQuotes
//
//  Created by gaston on 09/07/2019.
//  Copyright © 2019 gaston. All rights reserved.
//

import Foundation

struct k {
    
    static let simpsonsQuoteEndpoint = "https://thesimpsonsquoteapi.glitch.me/quotes?count="
    
    struct Constraints {
        static let GeneralPadding = 10.0
    }
    
    struct Alerts {
        static let Ok = "Ok"
        static let Error = "Error"
    }
    
    struct ErrorMessages {
        static let NoQuotesQuantity = "Indique cantidad de quotes"
        static let Generic = "Ha ocurrido un error"
        static let NoQuotesReturned = "No hay citas"
    }
    
    struct ImageDirection {
        static let Right = "Right"
        static let Left = "Left"
    }
    
    struct Fonts {
        static let trebuchetBoldItalic = "Trebuchet-BoldItalic"
        static let TrebuchetMS = "TrebuchetMS"
    }
    
    struct QuotesView {
        static let QuotesScreenTitle = "Simpsons"
        static let QuotesPlaceholder = "Quotes quantity"
        static let QuotesSearchButton = "Search quotes"
        static let EstimatedSimpsonQuoteHeight = 80.0
        static let QuotesQuantityWidth = 160.0
    }
    
    struct QuotesCell {
        static let CharacterHeight = 70.0
        static let CharacterWidth = 50.0
    }
}

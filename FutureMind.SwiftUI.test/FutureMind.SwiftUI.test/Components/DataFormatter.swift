//
//  Formatter.swift
//  FutureMind.SwiftUI.test
//
//  Created by Aleksander Pankow on 30/05/2022.
//

import Foundation

class DataFormatter{
    
    static func extractUrl(input:String) -> String{
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))
        var url: String = ""
        
        for match in matches {
            guard let range = Range(match.range, in: input) else { continue }
            url = String(input[range])
        }
        
        return url
    }
    
    static func removeUrl(input:String, removeUrl:String) -> String {
        var input = input
        var formatedText = ""
        if let range = input.range(of: removeUrl) {
            input.removeSubrange(range)
            formatedText = input
        }
        return formatedText
    }
    
    static func changeDateFormat(input:String) -> String {
        
        var input = input
        
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd"
        let date = inputDateFormatter.date(from: input)
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "dd MMM yyyy"
        input = outputDateFormatter.string(from: date!)
        
        return input
    }
    
}

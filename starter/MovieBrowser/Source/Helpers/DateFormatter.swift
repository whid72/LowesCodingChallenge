//
//  DateFormatter.swift
//  MovieBrowser
//
//  Created by Rave Bizz on 6/10/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

let dateFormatterGet: DateFormatter = {
    let df = DateFormatter()
    df.dateFormat = "yyyy-MM-dd"
    return df
}()

let dateFormatterPrint: DateFormatter = {
    let df = DateFormatter()
    df.dateFormat = "MMM dd, yyyy"
    return df
}()

final class DateFormat {
    
    static let shared = DateFormat()
    
    func getDate(date: String?) -> String?{
        
        var string: String?
        if let date = dateFormatterGet.date(from: date ?? "" ) {
            string = dateFormatterPrint.string(from: date)
        } else {
           print("There was an error decoding the string")
        }
        return string
    }
}

//
//  Date+Ext.swift
//  GHfallowers
//
//  Created by Fen on 28/08/2024.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() ->String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM, yyyy"
        return dateFormatter.string(from: self)
    }
}

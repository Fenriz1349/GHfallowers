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
        dateFormatter.locale = Locale(identifier: "fr_FR") // Définir la locale en français
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: self)
    }
}

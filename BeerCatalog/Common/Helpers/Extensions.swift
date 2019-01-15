//
//  Extensions.swift
//  BeerCatalog
//
//  Created by Danilo Gonçalves Alves Ramos on 14/01/19.
//  Copyright © 2019 Danilo Ramos. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func currency() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        let digits = NSDecimalNumber(string: sanitized())
        let place = NSDecimalNumber(value: powf(10, 2))
        return formatter.string(from: digits.dividing(by: place))
    }
    
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    func sanitized() -> String {
        return filter { "01234567890".contains($0) }
    }
    
    func numbersAndDash() -> String {
        return filter { "01234567890-".contains($0) }
    }
    
    func isOnlyLetters() -> Bool{
        return self.matches("^[A-zÀ-ú ]*$")
    }
    
    func isOnlyLettersNoAccents() -> Bool{
        return self.matches("^[a-zA-Z ]*$")
    }
    
    func isAlphanumeric() -> Bool{
        return self.matches("^[0-9A-zÀ-ú ]*$")
    }
    
    func isAlphanumericAndSymbol() -> Bool{
        return self.matches("^[a-zA-Z0-9'&()ºª°\\-\\/,.\\s]*$")
    }
    
    func isOnlyNumbers() -> Bool{
        return self.matches("^[0-9]*$")
    }
    
    func isEmail() -> Bool{
        return self.matches("[A-Z0-9a-z._%+\\-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    }
    
    func isPhone() -> Bool{
        return self.matches("^\\([1-9]{2}\\) (?:[2-8][0-9]|9[1-9])[0-9]{2,3}\\-[0-9]{4}$")
    }
    
    func isMobile() -> Bool{
        return self.matches("^\\([1-9]{2}\\) (?:9[1-9])[0-9]{2,3}\\-[0-9]{4}$")
    }
    
    func isAddress() -> Bool{
        return self.matches("^[A-Za-z0-9'.\\-\\s,]{1,}(?: [a-zA-Z\\/]+){0,2}$")
    }
    
    func urlEncoded() -> String{
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self
    }
    
    subscript(_ range: CountableRange<Int>) -> String {
        
        if(self.count > range.lowerBound){
            let idx1 = index(startIndex, offsetBy: max(0, range.lowerBound))
            let idx2 = index(startIndex, offsetBy: min(self.count, range.upperBound))
            
            return String(self[idx1..<idx2])
        }else{
            return ""
        }
        
    }
    
    func index<T: StringProtocol>(of string: T, options: String.CompareOptions = []) -> Index? {
        return range(of: string, options: options)?.lowerBound
    }
    
    func removeUntil(found: String) -> String{
        
        if(self.range(of:found) == nil){
            return self
        }else{
            let index = self.range(of:found)
            return self[(index!.lowerBound.encodedOffset)..<self.count]
        }
    }
    
    func formatName() -> String {
        let nameArray = self.split(separator: " ")
        var formatedName = ""
        for name in nameArray {
            if (name.lowercased() == "de" ||
                name.lowercased() == "da" ||
                name.lowercased() == "dos" ||
                name.lowercased() == "das" ||
                name.lowercased() == "e") {
                formatedName += name.lowercased() + " "
            } else if (name == nameArray.last) {
                formatedName += String(name.prefix(1)).uppercased() + String(name.suffix(name.count-1)).lowercased()
            } else if (name != "") {
                formatedName += String(name.prefix(1)).uppercased() + String(name.suffix(name.count-1)).lowercased() + " "
            }
        }
        return formatedName
    }
    
    func isProperName() -> Bool {
        if (self.matches("^[A-zÀ-ú ]*$")) {
            let nameArray = self.split(separator: " ")
            for name in nameArray {
                if (name == "") {
                    return false
                }
            }
            return true
        } else {
            return false
        }
    }
    
    func firstCharUppercase() -> String {
        return String(self.prefix(1)).uppercased() + String(self.suffix(self.count-1)).lowercased()
    }
    
    func formatCPF() -> String {
        if (String(self.prefix(4)).last != "."){
            return String(self.prefix(3)) + "." + String(self[3..<6]) + "." + String(self[6..<9]) + "-" + String(self.suffix(self.count-9))
        } else {
            return self
        }
    }
    
    func toDateBR() -> String{
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date: Date? = dateFormatterGet.date(from: self)
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MM/yyyy"
        return date != nil ? dateFormatterPrint.string(from: date!) : self
    }
    
    func toHoursMinutesBR() -> String{
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        let date: Date? = dateFormatterGet.date(from: self)
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "HH:mm:ss"
        return date != nil ? dateFormatterPrint.string(from: date!) : self
    }
    
    func toDateSQL() -> String{
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "dd/MM/yyyy"
        let date: Date? = dateFormatterGet.date(from: self)
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return date != nil ? dateFormatterPrint.string(from: date!) : self
    }
    
    func fromDateBR() -> Date?{
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "dd/MM/yyyy"
        let date: Date? = dateFormatterGet.date(from: self)
        
        return date
    }
    
    func fromDateSQL() -> Date?{
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date: Date? = dateFormatterGet.date(from: self)
        
        if (date == nil) {
            return self.fromDateSQL2()
        }
        
        return date
    }
    
    func fromDateSQL2() -> Date?{
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        let date: Date? = dateFormatterGet.date(from: self)
        
        if (date == nil) {
            return self.fromDateSQL()
        }
        
        return date
    }
    
    func abreviateName(maxLength: Int) -> String {
        if (self.count > maxLength) {
            let nameArray = self.split(separator: " ")
            var abreviatedName = ""
            for name in nameArray {
                if (name == nameArray.first) {
                    abreviatedName += String(name.prefix(1)).uppercased() + String(name.suffix(name.count-1)).lowercased() + " "
                } else if (name == nameArray.last) {
                    abreviatedName += String(name.prefix(1)).uppercased() + String(name.suffix(name.count-1)).lowercased()
                } else if (name.lowercased() == "de" ||
                    name.lowercased() == "da" ||
                    name.lowercased() == "dos" ||
                    name.lowercased() == "das" ||
                    name.lowercased() == "e") {
                    abreviatedName += name.lowercased() + " "
                } else if (name != "") {
                    abreviatedName += String(name.prefix(1)).uppercased() + ". "
                }
            }
            return abreviatedName
        } else {
            let nameArray = self.split(separator: " ")
            var formatedName = ""
            for name in nameArray {
                if (name.lowercased() == "de" ||
                    name.lowercased() == "da" ||
                    name.lowercased() == "dos" ||
                    name.lowercased() == "das" ||
                    name.lowercased() == "e") {
                    formatedName += name.lowercased() + " "
                } else if (name == nameArray.last) {
                    formatedName += String(name.prefix(1)).uppercased() + String(name.suffix(name.count-1)).lowercased()
                } else if (name != "") {
                    formatedName += String(name.prefix(1)).uppercased() + String(name.suffix(name.count-1)).lowercased() + " "
                }
            }
            return formatedName
        }
    }
    
}


extension Date {
    
    func toDateBR() -> String{
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MM/yyyy"
        return dateFormatterPrint.string(from: self)
    }
    
    func toHoursMinutesBR() -> String{
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "HH:mm"
        return dateFormatterPrint.string(from: self)
    }
    
    func toDateSQL() -> String{
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatterPrint.string(from: self)
    }
    
    func toDatesBetween(date2: Date) -> [String]?{
        
        var arr : [String] = []
        var auxDate = self
        
        while(auxDate <= date2){
            
            arr.append(auxDate.toDateBR())
            let calendar = Calendar.current
            auxDate = calendar.date(byAdding: .day, value: 1, to: auxDate)!
        }
        
        return arr
    }
    
}

extension CGRect{
    init(_ x:CGFloat,_ y:CGFloat,_ width:CGFloat,_ height:CGFloat) {
        self.init(x:x,y:y,width:width,height:height)
    }
    
}
extension CGSize{
    init(_ width:CGFloat,_ height:CGFloat) {
        self.init(width:width,height:height)
    }
}
extension CGPoint{
    init(_ x:CGFloat,_ y:CGFloat) {
        self.init(x:x,y:y)
    }
}

public extension UIWindow {
    
    /** @return Returns the current Top Most ViewController in hierarchy.   */
    public func topMostWindowController()->UIViewController? {
        
        var topController = rootViewController
        
        while let presentedController = topController?.presentedViewController {
            topController = presentedController
        }
        
        return topController
    }
    
    /** @return Returns the topViewController in stack of topMostWindowController.    */
    public func currentViewController()->UIViewController? {
        
        var currentViewController = topMostWindowController()
        
        while currentViewController != nil && currentViewController is UINavigationController && (currentViewController as! UINavigationController).topViewController != nil {
            currentViewController = (currentViewController as! UINavigationController).topViewController
        }
        
        return currentViewController
    }
}

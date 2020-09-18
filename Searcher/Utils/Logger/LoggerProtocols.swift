//
//  LoggerProtocols.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 18/09/20.
//  Copyright © 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import Foundation


enum LoggerEvent: String {
    case error = "‼️" // error
    case info = "💬" // debug
    case warning = "⚠️" // warning
}

protocol LoggerProtocol {
    // Log mensaje de error
    static func error(_ object: Any, filename: String, functionName: String)
    
    // Log mensaje informativo
    static func info(_ object: Any, filename: String, functionName: String)
    
    // Log mensaje de advertencia
    static func warning(_ object: Any, filename: String, functionName: String)
}

extension LoggerProtocol {
    static func print(_ info: String, with object: Any) {
        Swift.print(info, object)
    }
    
    static func sourceFileName(filePath: String) -> String {
        return FileManager.default.displayName(atPath: filePath)
    }
}

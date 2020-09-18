//
//  Logger.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 18/09/20.
//  Copyright © 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import Foundation

final class Logger: LoggerProtocol {
    // Log mensaje de error
    static func error(_ object: Any, filename: String = #file, functionName: String = #function) {
        print("\(LoggerEvent.error.rawValue) :: [\(sourceFileName(filePath: filename))]: \(functionName) ->", with: object)
    }
    
    // Log mensaje informativo
    static func info(_ object: Any, filename: String = #file, functionName: String = #function) {
        print("\(LoggerEvent.info.rawValue) :: [\(sourceFileName(filePath: filename))]: \(functionName) ->", with: object)
    }
    
    // Log mensaje de advertencia
    static func warning(_ object: Any, filename: String = #file, functionName: String = #function) {
        print("\(LoggerEvent.warning.rawValue) :: [\(sourceFileName(filePath: filename))]: \(functionName) ->", with: object)
    }
}

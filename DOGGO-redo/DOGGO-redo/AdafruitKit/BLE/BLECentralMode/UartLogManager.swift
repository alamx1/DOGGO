//
//  UartLogManager.swift
//  DOGGO-redo
//
//  Created by Alam Figueroa Aguilar on 11/19/19.
//  Copyright © 2019 Michelle Natasha. All rights reserved.
//

import Foundation

class UartLogManager {

    fileprivate static var kIsEnabled = false

    enum LogType {
        case info
        case uartTx
        case uartRx

        var description: String {
            switch self {
            case .info: return ""
            case .uartTx: return "sent"
            case .uartRx: return "received"
            }
        }
    }

    struct LogItem {
        var type = LogType.info
        var data: Data
    }

    static var logItems = [LogItem]()

    static func log(data: Data, type: LogType) {
        if UartLogManager.kIsEnabled {
            let item = LogItem(type: type, data: data)
            UartLogManager.logItems.append(item)
        }
    }

    static func log(message: String, type: LogType = .info) {
        if UartLogManager.kIsEnabled {
            if let data = message.data(using: .utf8) {
                let item = LogItem(type: type, data: data)
                UartLogManager.logItems.append(item)
            }
        }
    }

    static func clearLog() {
        UartLogManager.logItems.removeAll()
    }
}

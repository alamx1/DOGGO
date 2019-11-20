//
//  Preferences.swift
//  DOGGO-redo
//
//  Created by Alam Figueroa Aguilar on 11/19/19.
//  Copyright © 2019 Michelle Natasha. All rights reserved.
//

import Foundation
import UIKit



class Preferences {

    // Note: if these contanst change, update DefaultPreferences.plist
    fileprivate static let appInSystemStatusBarKey = "AppInSystemStatusBar"

    fileprivate static let scanFilterIsPanelOpenKey = "ScanFilterIsPanelOpen"
    fileprivate static let scanFilterNameKey = "ScanFilterName"
    fileprivate static let scanFilterIsNameExactKey = "ScanFilterIsNameExact"
    fileprivate static let scanFilterIsNameCaseInsensitiveKey = "ScanFilterIsNameCaseInsensitive"
    fileprivate static let scanFilterRssiValueKey = "ScanFilterRssiValue"
    fileprivate static let scanFilterIsUnnamedEnabledKey = "ScanFilterIsUnnamedEnabled"
    fileprivate static let scanFilterIsOnlyWithUartEnabledKey = "ScanFilterIsOnlyWithUartEnabled"

  //  fileprivate static let scanMultiConnectIsPanelOpenKey = "ScanMultiConnectIsPanelOpenKey"

    // Firmware Updates
    fileprivate static let updateServerUrlKey = "UpdateServerUrl"
    fileprivate static let updateShowBetaVersionsKey = "UpdateShowBetaVersions"
    fileprivate static let updateIgnoredVersionKey = "UpdateIgnoredVersion"

    // Info
    fileprivate static let infoRefreshOnLoadKey = "InfoRefreshOnLoad"

    // Uart
    fileprivate static let uartIsDisplayModeTimestampKey = "UartIsDisplayModeTimestamp"
    fileprivate static let uartIsInHexModeKey = "UartIsInHexMode"
    fileprivate static let uartIsEchoEnabledKey = "UartIsEchoEnabled"
    fileprivate static let uartIsAutomaticEolEnabledKey = "UartIsAutomaticEolEnabled"
    fileprivate static let uartShowInvisibleCharsKey = "UartShowInvisibleChars"
    fileprivate static let uartEolCharactersIdKey = "UartEolCharactersId"

    // Neopixel
    fileprivate static let neopixelIsSketchTooltipEnabledKey = "NeopixelIsSketchTooltipEnabledKey"

    // Calibration
    private static let magnetometerTypeKey = "MagnetometerType"
    private static let accelerometerTypeKey = "AccelerometerType"
    private static let gyroscopeTypeKey = "GyroscopeType"

    private static let magnetometerGapTargetKey = "MagnetometerGapTarget"
    private static let magnetometerWobbleTargetKey = "MagnetometerWobbleTarget"
    private static let magnetometerVarianceTargetKey = "MagnetometerVarianceTarget"
    private static let magnetometerFitErrorTargetKey = "MagnetometerFitErrorTarget"

    private static let gyroReadingsCountKey = "GyroReadingsCount"
    private static let gyroNoiseLevelKey = "GyroNoiseLevel"
    private static let gyroUnitIdKey = "GyroUnitId"

    private static let visualizationXAxisInvertedKey = "VisualizationXAxisInverted"
    private static let visualizationYAxisInvertedKey = "VisualizationYAxisInverted"
    private static let visualizationZAxisInvertedKey = "VisualizationZAxisInverted"
    private static let visualizationXAxisFlippedKey = "VisualizationXAxisFlipped"
    private static let visualizationYAxisFlippedKey = "VisualizationYAxisFlipped"
    private static let visualizationZAxisFlippedKey = "VisualizationZAxisFlipped"
    private static let visualizationSwitchYZKey = "VisualizationSwitchYZ"

    private static let imageTransferResolutionKey = "ImageTransferResolution"
    private static let imageTransferInterleavedWithoutResponseCountKey = "ImageTransferInterleavedWithoutResponseCountKey"
    private static let imageTransferIsColorSpace24BitKey = "IsColorSpace24BitKey"

    
    // MARK: - General
    static var appInSystemStatusBar: Bool {
        get {
            return getBoolPreference(Preferences.appInSystemStatusBarKey)
        }
        set {
            setBoolPreference(Preferences.appInSystemStatusBarKey, newValue: newValue)
        }
    }

    // MARK: - Scanning Filters
    static var scanFilterIsPanelOpen: Bool {
        get {
            return getBoolPreference(Preferences.scanFilterIsPanelOpenKey)
        }
        set {
            setBoolPreference(Preferences.scanFilterIsPanelOpenKey, newValue: newValue)
        }
    }

    static var scanFilterName: String? {
        get {
            let defaults = UserDefaults.standard
            return defaults.string(forKey: Preferences.scanFilterNameKey)
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: Preferences.scanFilterNameKey)
        }
    }

    static var scanFilterIsNameExact: Bool {
        get {
            return getBoolPreference(Preferences.scanFilterIsNameExactKey)
        }
        set {
            setBoolPreference(Preferences.scanFilterIsNameExactKey, newValue: newValue)
        }
    }

    static var scanFilterIsNameCaseInsensitive: Bool {
        get {
            return getBoolPreference(Preferences.scanFilterIsNameCaseInsensitiveKey)
        }
        set {
            setBoolPreference(Preferences.scanFilterIsNameCaseInsensitiveKey, newValue: newValue)
        }
    }

    static var scanFilterRssiValue: Int? {
        get {
            let defaults = UserDefaults.standard
            let rssiValue = defaults.integer(forKey: Preferences.scanFilterRssiValueKey)
            return rssiValue >= 0 ? rssiValue:nil
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue ?? -1, forKey: Preferences.scanFilterRssiValueKey)
        }
    }

    static var scanFilterIsUnnamedEnabled: Bool {
        get {
            return getBoolPreference(Preferences.scanFilterIsUnnamedEnabledKey)
        }
        set {
            setBoolPreference(Preferences.scanFilterIsUnnamedEnabledKey, newValue: newValue)
        }
    }

    static var scanFilterIsOnlyWithUartEnabled: Bool {
        get {
            return getBoolPreference(Preferences.scanFilterIsOnlyWithUartEnabledKey)
        }
        set {
            setBoolPreference(Preferences.scanFilterIsOnlyWithUartEnabledKey, newValue: newValue)
        }
    }
    /*
    // MARK: - Scanning MultiConnect
    static var scanMultiConnectIsPanelOpen: Bool {
        get {
            return getBoolPreference(Preferences.scanMultiConnectIsPanelOpenKey)
        }
        set {
            setBoolPreference(Preferences.scanMultiConnectIsPanelOpenKey, newValue: newValue)
        }
    }
    */

    // MARK: - Firmware Updates
    static var updateServerUrl: URL? {
        get {
            let defaults = UserDefaults.standard
            let urlString = defaults.string(forKey: Preferences.updateServerUrlKey)
            if let urlString = urlString {
                return URL(string: urlString)
            } else {
                return nil
            }
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue?.absoluteString, forKey: Preferences.updateServerUrlKey)
            NotificationCenter.default.post(name: .didUpdatePreferences, object: nil)
        }
    }

    static var showBetaVersions: Bool {
        get {
            return getBoolPreference(Preferences.updateShowBetaVersionsKey)
        }
        set {
            setBoolPreference(Preferences.updateShowBetaVersionsKey, newValue: newValue)
        }
    }

    static var softwareUpdateIgnoredVersion: String? {
        get {
            let defaults = UserDefaults.standard
            return defaults.string(forKey: Preferences.updateIgnoredVersionKey)
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: Preferences.updateIgnoredVersionKey)
        }
    }

    // MARK: - Info
    static var infoIsRefreshOnLoadEnabled: Bool {
        get {
            return getBoolPreference(Preferences.infoRefreshOnLoadKey)
        }
        set {
            setBoolPreference(Preferences.infoRefreshOnLoadKey, newValue: newValue)
        }
    }

    // MARK: - Uart
    static var uartShowInvisibleChars: Bool {
        get {
            return getBoolPreference(Preferences.uartShowInvisibleCharsKey)
        }
        set {
            setBoolPreference(Preferences.uartShowInvisibleCharsKey, newValue: newValue)
        }
    }

    static var uartIsDisplayModeTimestamp: Bool {
        get {
            return getBoolPreference(Preferences.uartIsDisplayModeTimestampKey)
        }
        set {
            setBoolPreference(Preferences.uartIsDisplayModeTimestampKey, newValue: newValue)
        }
    }

    static var uartIsInHexMode: Bool {
        get {
            return getBoolPreference(Preferences.uartIsInHexModeKey)
        }
        set {
            setBoolPreference(Preferences.uartIsInHexModeKey, newValue: newValue)
        }
    }

    static var uartIsEchoEnabled: Bool {
        get {
            return getBoolPreference(Preferences.uartIsEchoEnabledKey)
        }
        set {
            setBoolPreference(Preferences.uartIsEchoEnabledKey, newValue: newValue)
        }
    }

    static var uartIsAutomaticEolEnabled: Bool {
        get {
            return getBoolPreference(Preferences.uartIsAutomaticEolEnabledKey)
        }
        set {
            setBoolPreference(Preferences.uartIsAutomaticEolEnabledKey, newValue: newValue)
        }
    }
    
    static var uartEolCharactersId: Int {
        get {
            return UserDefaults.standard.integer(forKey: Preferences.uartEolCharactersIdKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Preferences.uartEolCharactersIdKey)
        }
    }
    
    static var uartEolCharacters: String {
        var uartEolCharacters: String
        switch Preferences.uartEolCharactersId {
        case 1: uartEolCharacters = "\r"
        case 2: uartEolCharacters = "\n\r"
        case 3: uartEolCharacters = "\r\n"
        default: uartEolCharacters = "\n"
        }
        return uartEolCharacters
    }

// MARK: - Defaults
    static func registerDefaults() {
        let path = Bundle.main.path(forResource: "DefaultPreferences", ofType: "plist")!
        let defaultPrefs = NSDictionary(contentsOfFile: path) as! [String: AnyObject]

        UserDefaults.standard.register(defaults: defaultPrefs)
    }

    static func resetDefaults() {
        let appDomain = Bundle.main.bundleIdentifier!
        let defaults = UserDefaults.standard
        defaults.removePersistentDomain(forName: appDomain)
    }
}

// MARK: - Custom Notifications
extension Notification.Name {
    private static let kPrefix = Bundle.main.bundleIdentifier!

    static let  didUpdatePreferences = Notification.Name(kPrefix+".didUpdatePreferences")
}

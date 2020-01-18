import Foundation
import CoreFoundation

public extension CFNumber {
    
    static let positiveInfinity = kCFNumberPositiveInfinity!
    static let negativeInfinity = kCFNumberNegativeInfinity!
    static let naN = kCFNumberNaN!
    
    @inlinable var byteSize: CFIndex {
        return CFNumberGetByteSize(self)
    }
    
    @inlinable var isFloatType: Bool {
        return CFNumberIsFloatType(self)
    }
    
    #if canImport(Darwin)
    
    @inlinable var type: CFNumberType {
        return CFNumberGetType(self)
    }
    
    @inlinable var intValue: Int {
        var result: Int = 0
        CFNumberGetValue(self, .nsIntegerType, &result)
        return result
    }
    
    @inlinable var cgFloatValue: CGFloat {
        var result: CGFloat = 0
        CFNumberGetValue(self, .cgFloatType, &result)
        return result
    }
    
    #endif
}

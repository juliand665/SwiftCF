import XCTest
import CoreText
@testable import SwiftCF

final class SwiftCFTests: XCTestCase {
    
    func testTypeCasting() {
        for type in CFTestData.dataSourceTypesExceptMutable {
            for value in type.allTestValues {
                let model = type.cast(type.testValue)!
                let typed = type.cast(value)
                XCTAssertNotNil(typed)
                XCTAssert(typed!.cfEqual(to: model))
            }
            for value in CFTestData.valuesExceptMutableAnd(type: type) {
                XCTAssertNil(type.cast(value))
            }
        }
    }
    
    func testCollectionProtocolConformance() {
        let arr = [1, 3.14, "foo"] as CFArray
        for _ in arr {
            
        }
    }
    
    func testCFArrayCallBacks() {
        let arr = CFMutableArray.create()
        weak var weakObj: AnyObject?
        do {
            let data = CFData.create(bytes: nil, length: 0)
            arr.append(data)
            weakObj = data
        }
        XCTAssertNotNil(weakObj)
    }
    
    static var allTests = [
        ("testTypeCasting", testTypeCasting),
        ("testCollectionProtocolConformance", testCollectionProtocolConformance),
        ("testCFArrayCallBacks", testCFArrayCallBacks),
    ]
}

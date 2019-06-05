import Foundation
#if !os(Linux)
import CoreGraphics
#endif

public final class Number {
  fileprivate var lastUsedId: Int64 = 0

  public func randomBool() -> Bool {
    return randomInt() % 2 == 0
  }

  public func randomInt(min: Int = 0, max: Int = 1000) -> Int {
    var i: Int = 0
    #if swift(>=4.2)
    i = Int.random(in: i..<Int.max)
    #else
    arc4random_buf(&i, MemoryLayout.size(ofValue: i))
    i = i & Int.max // Make the number positive
    #endif

    if max >= 0 && max - Int.max >= min {
      return min + i
    }

    return min + (i % (max - min))
  }

  public func randomFloat(min: Float = 0, max: Float = 1000) -> Float {
    #if swift(>=4.2)
    return (Float.random(in: 0..<Float.greatestFiniteMagnitude) / Float.greatestFiniteMagnitude) * (max - min) + min
    #else
    return (Float(arc4random()) / Float(UInt32.max)) * (max - min) + min
    #endif
  }
  #if !os(Linux)
  public func randomCGFloat(min: CGFloat = 0, max: CGFloat = 1000) -> CGFloat {
    return CGFloat(Float(arc4random()) / Float(UInt32.max)) * (max - min) + min
  }
  #endif

  public func randomDouble(min: Double = 0, max: Double = 1000) -> Double {
    #if swift(>=4.2)
    return (Double.random(in: 0..<Double.greatestFiniteMagnitude) / Double.greatestFiniteMagnitude) * (max - min) + min
    #else
    return (Double(arc4random()) / Double(UInt32.max)) * (max - min) + min
    #endif
  }

  public func increasingUniqueId() -> Int {
    #if os(Linux)
    // increasing just by one on linux due to the lack of an method like OSAtomicIncrement64
    lastUsedId += 1
    #else
      OSAtomicIncrement64(&lastUsedId)
    #endif
    return Int(lastUsedId)
  }
}

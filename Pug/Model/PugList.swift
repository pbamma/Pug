//
//  PugList.swift
//
//  Created by Philip Starner on 1/25/18
//  Copyright (c) Philip Starner. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct PugList {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let pugs = "pugs"
  }

  // MARK: Properties
  public var pugs: [String]?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public init(json: JSON) {
    
    //TODO: clean up this list item and remove numeric subdoman
    //http://30.media.tumblr.com/tumblr_lqexmferHa1qg02ino1_500.jpg
    if let items = json[SerializationKeys.pugs].array { pugs = items.map { $0.stringValue.cleanNumericSubdomain } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = pugs { dictionary[SerializationKeys.pugs] = value }
    return dictionary
  }

}

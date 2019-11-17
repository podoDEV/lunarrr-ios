//
//  Event.swift
//  Lunarrr
//
//  Created by hb1love on 2019/11/09.
//  Copyright © 2019 podo. All rights reserved.
//

import Foundation
import Scope

class Event: Equatable {
  var id: String?
  var title: String?
  var date: Date?

  var stringForSolar: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "M월 d일"
    dateFormatter.locale = .current
    dateFormatter.calendar = Calendar(identifier: .gregorian)

    guard let date = self.date else { return "" }
    return dateFormatter.string(from: date)
  }

  init(title: String, date: Date) {
    self.title = title
    self.date = date
  }

  init(event: RealmEvent) {
    self.id = event.id
    self.title = event.title
    self.date = event.date
  }

  func convertForRealm() -> RealmEvent {
    return RealmEvent().also {
      if let id = self.id {
        $0.id = id
      }
      $0.title = self.title ?? ""
      $0.date = self.date ?? Date()
    }
  }

  static func == (lhs: Event, rhs: Event) -> Bool {
    return lhs.title == rhs.title
      && lhs.date == rhs.date
  }
}

// Copyright (c) native.dev.br. All rights reserved.
// Licensed under the Apache 2.0 License. See LICENSE file in the project root for full license information.

import XCTest

@testable import Logger

final class LoggerTests: XCTestCase {
  func testDefaultFormatter() {
    let formatter = Logger.Formatter.default

    let message = Logger.Message(
      date: Date(timeIntervalSince1970: 0),
      level: .info,
      msg: "this is an example log message",
      function: "testDefaultFormatter()",
      file: "LoggerTests/LoggerTests.swift",
      line: 18,
      context: ["id": "deadbeef"],
      system: "br.dev.native.logger.tests"
    )

    let result = formatter.format(message)
    XCTAssertEqual(
      result,
      "1970-01-01T00:00:00Z [INFO][br.dev.native.logger.tests] this is an example log message LoggerTests/LoggerTests.swift.testDefaultFormatter():18 | [\"id\": \"deadbeef\"]"
    )
  }
}

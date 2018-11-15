//
//  Constant.swift
//  DrawerAndTabar
//
//  Created by HoangLM on 11/7/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import Foundation

class Constant {
#if PRODUCTION
    static let BASE_API_URL = "https://mobile.drjoy.jp/"
    static let GOOGLE_SERVICE_INFO = "master-GoogleService-Info"
    static let BASE_SOCKET_URL = "wss://rtm.drjoy.jp/event/websocket"
    static let SUBSCRIBE_CHANNEL = "/user/exchange/amq.direct/messages"
    static let SUBSCRIBE_ERROR = "/user/exchange/amq.direct/errors"
    static let LOGIN_USER_UPDATE_INFO_URL = "https://app.drjoy.jp/"
#elseif DEV
    static let BASE_API_URL = "https://staging-mobile.famishare.jp/"
    static let GOOGLE_SERVICE_INFO = "stg-GoogleService-Info"
    static let BASE_SOCKET_URL = "wss://staging-rtm.famishare.jp/event/websocket"
    static let SUBSCRIBE_CHANNEL = "/user/exchange/amq.direct/messages"
    static let SUBSCRIBE_ERROR = "/user/exchange/amq.direct/errors"
    static let LOGIN_USER_UPDATE_INFO_URL = "https://staging.drjoy.famishare.jp/"
#endif
}

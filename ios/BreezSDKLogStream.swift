import Foundation

class BreezSDKLogStream: NSObject, LogStream {
    var emitter: RCTEventEmitter
    
    static let emitterName: String = "breezSdkLog"
    
    init(emitter: RCTEventEmitter) {
        self.emitter = emitter
    }
    
    func log(l: LogEntry) {
        self.emitter.sendEvent(withName: BreezSDKListener.emitterName,
                               body: [
                                "line":  l.line,
                                "level": l.level
                               ])
    }
}

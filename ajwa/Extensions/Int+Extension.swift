import Foundation

extension Int {
    var time: String {
        let minute = self / 60 % 60
        let second = self % 60
        return String(format: "%02i:%02i", minute, second)
    }
}

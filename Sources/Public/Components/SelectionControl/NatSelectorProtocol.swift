/// Alias for the callback of a selection method
public typealias SelectionHandler = (Bool) -> Void

protocol NatSelector: UIControl, Pulsable {
    var isHapticFeedbackEnabled: Bool { get set }
    var isIndeterminate: Bool { get set }
    var labelComponent: String? { get set }
    var isGrouped: Bool { get set }
    var groupId: Int { get set }
    var handler: SelectionHandler? { get set }
}

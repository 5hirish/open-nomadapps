/// A signal's normal: the median and a robust spread over the last 28 days (recovery-spec §3).
public struct Baseline: Equatable, Sendable {
    public let median: Double
    /// max(1.4826 × MAD, floor).
    public let spread: Double
    /// How many days had a value.
    public let days: Int

    /// `nil` when fewer than `YuktaSpec.minimumBaselineDays` values exist.
    public init?(values: [Double], floor: Double) {
        guard values.count >= YuktaSpec.minimumBaselineDays else { return nil }
        let m = Baseline.median(of: values)
        let mad = Baseline.median(of: values.map { abs($0 - m) })
        self.median = m
        self.spread = max(1.4826 * mad, floor)
        self.days = values.count
    }

    /// (value − median) / spread, clamped to [−3, 3].
    public func z(_ value: Double) -> Double {
        min(3, max(-3, (value - median) / spread))
    }

    static func median(of values: [Double]) -> Double {
        let sorted = values.sorted()
        let mid = sorted.count / 2
        return sorted.count % 2 == 0 ? (sorted[mid - 1] + sorted[mid]) / 2 : sorted[mid]
    }
}

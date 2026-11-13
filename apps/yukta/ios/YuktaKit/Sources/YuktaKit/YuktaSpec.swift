/// Versions and constants from the specs in docs/yukta/engineering/. Bump a
/// version with any change to that spec's formulas, constants or rules, and
/// regenerate apps/yukta/spec/fixtures.
public enum YuktaSpec {
    /// energy-spec.md: weight trend, expenditure estimate, targets, guardrails.
    public static let energyVersion = "0.1.0"

    /// recovery-spec.md: the v1.1 recovery pillar (HRV, resting heart rate, sleep).
    public static let recoveryVersion = "0.1.0"

    /// Days before today that a recovery baseline looks at (recovery-spec §3).
    public static let baselineWindowDays = 28

    /// Days with a value needed before a signal counts as baselined (recovery-spec §3).
    public static let minimumBaselineDays = 7

    /// Baseline days needed for HRV and resting heart rate to reach High confidence (recovery-spec §6).
    public static let highConfidenceBaselineDays = 14
}

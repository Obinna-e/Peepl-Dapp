class VestingSchedule {
  final bool initialized;

  final BigInt cliff;

  final int start;

  final BigInt duration;

  final BigInt slicePeriodSeconds;

  final bool revocable;

  final BigInt amountTotal;

  final BigInt released;

  final bool revoked;

  VestingSchedule(
    this.initialized,
    this.cliff,
    this.start,
    this.duration,
    this.slicePeriodSeconds,
    this.revocable,
    this.amountTotal,
    this.released,
    this.revoked,
  );
}

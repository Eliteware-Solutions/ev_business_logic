enum ChargingEnum { pure, start, pause, finish }

extension ChargingEnumExtension on ChargingEnum {
  bool get isPure => this == ChargingEnum.pure;
  bool get isStart => this == ChargingEnum.start;
  bool get isPause => this == ChargingEnum.pause;
  bool get isFinish => this == ChargingEnum.finish;
}

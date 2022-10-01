abstract class EnvConfig {
  factory EnvConfig(String flavor) {
    if (flavor == 'prod') {
      return const EnvConfig.production();
    }
    return const EnvConfig.staging();
  }

  const factory EnvConfig.staging() = EnvConfigSTG;
  const factory EnvConfig.production() = EnvConfigPROD;

  String get envName;
  String get storeUrl;
  String get baseDomain;
  String get apiBaseUrl;
  String get privacyPolicyUrl;
  String get termsOfUseUrl;
  String get contactUrl;
  String get sentryDns;
}

class EnvConfigSTG implements EnvConfig {
  const EnvConfigSTG();
  @override
  String get envName => 'stg';
  @override
  String get apiBaseUrl => throw UnimplementedError();
  @override
  String get baseDomain => throw UnimplementedError();
  @override
  String get contactUrl => throw UnimplementedError();
  @override
  String get privacyPolicyUrl => throw UnimplementedError();
  @override
  String get sentryDns => throw UnimplementedError();
  @override
  String get storeUrl => throw UnimplementedError();
  @override
  String get termsOfUseUrl => throw UnimplementedError();
}

class EnvConfigPROD implements EnvConfig {
  const EnvConfigPROD();
  @override
  String get envName => 'prod';
  @override
  String get apiBaseUrl => throw UnimplementedError();
  @override
  String get baseDomain => throw UnimplementedError();
  @override
  String get contactUrl => throw UnimplementedError();
  @override
  String get privacyPolicyUrl => throw UnimplementedError();
  @override
  String get sentryDns => throw UnimplementedError();
  @override
  String get storeUrl => throw UnimplementedError();
  @override
  String get termsOfUseUrl => throw UnimplementedError();
}

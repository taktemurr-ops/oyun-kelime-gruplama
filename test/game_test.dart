import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kelime_gruplama/oyun_kelime_gruplama.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(dortluGruplarConfig.title.length, 33);
    expect(dortluGruplarConfig.tagline.length, 33);
    for (final s in dortluGruplarConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(dortluGruplarConfig.gameId, dortluGruplarId);
    expect(dortluGruplarRules.gameId, dortluGruplarId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(dortluGruplarRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: dortluGruplarId, optionalMechanics: dortluGruplarRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      dortluGruplarRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(dortluGruplarRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}

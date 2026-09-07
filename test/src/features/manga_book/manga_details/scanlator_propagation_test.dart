// Copyright (c) 2026 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter_test/flutter_test.dart';
import 'package:tsumiru/src/features/manga_book/presentation/manga_details/controller/scanlator_dedup.dart';

import 'chapter_test_helpers.dart';

void main() {
  group('read/delete mutation matching', () {
    test('does not propagate across same-number scanlators', () {
      final chapters = [
        ch(id: 1, number: 1, scanlator: 'A'),
        ch(id: 2, number: 1, scanlator: 'B'),
      ];
      expect(expandIdsForDuplicates(chapters, [1]), [1]);
    });

    test('does not propagate between a regular and special chapter', () {
      final chapters = [
        ch(id: 1, number: 6, name: 'Chapter 6', scanlator: 'A'),
        ch(id: 2, number: 6, name: 'Special 6', scanlator: 'A'),
      ];
      expect(expandIdsForDuplicates(chapters, [1]), [1]);
    });

    test('does not propagate across restarted season numbering', () {
      final chapters = [
        ch(id: 1, number: 1, name: 'Season 1 Chapter 1', scanlator: 'A'),
        ch(id: 2, number: 1, name: 'Season 2 Chapter 1', scanlator: 'B'),
      ];
      expect(expandIdsForDuplicates(chapters, [1]), [1]);
    });

    test('does not propagate Chapter 0 by number alone', () {
      final chapters = [
        ch(id: 1, number: 0, scanlator: 'A'),
        ch(id: 2, number: 0, scanlator: 'B'),
      ];
      expect(expandIdsForDuplicates(chapters, [1]), [1]);
    });

    test('never reconciles read state by chapter number', () {
      final chapters = [
        ch(id: 1, number: 1, scanlator: 'A', isRead: true),
        ch(id: 2, number: 1, scanlator: 'B'),
      ];
      expect(reconcileIdsForReadNumbers(chapters), isEmpty);
    });
  });
}

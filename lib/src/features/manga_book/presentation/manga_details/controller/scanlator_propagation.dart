// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Compatibility helper for widget call sites. The server exposes no stable
/// duplicate relation, so read/delete actions target only the selected rows.
List<int> expandIdsAcrossScanlators(
  WidgetRef _, {
  required int mangaId,
  required List<int> chapterIds,
}) {
  return chapterIds;
}

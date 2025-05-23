import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as p;

import '../../constants/constants.dart';
import '../../utils/extension/extension.dart';
import '../../utils/file.dart';
import '../../widgets/dialog.dart';
import '../provider/database_provider.dart';
import 'landing.dart';

// https://sqlite.org/rescode.html
const _kSqliteCorrupt = 11;
const _kSqliteLocked = 6;
const _kSqliteNotADb = 26;
const _kSqliteIOErr = 10;

class DatabaseOpenFailedPage extends StatelessWidget {
  const DatabaseOpenFailedPage({required this.error, super.key});

  final SqliteException error;

  @override
  Widget build(BuildContext context) {
    final String message;
    switch (error.resultCode) {
      case _kSqliteCorrupt:
        message = context.l10n.databaseCorruptedTips;
      case _kSqliteLocked:
        message = context.l10n.databaseLockedTips;
      case _kSqliteNotADb:
        message = context.l10n.databaseNotADbTips;
      default:
        message = '${error.explanation}';
    }
    final canDeleteDatabase = const {
      _kSqliteCorrupt,
      _kSqliteNotADb,
      _kSqliteIOErr,
    }.contains(error.resultCode);

    return LandingFailedPage(
      title: context.l10n.failedToOpenDatabase,
      message: message,
      actions: [
        if (canDeleteDatabase)
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: _RecreateDatabaseButton(),
          ),
        _Button(
          onTap: () {
            exit(1);
          },
          text: context.l10n.exit,
        ),
      ],
    );
  }
}

class _RecreateDatabaseButton extends HookConsumerWidget {
  const _RecreateDatabaseButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) => TextButton(
    onPressed: () async {
      final identityNumber = context.account?.identityNumber;
      if (identityNumber == null) return;

      final result = await showConfirmMixinDialog(
        context,
        context.l10n.databaseRecreateTips,
        positiveText: context.l10n.create,
      );
      if (result != DialogEvent.positive) {
        return;
      }
      await ref.read(databaseProvider.notifier).close();
      // Rename the old database file to a new name with timestamp.
      final now = DateTime.now();
      renameFileWithTime(
        p.join(mixinDocumentsDirectory.path, identityNumber, '$kDbFileName.db'),
        now,
      );
      await Future.forEach(
        [
          File(
            p.join(
              mixinDocumentsDirectory.path,
              identityNumber,
              '$kDbFileName.db-shm',
            ),
          ),
          File(
            p.join(
              mixinDocumentsDirectory.path,
              identityNumber,
              '$kDbFileName.db-wal',
            ),
          ),
        ].where((e) => e.existsSync()),
        (element) => element.delete(),
      );
      await ref.read(databaseProvider.notifier).open();
    },
    child: Text(
      context.l10n.continueText,
      style: TextStyle(color: context.theme.red),
    ),
  );
}

class _Button extends StatelessWidget {
  const _Button({required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: context.theme.accent,
      foregroundColor: Colors.white,
    ),
    onPressed: onTap,
    child: Text(text),
  );
}

class LandingFailedPage extends StatelessWidget {
  const LandingFailedPage({
    required this.message,
    required this.actions,
    required this.title,
    super.key,
  });

  final String title;
  final String message;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) => LandingScaffold(
    child: Column(
      children: [
        const SizedBox(height: 32),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: TextStyle(
              color: context.theme.text,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            message,
            style: TextStyle(color: context.theme.text, fontSize: 14),
          ),
        ),
        const Spacer(),
        ...actions,
        const SizedBox(height: 32),
      ],
    ),
  );
}

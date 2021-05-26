import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:provider/provider.dart';

import '../../../account/account_server.dart';
import '../../../db/mixin_database.dart';
import '../../../generated/l10n.dart';
import '../../../utils/hook.dart';
import '../../../utils/list_utils.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/avatar_view/avatar_view.dart';
import '../../../widgets/brightness_observer.dart';
import '../../../widgets/high_light_text.dart';
import '../../../widgets/menu.dart';
import '../../../widgets/search_text_field.dart';
import '../../../widgets/toast.dart';
import '../bloc/conversation_cubit.dart';
import '../conversation_page.dart';

/// The participants of group.
class GroupParticipantsPage extends HookWidget {
  const GroupParticipantsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filterKeyWord = useState('');
    return Scaffold(
      backgroundColor: BrightnessData.themeOf(context).primary,
      appBar: MixinAppBar(
        title: Text(Localization.of(context).groupParticipants),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SearchTextField(
              onChanged: (text) => filterKeyWord.value = text,
              hintText: Localization.of(context).groupSearchParticipants,
            ),
          ),
          Expanded(
            child: _ParticipantList(
              filterKeyword: filterKeyWord.value.trim(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ParticipantList extends HookWidget {
  const _ParticipantList({
    Key? key,
    this.filterKeyword = '',
  }) : super(key: key);

  /// The keyword to filter participants of group.
  /// Empty indicates non filter.
  final String filterKeyword;

  @override
  Widget build(BuildContext context) {
    final conversationId =
        useBlocStateConverter<ConversationCubit, ConversationState?, String?>(
            converter: (state) => state?.conversationId,
            when: (conversationId) => conversationId != null);
    assert(conversationId != null);

    final participants = useStream(useMemoized(() {
          final dao = context.read<AccountServer>().database.participantsDao;
          return dao.watchParticipants(conversationId!);
        }, [conversationId])).data ??
        const <ParticipantUser>[];

    // Find current user infos to check if we have group manage permission.
    final me = useMemoized(
      () => participants.firstWhereOrNull(
          (e) => e.userId == context.read<AccountServer>().userId),
      [participants],
    );

    assert(!(participants.isNotEmpty && me == null));

    final filteredParticipants = useMemoized(() {
      if (filterKeyword.isEmpty) {
        return participants;
      }
      return participants
          .where((e) =>
              (e.fullName
                      ?.toLowerCase()
                      .contains(filterKeyword.toLowerCase()) ??
                  false) ||
              e.identityNumber.contains(filterKeyword))
          .toList();
    }, [participants, filterKeyword]);

    return ListView.builder(
      itemCount: filteredParticipants.length,
      itemBuilder: (context, index) => _ParticipantTile(
        participant: filteredParticipants[index],
        me: me!,
        keyword: filterKeyword,
      ),
    );
  }
}

class _ParticipantTile extends StatelessWidget {
  const _ParticipantTile({
    required this.participant,
    Key? key,
    required this.me,
    required this.keyword,
  }) : super(key: key);

  final ParticipantUser participant;

  final ParticipantUser me;

  final String keyword;

  @override
  Widget build(BuildContext context) {
    final self = participant.userId == me.userId;
    return _ParticipantMenuEntry(
      participant: participant,
      me: me,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        leading: AvatarWidget(
          size: 50,
          avatarUrl: participant.avatarUrl,
          userId: participant.userId,
          name: participant.fullName ?? '?',
        ),
        title: Row(
          children: [
            Flexible(
              child: HighlightText(
                participant.fullName ?? '?',
                style: TextStyle(
                  color: BrightnessData.themeOf(context).text,
                  fontSize: 16,
                ),
                highlightTextSpans: [
                  HighlightTextSpan(
                    keyword,
                    style: TextStyle(
                      color: BrightnessData.themeOf(context).accent,
                    ),
                  )
                ],
              ),
            ),
            VerifiedOrBotWidget(
              isBot: participant.appId != null,
              verified: participant.isVerified,
            ),
          ],
        ),
        onTap: () {
          // skip self
          if (self) {
            return;
          }
          context.read<ConversationCubit>().selectUser(participant.userId);
        },
        onLongPress: () {},
        trailing: _RoleWidget(role: participant.role),
      ),
    );
  }
}

class _ParticipantMenuEntry extends StatelessWidget {
  const _ParticipantMenuEntry({
    Key? key,
    required this.child,
    required this.participant,
    required this.me,
  }) : super(key: key);

  final ParticipantUser participant;
  final ParticipantUser me;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final self = participant.userId == context.read<AccountServer>().userId;
    if (self) {
      return child;
    }

    return ContextMenuPortalEntry(
      buildMenus: () {
        final menus = [
          ContextMenu(
            title: Localization.of(context)
                .groupPopMenuMessage(participant.fullName ?? '?'),
            onTap: () {
              context.read<ConversationCubit>().selectUser(participant.userId);
            },
          ),
        ];
        if (me.role == ParticipantRole.owner) {
          if (participant.role != ParticipantRole.admin) {
            menus.add(ContextMenu(
              title: Localization.of(context).groupPopMenuMakeAdmin,
              onTap: () => runFutureWithToast(
                context,
                context.read<AccountServer>().updateParticipantRole(
                    context.read<ConversationCubit>().state!.conversationId,
                    participant.userId,
                    ParticipantRole.admin),
              ),
            ));
          } else {
            menus.add(ContextMenu(
              title: Localization.of(context).groupPopMenuDismissAdmin,
              onTap: () => runFutureWithToast(
                  context,
                  context.read<AccountServer>().updateParticipantRole(
                      context.read<ConversationCubit>().state!.conversationId,
                      participant.userId,
                      null)),
            ));
          }
        }

        if (me.role != null && participant.role == null ||
            me.role == ParticipantRole.owner) {
          menus.add(ContextMenu(
            isDestructiveAction: true,
            title: Localization.of(context)
                .groupPopMenuRemoveParticipants(participant.fullName ?? '?'),
            onTap: () => runFutureWithToast(
                context,
                context.read<AccountServer>().removeParticipant(
                    context.read<ConversationCubit>().state!.conversationId,
                    participant.userId)),
          ));
        }
        return menus;
      },
      child: child,
    );
  }
}

class _RoleWidget extends StatelessWidget {
  const _RoleWidget({Key? key, required this.role}) : super(key: key);
  final ParticipantRole? role;

  @override
  Widget build(BuildContext context) {
    switch (role) {
      case ParticipantRole.owner:
        return _RoleLabel(Localization.of(context).groupOwner);
      case ParticipantRole.admin:
        return _RoleLabel(Localization.of(context).groupAdmin);
      default:
        return Container(width: 0);
    }
  }
}

class _RoleLabel extends StatelessWidget {
  const _RoleLabel(this.label, {Key? key}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) => Text(
        label,
        style: TextStyle(
          color: BrightnessData.themeOf(context).secondaryText,
          fontSize: 14,
        ),
      );
}

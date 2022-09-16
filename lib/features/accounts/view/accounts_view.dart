import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neyasischallenge/core/extension/context_extension.dart';
import 'package:neyasischallenge/core/init/lang/locale_keys.g.dart';
import 'package:neyasischallenge/core/init/router/app_router.dart';
import 'package:neyasischallenge/features/accounts/cubit/accounts_cubit.dart';
import 'package:neyasischallenge/features/accounts/service/accounts_service.dart';
import 'package:neyasischallenge/features/add_or_update_account/model/account_response_model.dart';

class AccountsView extends StatelessWidget {
  const AccountsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountsCubit>(
      create: (context) => AccountsCubit(AccountsService()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.accountList.locale),
          actions: [
            IconButton(
                onPressed: () {
                  context.router.push(AddOrUpdateAccountRoute(model: null));
                },
                icon: const Icon(
                  Icons.add_circle,
                  size: 40,
                ))
          ],
        ),
        body: BlocConsumer<AccountsCubit, AccountsState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              error: (message) =>
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message))),
            );
          },
          builder: (context, state) => state.when(
            initial: () => _emptyWidget(),
            loading: () => _loadingWidget(),
            success: (accounts, totalCount, totalPage, currentPage) => accounts.isNotEmpty
                ? RefreshIndicator(
                    onRefresh: () => context.read<AccountsCubit>().getAccounts(page: currentPage),
                    child: _buildAccountListWidget(context, accounts, totalCount, totalPage, currentPage))
                : _emptyWidget(),
            error: (message) => _tryAgainWhileErrorWidget(context),
          ),
        ),
      ),
    );
  }

  Column _buildAccountListWidget(BuildContext context, List<AccountResponseModel> accounts, int totalCount,
      int currentPage, int totalPage) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: accounts.length,
            itemBuilder: (context, index) {
              return _accountCardWidget(context, accounts, index, currentPage);
            },
          ),
        ),
        Expanded(
          flex: 0,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            TextButton(
              onPressed: currentPage > 1
                  ? () => context.read<AccountsCubit>().nextOrBackAccounts(isNext: false)
                  : null,
              child: Text(LocaleKeys.back.locale),
            ),
            Chip(
              label: Text('$currentPage/${totalPage.toString()}'),
            ),
            TextButton(
                onPressed: currentPage < totalPage
                    ? () => context.read<AccountsCubit>().nextOrBackAccounts(isNext: true)
                    : null,
                child: Text(LocaleKeys.next.locale)),
          ]),
        )
      ],
    );
  }

  Card _accountCardWidget(
      BuildContext context, List<AccountResponseModel> accounts, int index, int currentPage) {
    return Card(
      child: ListTile(
        leading: Text(accounts[index].age),
        title: Text(
          accounts[index].fullName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Wrap(
          children: [
            IconButton(
              onPressed: () {
                context.router.push(AddOrUpdateAccountRoute(model: accounts[index]));
              },
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () async {
                await context
                    .read<AccountsCubit>()
                    .deleteAccount(id: accounts[index].id ?? "", currentPage: currentPage);
              },
              icon: const Icon(Icons.delete),
            )
          ],
        ),
        subtitle: Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.vertical,
          children: [
            Text(accounts[index].phone),
            Text(accounts[index].identityNumber),
            Text(accounts[index].sallaryWithCurrentSembol),
          ],
        ),
      ),
    );
  }

  Center _emptyWidget() => Center(
        child: Text(LocaleKeys.emptyAccountList.locale),
      );

  Center _loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Center _tryAgainWhileErrorWidget(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () async {
            await context.read<AccountsCubit>().getAccounts(page: 1);
          },
          child: Text(LocaleKeys.tryAgain.locale)),
    );
  }
}

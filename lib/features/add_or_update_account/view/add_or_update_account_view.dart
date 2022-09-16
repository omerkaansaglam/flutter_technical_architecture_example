import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neyasischallenge/core/extension/context_extension.dart';
import 'package:neyasischallenge/core/init/lang/locale_keys.g.dart';
import 'package:neyasischallenge/features/add_or_update_account/cubit/add_or_update_account_cubit.dart';
import 'package:neyasischallenge/features/add_or_update_account/model/account_response_model.dart';
import 'package:neyasischallenge/features/add_or_update_account/service/add_or_update_account_service.dart';
import 'package:neyasischallenge/products/extensions/date_parser_extension.dart';
import 'package:neyasischallenge/products/widgets/input/custom_input.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddOrUpdateAccountView extends StatefulWidget {
  final AccountResponseModel? model;
  const AddOrUpdateAccountView({Key? key, required this.model}) : super(key: key);

  @override
  State<AddOrUpdateAccountView> createState() => _AddOrUpdateAccountViewState();
}

class _AddOrUpdateAccountViewState extends State<AddOrUpdateAccountView> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;

  late final TextEditingController surnameController;

  late final TextEditingController birtDateController;

  late final TextEditingController sallaryController;

  late final TextEditingController phoneNumberController;

  late final TextEditingController identityController;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.model?.name ?? "");
    surnameController = TextEditingController(text: widget.model?.surname ?? "");
    birtDateController = TextEditingController(text: widget.model?.birthDate.dateToStringParser() ?? "");
    sallaryController = TextEditingController(text: widget.model?.sallary.toString() ?? "");
    phoneNumberController = TextEditingController(text: widget.model?.phoneNumber ?? "");
    identityController = TextEditingController(text: widget.model?.identity.toString() ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddOrUpdateAccountCubit>(
      create: (context) => AddOrUpdateAccountCubit(AddOrUpdateAccountService()),
      child: Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.createAccount.locale),
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              children: [
                CustomTextFormField(
                    controller: identityController,
                    onSaved: (newValue) => {identityController.text = newValue ?? ""},
                    title: LocaleKeys.identity.locale,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: LocaleKeys.validateRequired.locale),
                      FormBuilderValidators.numeric(errorText: LocaleKeys.validateNumeric.locale),
                      FormBuilderValidators.minLength(11, errorText: LocaleKeys.validateMinLength.locale),
                      FormBuilderValidators.maxLength(11, errorText: LocaleKeys.validateMaxLength.locale),
                    ])),
                CustomTextFormField(
                  controller: nameController,
                  onSaved: (newValue) => {nameController.text = newValue ?? ""},
                  title: LocaleKeys.name.locale,
                  validator: FormBuilderValidators.required(errorText: LocaleKeys.validateRequired.locale),
                ),
                TextFormField(
                  controller: surnameController,
                  onSaved: (newValue) => surnameController.text = newValue ?? "",
                  decoration: InputDecoration(label: Text(LocaleKeys.surname.locale)),
                  validator: FormBuilderValidators.required(errorText: LocaleKeys.validateRequired.locale),
                ),
                InkWell(
                  onTap: () async {
                    await showDatePicker(
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                            context: context,
                            initialDate: DateTime(2000),
                            firstDate: DateTime(1881),
                            lastDate: DateTime(2101))
                        .then((pickedDate) => birtDateController.text =
                            pickedDate != null ? pickedDate.dateToStringParser() : "");
                  },
                  child: CustomTextFormField(
                    inputEnabled: true,
                    title: LocaleKeys.birthDate.locale,
                    controller: birtDateController,
                    onSaved: (newValue) => birtDateController.text = newValue ?? "",
                  ),
                ),
                TextFormField(
                  controller: sallaryController,
                  onSaved: (newValue) => sallaryController.text = newValue ?? "",
                  decoration: InputDecoration(label: Text(LocaleKeys.sallary.locale)),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: LocaleKeys.validateRequired.locale),
                    FormBuilderValidators.numeric(errorText: LocaleKeys.validateNumeric.locale),
                  ]),
                ),
                TextFormField(
                  controller: phoneNumberController,
                  onSaved: (newValue) => phoneNumberController.text = newValue ?? "",
                  decoration: InputDecoration(label: Text(LocaleKeys.phone.locale)),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: LocaleKeys.validateRequired.locale),
                  ]),
                ),
                BlocConsumer<AddOrUpdateAccountCubit, AddOrUpdateAccountState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      success: (result) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
                      },
                      error: (errorException) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorException)));
                      },
                      orElse: () {},
                    );
                  },
                  builder: (context, state) {
                    return _saveFormAndCreateAccount(context);
                  },
                )
              ],
            ),
          )),
    );
  }

  ElevatedButton _saveFormAndCreateAccount(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (_formKey.currentState != null && _formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            context.read<AddOrUpdateAccountCubit>().addOrUpdateAccount(
                model: AccountResponseModel(
                    id: widget.model?.id,
                    name: nameController.text,
                    surname: surnameController.text,
                    birthDate: birtDateController.text.stringToDateParser(),
                    sallary: double.parse(sallaryController.text),
                    phoneNumber: phoneNumberController.text,
                    identity: int.parse(identityController.text)));
          }
        },
        child: Text(LocaleKeys.create.locale));
  }
}

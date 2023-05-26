import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchack/screens/search/search_viewmodel.dart';

class SearchDetailed extends StatefulWidget {
  const SearchDetailed({Key? key}) : super(key: key);

  @override
  State<SearchDetailed> createState() => _SearchDetailedState();
}

class _SearchDetailedState extends State<SearchDetailed> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController sponsorController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController prizeFundController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      context
          .read<SearchViewModel>()
          .changeStartDate(picked.millisecondsSinceEpoch);
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      context
          .read<SearchViewModel>()
          .changeEndDate(picked.millisecondsSinceEpoch);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Строгий поиск'),
                Switch(
                  value: context.watch<SearchViewModel>().isStrict,
                  onChanged: (value) {
                    context.read<SearchViewModel>().changeIsStrict(value);
                  },
                ),
              ],
            ),
            Row(
              children: [
                const Text('Заголовок'),
                const SizedBox(width: 20),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextFormField(
                    controller: titleController,
                  ),
                )
              ],
            ),
            Row(
              children: [
                const Text('Имя спонсора'),
                const SizedBox(width: 20),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextFormField(
                    controller: sponsorController,
                  ),
                )
              ],
            ),
            Row(
              children: [
                const Text('Компания организатор'),
                const SizedBox(width: 20),
                SizedBox(
                  width: 180,
                  height: 50,
                  child: TextFormField(
                    controller: companyController,
                  ),
                )
              ],
            ),
            Row(
              children: [
                const Text('Описание'),
                const SizedBox(width: 20),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextFormField(
                    controller: descriptionController,
                  ),
                )
              ],
            ),
            Row(
              children: [
                const Text('Адрес'),
                const SizedBox(width: 20),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextFormField(
                    controller: addressController,
                  ),
                )
              ],
            ),
            Row(
              children: [
                const Text('Призовой фонд'),
                const SizedBox(width: 20),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextFormField(
                    controller: prizeFundController,
                    keyboardType: TextInputType.number,
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Text(context.watch<SearchViewModel>().startDate != 0
                    ? "Стартовая дата: ${DateTime.fromMillisecondsSinceEpoch(context.read<SearchViewModel>().startDate).day}.${DateTime.fromMillisecondsSinceEpoch(context.read<SearchViewModel>().startDate).month}.${DateTime.fromMillisecondsSinceEpoch(context.read<SearchViewModel>().startDate).year}"
                    : 'Стартовая дата: '),
                const SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () => _selectStartDate(context),
                  child: const Text('Выбрать дату'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(context.watch<SearchViewModel>().endDate != 0
                    ? "Конечная дата: ${DateTime.fromMillisecondsSinceEpoch(context.read<SearchViewModel>().endDate).day}.${DateTime.fromMillisecondsSinceEpoch(context.read<SearchViewModel>().endDate).month}.${DateTime.fromMillisecondsSinceEpoch(context.read<SearchViewModel>().endDate).year}"
                    : 'Конечная дата: '),
                const SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () => _selectEndDate(context),
                  child: const Text('Выбрать дату'),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  context
                      .read<SearchViewModel>()
                      .changeTitle(titleController.text);
                }
                if (sponsorController.text.isNotEmpty) {
                  context
                      .read<SearchViewModel>()
                      .changeSponsorName(sponsorController.text);
                }
                if (companyController.text.isNotEmpty) {
                  context
                      .read<SearchViewModel>()
                      .changeCompanyOrganizer(companyController.text);
                }
                if (descriptionController.text.isNotEmpty) {
                  context
                      .read<SearchViewModel>()
                      .changeDescription(descriptionController.text);
                }
                if (addressController.text.isNotEmpty) {
                  context
                      .read<SearchViewModel>()
                      .changeAddress(addressController.text);
                }
                if (prizeFundController.text.isNotEmpty) {
                  context.read<SearchViewModel>().changePrizeFundAmount(
                      int.parse(prizeFundController.text));
                }
                Navigator.pop(context);
              },
              child: const Text('Поиск'),
            ),
            TextButton(
              onPressed: () {
                context.read<SearchViewModel>().clear();
                Navigator.pop(context);
              },
              child: const Text('Сбросить'),
            ),
          ],
        ),
      ),
    );
  }
}

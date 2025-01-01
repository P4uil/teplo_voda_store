import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teplo_voda_store/components/tabbar/bloc/tabbar_bloc.dart';
import 'package:teplo_voda_store/pages/catalog/bloc/catalog_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreView extends StatefulWidget {
  const StoreView({super.key});

  @override
  _StoreViewState createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  final List<Map<String, String>> sections = [
    {'title': 'Канализация', 'icon': 'assets/icons/sewage.png'},
    {'title': 'Задвижки', 'icon': 'assets/icons/valves.png'},
    {'title': 'Краны', 'icon': 'assets/icons/taps.png'},
    {'title': 'Полипропилен', 'icon': 'assets/icons/polypropylene.png'},
    {'title': 'Полиэтилен', 'icon': 'assets/icons/polyethylene.png'},
    {'title': 'Теплый пол', 'icon': 'assets/icons/heated_floor.png'},
    {'title': 'Хомуты', 'icon': 'assets/icons/clamps.png'},
    {'title': 'Крепления', 'icon': 'assets/icons/fasteners.png'},
    {'title': 'Пол - сушители', 'icon': 'assets/icons/towel_racks.png'},
    {'title': 'Трубы', 'icon': 'assets/icons/pipes.png'},
    {'title': 'Утеплитель', 'icon': 'assets/icons/insulation.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/LogoTeploVoda.png',
              height: 40,
            ),
            InkWell(
              onTap: () {
                launchPhoneDialer('+77054109814');
              },
              child: const Row(
                children: [
                  Text(
                    '+7 705 410 9814',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                context
                    .read<TabBarBloc>()
                    .add(SwitchTabEvent(2)); // Открыть вкладку "Поиск"
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 8),
                    Text('Поиск', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              onTap: () {
                // Открыть выезжающее окно
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Сделайте заказ по телефону',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Оформите доставку или самовывоз из магазина',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 16),
                          // Кнопка растянутая на всю ширину
                          ElevatedButton(
                            onPressed: () {
                              launchPhoneDialer('+77054109814');
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 48),
                            ),
                            child: const Text('Связаться с менеджером'),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: const Text(
                    'Оформить заказ по телефону',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center, // Текст выровнен по центру
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemCount: sections.length,
              itemBuilder: (context, index) {
                final section = sections[index];
                return InkWell(
                  onTap: () {
                    context
                        .read<CatalogBloc>()
                        .add(SelectCatalogSectionEvent(section['title']!));
                    context
                        .read<TabBarBloc>()
                        .add(SwitchTabEvent(1)); // Переключиться на "Каталог"
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200],
                            image: DecorationImage(
                              image: AssetImage(section['icon']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(section['title']!, textAlign: TextAlign.center),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void launchPhoneDialer(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunch(phoneUri.toString())) {
      await launch(phoneUri.toString());
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
}

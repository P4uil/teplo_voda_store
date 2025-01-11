import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teplo_voda_store/components/tabbar/bloc/tabbar_bloc.dart';
import 'package:teplo_voda_store/pages/catalog/bloc/catalog_bloc.dart';
import 'package:teplo_voda_store/pages/search/search_view.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreView extends StatefulWidget {
  const StoreView({super.key});

  @override
  _StoreViewState createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  final List<Map<String, String>> sections = [
    {'title': 'Канализация', 'icon': 'assets/icons/na.png'},
    {'title': 'Задвижки', 'icon': 'assets/icons/na.png'},
    // Добавьте остальные разделы...
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
                _launchPhoneDialer('+77054109814');
              },
              child: const Row(
                children: [
                  Text(
                    '+7 705 410 98 14',
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
                context.read<TabBarBloc>().add(SwitchTabEvent(2));
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
                    Text(
                      'Поиск',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Плашка "Заказать по телефону"
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
                          ElevatedButton(
                            onPressed: () {
                              _launchPhoneDialer('+77054109814');
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Заказать по телефону',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Сетка разделов
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
                    final title = section['title'];
                    context.read<TabBarBloc>().add(SwitchTabEvent(1));
                    context
                        .read<CatalogBloc>()
                        .add(SelectCatalogSectionEvent(title!));
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

  void _launchPhoneDialer(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        print('Не удалось открыть $phoneUri');
      }
    } catch (e) {
      print('Ошибка при попытке открыть $phoneUri: $e');
    }
  }
}

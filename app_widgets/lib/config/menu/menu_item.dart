import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItem = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Generales y controlador',
    link: '/progress',
    icon: Icons.refresh_sharp,
  ),
  MenuItem(
    title: 'Snackbars & dialogs',
    subTitle: 'Indicadores en pantalla',
    link: '/snackbar',
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: 'UI controls + Tiles',
    subTitle: 'Una serie de controles de FLutters',
    link: '/iu-controls',
    icon: Icons.car_crash_outlined,
  ),
  MenuItem(
    title: 'Animated container',
    subTitle: 'Statefull widget animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank_rounded,
  ),
  MenuItem(
    title: 'Introducción a la aplicación',
    subTitle: 'Tutorial introductorio',
    link: '/tutorial',
    icon: Icons.favorite_border,
  ),
];

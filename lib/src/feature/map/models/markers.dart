import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:park_app/src/feature/map/Services/popup_marker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MapMarkers {
  MarkerLayerOptions setMarkers() {
    return MarkerLayerOptions(
      markers: [
        Marker(
          point: LatLng(37.769520, -25.336879),
          rotate: true,
          builder: (context) => PopupMarker(
              titleText: AppLocalizations.of(context)!.markerTitle3,
              image: 'assets/images/backgroundMain.jpg',
              bodyText: AppLocalizations.of(context)!.markerBody3,
              heroMark: '3'),
        ),
        Marker(
          point: LatLng(37.769495, -25.337934),
          rotate: true,
          builder: (context) => PopupMarker(
              titleText: AppLocalizations.of(context)!.markerTitle1,
              image: 'assets/images/marker1.jpg',
              bodyText: AppLocalizations.of(context)!.markerBody1,
              heroMark: '1'),
        ),
        Marker(
          point: LatLng(37.770000, -25.336750),
          rotate: true,
          builder: (context) => PopupMarker(
              titleText: AppLocalizations.of(context)!.markerTitle2,
              image: 'assets/images/marker2.jpg',
              bodyText: AppLocalizations.of(context)!.markerBody2,
              heroMark: '2'),
        ),
        Marker(
          point: LatLng(37.769520, -25.336879),
          rotate: true,
          builder: (context) => PopupMarker(
              titleText: AppLocalizations.of(context)!.markerTitle3,
              image: 'assets/images/backgroundMain.jpg',
              bodyText: AppLocalizations.of(context)!.markerBody3,
              heroMark: '3'),
        ),
        Marker(
          point: LatLng(37.769399, -25.335963),
          rotate: true,
          builder: (context) => PopupMarker(
              titleText: AppLocalizations.of(context)!.markerTitle4,
              image: 'assets/images/marker4.jpg',
              bodyText: AppLocalizations.of(context)!.markerBody4,
              heroMark: '4'),
        ),
        Marker(
          point: LatLng(37.769832, -25.335416),
          rotate: true,
          builder: (context) => PopupMarker(
              titleText: AppLocalizations.of(context)!.markerTitle5,
              image: 'assets/images/marker5.jpg',
              bodyText: AppLocalizations.of(context)!.markerBody5,
              heroMark: '5'),
        ),
        Marker(
          point: LatLng(37.769272, -25.335319),
          rotate: true,
          builder: (context) => PopupMarker(
              titleText: AppLocalizations.of(context)!.markerTitle6,
              image: 'assets/images/marker6.jpg',
              bodyText: AppLocalizations.of(context)!.markerBody6,
              heroMark: '6'),
        ),
        Marker(
          point: LatLng(37.768071, -25.334812),
          rotate: true,
          builder: (context) => PopupMarker(
              titleText: AppLocalizations.of(context)!.markerTitle7,
              image: 'assets/images/marker7.jpg',
              bodyText: AppLocalizations.of(context)!.markerBody7,
              heroMark: '7'),
        ),
        Marker(
          point: LatLng(37.766326, -25.335566),
          rotate: true,
          builder: (context) => PopupMarker(
              titleText: AppLocalizations.of(context)!.markerTitle8,
              image: 'assets/images/marker8.jpg',
              bodyText: AppLocalizations.of(context)!.markerBody8,
              heroMark: '8'),
        ),
        Marker(
          point: LatLng(37.766635, -25.335263),
          rotate: true,
          builder: (context) => PopupMarker(
              titleText: AppLocalizations.of(context)!.markerTitle9,
              image: 'assets/images/marker9.jpg',
              bodyText: AppLocalizations.of(context)!.markerBody9,
              heroMark: '9'),
        ),
        Marker(
          point: LatLng(37.765392, -25.333311),
          rotate: true,
          builder: (context) => PopupMarker(
              titleText: AppLocalizations.of(context)!.markerTitle10,
              image: 'assets/images/marker10.jpg',
              bodyText: AppLocalizations.of(context)!.markerBody10,
              heroMark: '10'),
        ),
        Marker(
          point: LatLng(37.766094, -25.333657),
          rotate: true,
          builder: (context) => PopupMarker(
              titleText: AppLocalizations.of(context)!.markerTitle11,
              image: 'assets/images/marker11.jpg',
              bodyText: AppLocalizations.of(context)!.markerBody11,
              heroMark: '11'),
        ),
        Marker(
          point: LatLng(37.767961, -25.334361),
          rotate: true,
          builder: (context) => PopupMarker(
              titleText: AppLocalizations.of(context)!.markerTitle12,
              image: 'assets/images/marker12.jpg',
              bodyText: AppLocalizations.of(context)!.markerBody12,
              heroMark: '12'),
        ),
        Marker(
          point: LatLng(37.767870, -25.333355),
          rotate: true,
          builder: (context) => PopupMarker(
              titleText: AppLocalizations.of(context)!.markerTitle13,
              image: 'assets/images/marker13.jpg',
              bodyText: AppLocalizations.of(context)!.markerBody13,
              heroMark: '13'),
        ),
      ],
    );
  }
}

import 'package:flutter/foundation.dart';

const baseUrl = kReleaseMode ? "https://mavlabs.hopto.org/" : "http://localhost:4444/" ;

const pageNames = {
  'home' : 'Головна',
  'panels' : 'Мої панелі',
};

const monthNames = {
  '01' : 'Січня',
  '02' : 'Лютого',
  '03' : 'Березня',
  '04' : 'Квітня',
  '05' : 'Травня',
  '06' : 'Червня',
  '07' : 'Липня',
  '08' : 'Серпня',
  '09' : 'Вересня',
  '10' : 'Жовтня',
  '11' : 'Листопада',
  '12' : 'Грудня',
};

const smallLimit = 600;
const mediumLimit = 900;
const largeLimit = 1200;
import 'package:flutter/foundation.dart';

const baseUrl = kReleaseMode ? "https://mavlabs.hopto.org/" : "http://localhost:4444/" ;

const pageNames = {
  'home' : 'Главная',
  'cart' : 'Корзина',
};

const monthNames = {
  '01' : 'Января',
  '02' : 'Февраля',
  '03' : 'Марта',
  '04' : 'Апреля',
  '05' : 'Мая',
  '06' : 'Июня',
  '07' : 'Июля',
  '08' : 'Августа',
  '09' : 'Сентября',
  '10' : 'Октября',
  '11' : 'Ноября',
  '12' : 'Декабря',
};

const smallLimit = 600;
const mediumLimit = 900;
const largeLimit = 1200;
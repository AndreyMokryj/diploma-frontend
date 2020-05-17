import 'package:flutter/material.dart';

//const baseUrl = kReleaseMode ? "https://mavlabs.hopto.org/" : "http://localhost:4444/" ;
const baseUrl = "http://localhost:4444/app/" ;

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

const times = [
  '00',
  '01',
  '02',
  '03',
  '04',
  '05',
  '06',
  '07',
  '08',
  '09',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20',
  '21',
  '22',
  '23',
];

const smallLimit = 600;
const mediumLimit = 900;
const largeLimit = 1200;

const legendItems = [
  {
    'title':'Вироблено',
    'color': Colors.green,
  },
  {
    'title':'Продано',
    'color': Colors.orange,
  },

];
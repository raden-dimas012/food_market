import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_market/models/models.dart';
import 'package:http/http.dart' as http;

part 'user_service.dart';
part 'food_service.dart';
part 'transaction_service.dart';

String baseURL = 'http://127.0.0.1:8000/api';
// String baseURL = 'http://foodmarket-backend.buildwithangga.id/api';
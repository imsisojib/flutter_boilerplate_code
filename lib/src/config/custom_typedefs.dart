import 'package:flutter/material.dart';

typedef OnEditComplete = Function();
typedef OnSaved = Function(String?);
typedef OnChanged = Function(String?);
typedef OnFieldSubmitted = Function(String);
typedef OnTapOutside = Function(PointerDownEvent?);
typedef OnValidator = String? Function(String?);
typedef OnDropDownValidator<T> = String? Function(T?);
typedef OnSelectDateAndTime = Function({
  required DateTime dateTime,
});
typedef OnSelectDateRange = Function({
  required DateTime fromDateTime,
  required DateTime toDateTime,
});
typedef OnSelectVehicle = Function(String? vehicleId);
typedef OnTap = Function();

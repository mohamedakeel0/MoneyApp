import 'dart:io';

import 'package:flutter/material.dart';

enum Services { New, Old ,Initial}
enum Toaststates { SUCCESS, ERROR, WARNING }
 enum BillTypes {
  SELLING_BILL,RETURN_BILL
}
enum RequestState{
 loading,
 loaded,
 error,
}
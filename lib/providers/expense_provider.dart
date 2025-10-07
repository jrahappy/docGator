import 'package:flutter/foundation.dart';
import '../models/expense_model.dart';
import '../services/expense_service.dart';

class ExpenseProvider with ChangeNotifier {
  final ExpenseService _expenseService;
  
  List<ExpenseList> _expenseLists = [];
  List<ExpenseItem> _currentExpenseItems = [];
  ExpenseList? _selectedList;
  ExpenseItem? _selectedItem;
  
  ExpenseProvider({required ExpenseService expenseService}) 
    : _expenseService = expenseService;
  
  List<ExpenseList> get expenseLists => _expenseLists;
  List<ExpenseItem> get currentExpenseItems => _currentExpenseItems;
  ExpenseList? get selectedList => _selectedList;
  ExpenseItem? get selectedItem => _selectedItem;
  
  Future<void> loadExpenseLists() async {
    _expenseLists = await _expenseService.getExpenseLists();
    notifyListeners();
  }
  
  Future<void> selectExpenseList(ExpenseList list) async {
    _selectedList = list;
    _currentExpenseItems = await _expenseService.getExpenseItems(list.id);
    notifyListeners();
  }
  
  void selectExpenseItem(ExpenseItem item) {
    _selectedItem = item;
    notifyListeners();
  }
  
  Future<bool> addAttachmentToExpense(String expenseId, String imagePath) async {
    final success = await _expenseService.addAttachment(expenseId, imagePath);
    if (success && _selectedList != null) {
      // Reload expense items to reflect the change
      _currentExpenseItems = await _expenseService.getExpenseItems(_selectedList!.id);
      notifyListeners();
    }
    return success;
  }
  
  void clearSelection() {
    _selectedList = null;
    _selectedItem = null;
    _currentExpenseItems = [];
    notifyListeners();
  }
}
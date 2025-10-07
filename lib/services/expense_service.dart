import 'package:dio/dio.dart';
import '../models/expense_model.dart';
import 'auth_service.dart';

class ExpenseService {
  final Dio _dio = Dio();
  final AuthService _authService;
  
  ExpenseService({required AuthService authService}) : _authService = authService {
    _dio.options.baseUrl = 'https://your-api-endpoint.com'; // TODO: Replace with actual API URL
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (_authService.token != null) {
          options.headers['Authorization'] = 'Bearer ${_authService.token}';
        }
        handler.next(options);
      },
    ));
  }
  
  Future<List<ExpenseList>> getExpenseLists() async {
    try {
      final response = await _dio.get('/expense-lists');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((json) => ExpenseList.fromJson(json))
            .toList();
      }
      return [];
    } catch (e) {
      // Return mock data for development
      return [
        ExpenseList(
          id: '1',
          name: 'Business Expenses 2024',
          description: 'All business related expenses for tax purposes',
          createdAt: DateTime.now().subtract(const Duration(days: 30)),
          itemCount: 15,
        ),
        ExpenseList(
          id: '2',
          name: 'Personal Expenses',
          description: 'Personal monthly expenses',
          createdAt: DateTime.now().subtract(const Duration(days: 60)),
          itemCount: 8,
        ),
        ExpenseList(
          id: '3',
          name: 'Travel Expenses Q4',
          description: 'Travel and accommodation expenses',
          createdAt: DateTime.now().subtract(const Duration(days: 15)),
          itemCount: 5,
        ),
      ];
    }
  }
  
  Future<List<ExpenseItem>> getExpenseItems(String listId) async {
    try {
      final response = await _dio.get('/expense-lists/$listId/items');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((json) => ExpenseItem.fromJson(json))
            .toList();
      }
      return [];
    } catch (e) {
      // Return mock data for development
      return [
        ExpenseItem(
          id: '1',
          listId: listId,
          title: 'Office Supplies',
          amount: 250.00,
          date: DateTime.now().subtract(const Duration(days: 5)),
          category: 'Office',
          notes: 'Printer paper and ink',
          attachments: [],
        ),
        ExpenseItem(
          id: '2',
          listId: listId,
          title: 'Client Lunch',
          amount: 85.50,
          date: DateTime.now().subtract(const Duration(days: 3)),
          category: 'Meals',
          notes: 'Business lunch with client',
          attachments: ['receipt1.jpg'],
        ),
        ExpenseItem(
          id: '3',
          listId: listId,
          title: 'Software Subscription',
          amount: 49.99,
          date: DateTime.now().subtract(const Duration(days: 1)),
          category: 'Software',
          notes: 'Monthly subscription',
          attachments: [],
        ),
        ExpenseItem(
          id: '4',
          listId: listId,
          title: 'Transportation',
          amount: 32.00,
          date: DateTime.now(),
          category: 'Travel',
          notes: 'Uber to meeting',
          attachments: [],
        ),
      ];
    }
  }
  
  Future<bool> addAttachment(String expenseId, String imagePath) async {
    try {
      // TODO: Implement actual API call
      // Adding attachment to expense $expenseId: $imagePath
      return true;
    } catch (e) {
      // Error adding attachment: $e
      return false;
    }
  }
}
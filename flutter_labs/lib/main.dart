import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    EnhypenProfile(),
    Calendar2025(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar 2025',
          ),
        ],
        backgroundColor: Colors.white,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class EnhypenProfile extends StatelessWidget {
  const EnhypenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue.shade100, Colors.purple.shade100],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Text(
              'ENHYPEN Profile',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade800,
                fontFamily: 'Arial',
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.purple,
                width: 3,
              ),
            ),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://via.placeholder.com/100',
              ),
            ),
          ),

          Container(
            width: 200,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(
                  'https://via.placeholder.com/200x120',
                ),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: Colors.blue.shade300,
                width: 2,
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.purple.shade200,
              ),
            ),
            child: Text(
              'K-pop Boy Group • 7 Members',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.purple.shade700,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade200, Colors.purple.shade200],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(16),
            child: Text(
              'Debut: November 30, 2020',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Calendar2025(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              'View ENHYPEN Calendar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Calendar2025 extends StatefulWidget {
  const Calendar2025({super.key});

  @override
  State<Calendar2025> createState() => _Calendar2025State();
}

class _Calendar2025State extends State<Calendar2025> {
  int _currentMonth = 0;
  final List<String> _months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];
  
  final List<String> _weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  
  DateTime? _selectedDate;
  final Map<DateTime, String> _enhypenEvents = {
    DateTime(2025, 2, 9): 'JUNGWON Day 🎂',
    DateTime(2025, 4, 20): 'JAY Day 🎂',
    DateTime(2025, 6, 24): 'SUNOO Day 🎂',
    DateTime(2025, 10, 9): 'ENGENE Day 🎂',
    DateTime(2025, 10, 15): 'HEESEUNG Day 🎂',
    DateTime(2025, 11, 15): 'JAKE Day 🎂',
    DateTime(2025, 11, 30): 'ENHYPEN Debut Anniversary (5 years) 🎂',
    DateTime(2025, 12, 8): 'SUNGHOON Day 🎂',
    DateTime(2025, 12, 9): 'NI-KI Day 🎂',
  };

  List<DateTime> _getMonthDays(int year, int month) {
    final firstDay = DateTime(year, month, 1);
    final lastDay = DateTime(year, month + 1, 0);
    
    // Найти понедельник первой недели
    int firstWeekday = firstDay.weekday;
    DateTime startDate = firstDay.subtract(Duration(days: firstWeekday - 1));
    
    List<DateTime> days = [];
    DateTime current = startDate;
    
    // Добавляем дни пока не достигнем следующего месяца
    while (current.isBefore(DateTime(year, month + 1, 1)) || 
           current.month == month || 
           days.length < 42) { // 6 недель
      days.add(current);
      current = current.add(Duration(days: 1));
      
      // Ограничиваем 42 днями (6 недель)
      if (days.length >= 42) break;
    }
    
    return days;
  }

  void _nextMonth() {
    setState(() {
      if (_currentMonth < 11) {
        _currentMonth++;
      }
    });
  }

  void _prevMonth() {
    setState(() {
      if (_currentMonth > 0) {
        _currentMonth--;
      }
    });
  }

  void _onDatePressed(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
    
    // Показать информацию о событии
    if (_enhypenEvents.containsKey(DateTime(2025, date.month, date.day))) {
      _showEventDialog(date);
    }
  }

  void _showEventDialog(DateTime date) {
    final event = _enhypenEvents[DateTime(2025, date.month, date.day)];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.purple.shade50,
        title: Text(
          '${date.day} ${_months[date.month - 1]} 2025',
          style: TextStyle(
            color: Colors.purple.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          event!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.purple.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Close',
              style: TextStyle(color: Colors.purple),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final year = 2025;
    final month = _currentMonth + 1;
    final monthDays = _getMonthDays(year, month);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ENHYPEN Calendar 2025',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade50, Colors.purple.shade50],
          ),
        ),
        child: Column(
          children: [
            // Заголовок месяца и навигация
            Card(
              margin: EdgeInsets.all(16),
              elevation: 4,
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.blue.shade700],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: _prevMonth,
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                    Text(
                      '${_months[_currentMonth]} $year',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: _nextMonth,
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),

            // Дни недели
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: _weekDays.map((day) => Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.purple.shade200)),
                    ),
                    child: Text(
                      day,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple.shade700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                )).toList(),
              ),
            ),

            // Календарь
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: monthDays.length,
                  itemBuilder: (context, index) {
                    final date = monthDays[index];
                    final isCurrentMonth = date.month == month;
                    final isToday = date.isAtSameMomentAs(DateTime.now());
                    final hasEvent = _enhypenEvents.containsKey(DateTime(2025, date.month, date.day));
                    final isSelected = _selectedDate != null && 
                        _selectedDate!.day == date.day && 
                        _selectedDate!.month == date.month;

                    return GestureDetector(
                      onTap: () => _onDatePressed(date),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected 
                              ? Colors.purple.shade300 
                              : isToday
                                  ? Colors.blue.shade200
                                  : isCurrentMonth
                                      ? Colors.white
                                      : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected 
                                ? Colors.purple 
                                : Colors.grey.shade300,
                            width: isSelected ? 2 : 1,
                          ),
                          boxShadow: isSelected 
                              ? [BoxShadow(
                                  color: Colors.purple.withOpacity(0.3),
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                )]
                              : null,
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    date.day.toString(),
                                    style: TextStyle(
                                      fontWeight: isCurrentMonth 
                                          ? FontWeight.w600 
                                          : FontWeight.normal,
                                      color: isCurrentMonth 
                                          ? Colors.purple.shade800 
                                          : Colors.grey.shade500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  if (hasEvent && isCurrentMonth)
                                    Container(
                                      margin: EdgeInsets.only(top: 2),
                                      width: 6,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: Colors.red.shade400,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            if (!isCurrentMonth)
                              Positioned(
                                top: 2,
                                right: 2,
                                child: Text(
                                  date.month == month - 1 || (month == 1 && date.month == 12) 
                                      ? 'prev' 
                                      : 'next',
                                  style: TextStyle(
                                    fontSize: 6,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Информация о выбранной дате
            if (_selectedDate != null)
              Card(
                margin: EdgeInsets.all(16),
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple.shade50, Colors.blue.shade50],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selected Date: ${_selectedDate!.day} ${_months[_selectedDate!.month - 1]} 2025',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple.shade800,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      if (_enhypenEvents.containsKey(DateTime(2025, _selectedDate!.month, _selectedDate!.day)))
                        Text(
                          _enhypenEvents[DateTime(2025, _selectedDate!.month, _selectedDate!.day)]!,
                          style: TextStyle(
                            color: Colors.purple.shade700,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      else
                        Text(
                          'No ENHYPEN events on this day',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
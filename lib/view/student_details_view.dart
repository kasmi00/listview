import 'package:flutter/material.dart';
import 'package:listview_class/model/student.dart';

class StudentDetailsView extends StatefulWidget {
  const StudentDetailsView({super.key});

  @override
  State<StudentDetailsView> createState() => _StudentDetailsViewState();
}

class _StudentDetailsViewState extends State<StudentDetailsView> {
  // Gap for spacing between widgets
  final Widget _gap = const SizedBox(height: 8);

  // Dropdown menu items
  final List<DropdownMenuItem<String>> _items = [
    const DropdownMenuItem(value: 'Kathmandu', child: Text('Kathmandu')),
    const DropdownMenuItem(value: 'Pokhara', child: Text('Pokhara')),
    const DropdownMenuItem(value: 'Chitwan', child: Text('Chitwan')),
  ];

  // List to hold students' data
  final List<Student> _students = [];

  // Selected city for the dropdown
  String? _selectedCity;

  // Controllers for the input fields
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _gap,
            // First name input
            TextFormField(
              controller: _fnameController,
              decoration: const InputDecoration(
                labelText: 'Enter first name',
                border: OutlineInputBorder(),
              ),
            ),
            _gap,
            // Last name input
            TextFormField(
              controller: _lnameController,
              decoration: const InputDecoration(
                labelText: 'Enter last name',
                border: OutlineInputBorder(),
              ),
            ),
            _gap,
            // Dropdown for city selection
            DropdownButtonFormField<String>(
              value: _selectedCity,
              items: _items,
              onChanged: (value) {
                setState(() {
                  _selectedCity = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Select city',
                border: OutlineInputBorder(),
              ),
            ),
            _gap,
            // Button to add student
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedCity == null ||
                      _fnameController.text.trim().isEmpty ||
                      _lnameController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill all fields')),
                    );
                    return;
                  }

                  // Creating a student object
                  Student student = Student(
                    fname: _fnameController.text.trim(),
                    lname: _lnameController.text.trim(),
                    city: _selectedCity!,
                  );

                  // Adding student to the list
                  setState(() {
                    _students.add(student);
                  });

                  // Clearing fields
                  _fnameController.clear();
                  _lnameController.clear();
                  _selectedCity = null;
                },
                child: const Text('Add Student'),
              ),
            ),
            _gap,
            // List of students
            _students.isEmpty
                ? const Text('No data')
                : Expanded(
                    child: ListView.builder(
                      itemCount: _students.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('${_students[index].fname} ${_students[index].lname}'),
                          subtitle: Text(_students[index].city),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                _students.removeAt(index);
                              });
                            },
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/personalView',
                              arguments: _students[index],
                            );
                          },
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FormSimple extends StatefulWidget {
  const FormSimple({super.key});

  @override
  State<FormSimple> createState() => _FormSimpleState();
}

class _FormSimpleState extends State<FormSimple> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); //ใช้จัดการฟอร์ม เพื่อให้สามารถตรวจสอบค่าภายในฟอร์มทั้งหมด
  String name = '';
  String email = ''; //ตัวแปร name, email ใช้เก็บค่าที่ผู้ใช้ป้อน
  bool _isChecked = false; //ใช้ตรวจสอบว่าผู้ใช้ยอมรับข้อตกลงหรือไม่
  bool _isSwitched = true;
  String? _selectedItem; //ใช้เก็บค่าจังหวัดที่เลือก
  String? _gender; //ใช้เก็บค่าที่ผู้ใช้เลือกเพศ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form (650710542)'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding here
        child: Form(
          //ใช้ครอบทุกอินพุตเพื่อให้สามารถตรวจสอบค่าภายในฟอร์มได้ง่ายขึ้น
          key: _formKey,
          child: Column(
            children: [
              // Full Name Field
              TextFormField(
                //ใช้ TextFormField เพื่อให้ผู้ใช้กรอกชื่อ
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  //validator ตรวจสอบว่าผู้ใช้ได้กรอกชื่อหรือไม่ ถ้าไม่กรอกจะมีข้อความแจ้ง "Please enter your name"
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onChanged: (value) {
                  ////onChanged อัปเดตค่า name ทันทีเมื่อมีการเปลี่ยนแปลง
                  setState(() {
                    name = value;
                  });
                },
              ),
              // Email Field
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  String emailPattern =
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                  RegExp regex = RegExp(
                      emailPattern); //เพื่อตรวจสอบรูปแบบอีเมล ถ้าไม่ถูกต้องจะแสดงข้อความ "Please enter a valid email"
                  if (!regex.hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    email = value; // Update email variable
                  });
                },
              ),
              SizedBox(height: 10),
              // Gender Selection
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Gender'),
                  Row(
                    children: [
                      Radio<String>(
                        //ใช้ Radio เพื่อให้ผู้ใช้เลือกเพศ ชาย (Male) หรือ หญิง (Female)
                        value: 'Male',
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender =
                                value; //เมื่อเลือกแล้ว ค่าจะถูกบันทึกไว้ใน _gender
                          });
                        },
                      ),
                      const Text('Male'),
                      const SizedBox(width: 100),
                      Radio<String>(
                        value: 'Female',
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                      const Text('Female'),
                    ],
                  ),
                ],
              ),
              // Province Dropdown
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Province'),
                value: _selectedItem,
                items: ['Bangkok', 'Chiang Mai', 'Phuket', 'Khon Kean']
                    .map((item) =>
                        DropdownMenuItem(value: item, child: Text(item)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedItem = value;
                  });
                },
                validator: (value) => //validator ตรวจสอบว่าผู้ใช้เลือกหรือไม่
                    value == null ? 'Please select an option' : null,
              ),
              // Terms & Conditions Checkbox
              CheckboxListTile(
                //CheckboxListTile ใช้ตรวจสอบว่าผู้ใช้ยอมรับข้อตกลงหรือไม่
                title: const Text('Accept Terms & Conditions'),
                value:
                    _isChecked, //เมื่อกดเลือก ค่า _isChecked จะเปลี่ยนเป็น true
                onChanged: (value) {
                  setState(() {
                    _isChecked = value!;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Enable Notifications'),
                value: _isSwitched,
                onChanged: (value) {
                  setState(() {
                    _isSwitched = value;
                  });
                },
              ),
              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    //ตรวจสอบค่าทั้งหมดในฟอร์มโดยใช้ _formKey.currentState?.validate()
                    // If the form is valid, print the name
                    print(name);
                    print(email);
                    print(_gender);
                    print(_selectedItem);
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_manger/models/expense.dart';

class NewExpense extends StatefulWidget{
  const NewExpense({super.key,required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }

}
class _NewExpenseState extends State<NewExpense>{
 final _titleController =  TextEditingController();
 final _amoutnController= TextEditingController();
 DateTime? _selectedDate;
 Catagory _selectedCatagory=Catagory.leisure;
 void _presentDatepicker() async {
   final now=DateTime.now();

  final pickDate = await showDatePicker(
       context: context,
       initialDate: now,
       firstDate: DateTime(now.year-1,now.month,now.day),
       lastDate: DateTime(now.year+1,now.month,now.day),
   );
  setState(() {
    _selectedDate =pickDate;
  });

 }
 void _submitExpenseData(){
   final enteredAmount =double.tryParse(_amoutnController.text);
   final amountIsInValid=enteredAmount==null || enteredAmount<=0;
   if(_titleController.text.trim().isEmpty || amountIsInValid || _selectedDate==null){
        showDialog(context: context, builder: (ctx)=>AlertDialog(
          title: const Text('Invaid input'),
          content: const Text('Please Enter the valid data'),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(ctx);
            }, child:const Text('Okay')),
          ],
        ),);
        return;
   }
 widget.onAddExpense(Expense(
   tittle: _titleController.text,
   amount: enteredAmount,
   date: _selectedDate!,
   category: _selectedCatagory,
 )
 );
   Navigator.pop(context);
 }
 @override
  void dispose() {
    _titleController.dispose();
    _amoutnController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,48,16,16),
      child : Column(
     children:  [
       TextField(
         controller: _titleController,
         maxLength: 50,
         decoration: const InputDecoration(
           label: Text('Title'),
         ),
    ),
       const SizedBox(height: 16),
       Row(
         children: [
           DropdownButton(
             value: _selectedCatagory,
               items: Catagory.values
                   .map((catagory) => DropdownMenuItem(
                 value: catagory,
                 child: Text(catagory.name.toUpperCase(),
               ),
               ),
               )
               .toList(),
               onChanged: (value){
                 if(value==null)return;
                setState(() {
                  _selectedCatagory=value;
                });
           },
           ),
           const Spacer(),
           Expanded(
            child: TextField(
               controller: _amoutnController,
               keyboardType: TextInputType.number,
               decoration: const InputDecoration(
                 prefixText: '৳ ',
                 label: Text('Amount'),
               ),
             ),
           ),
           const SizedBox(width: 16),
           Expanded(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                    Text(_selectedDate==null? 'No Selected date': formatter.format(_selectedDate!)),
                   IconButton(
                       onPressed: _presentDatepicker,
                     icon:const Icon(
                     Icons.calendar_month,
                   )
                   )
                   
                 ],
               ),
           ),
         ],
       ),

       Row(children: [
         TextButton(onPressed:(){
           Navigator.pop(context);
         }, 
             child:const Text('Cancel'),
         ),
    ElevatedButton(
    onPressed: _submitExpenseData,
    child: const Text('Save Expense'),
       ),
    ],
       ),
    ],
    ),
    );
  }
}
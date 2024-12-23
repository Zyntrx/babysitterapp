import 'package:babysitterapp/pages/payment/payment_page.dart';
import 'package:flutter/material.dart';
import '../../components/button.dart';
import '../../components/textfield.dart';
import 'availability.dart';
import 'time_selector.dart';

class BookingRequestPage extends StatefulWidget {
  final String babysitterImage;
  final String babysitterName;
  final double babysitterRate;

  const BookingRequestPage({
    super.key,
    required this.babysitterImage,
    required this.babysitterName,
    required this.babysitterRate,
  });

  @override
  _BookingRequestPageState createState() => _BookingRequestPageState();
}

class _BookingRequestPageState extends State<BookingRequestPage> {
  final TextEditingController _specialRequirementsController =
      TextEditingController();
  final Map<String, bool> _selectedDays = {
    'Monday': true,
    'Tuesday': true,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
  };

  final String _paymentMode = '';

  late double hourlyRate;
  double _durationHours = 1.0;

  @override
  void initState() {
    super.initState();
    hourlyRate = widget.babysitterRate.toDouble();
  }

  void _submitBooking() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => PaymentPage(
          babysitterImage: widget.babysitterImage,
          babysitterName: widget.babysitterName,
          babysitterRate: widget.babysitterRate,
          specialRequirements: _specialRequirementsController.text,
          duration: _durationHours.toString(),
          paymentMode: _paymentMode,
          totalpayment: (hourlyRate * _durationHours).toStringAsFixed(2),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }

  void _onDurationChanged(double duration) {
    setState(() {
      _durationHours = duration; // Update the selected duration in hours
    });
  }

  @override
  Widget build(BuildContext context) {
    // box decoration style
    var boxDecoration = BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Booking'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.babysitterImage),
                  radius: 50,
                ),
                const SizedBox(height: 16),
                Text(
                  widget.babysitterName,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(16.0),
              decoration: boxDecoration,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Babysitter Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 8),
                      Text('Location: Davao City'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.payment),
                      SizedBox(width: 8),
                      Text('Pay per Hour: Php 200'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.accessibility),
                      SizedBox(width: 8),
                      Text('Gender: Female'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(width: 8),
                      Text('Age: 28'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(16.0),
              decoration: boxDecoration,
              child: Column(
                children: [
                  AvailabilitySelector(selectedDays: _selectedDays),
                  const SizedBox(height: 16),
                  TimeSelector(
                    onDurationChanged:
                        _onDurationChanged, // Pass duration change callback
                  ),
                  const SizedBox(height: 16),
                  // Container(
                  //   padding: const EdgeInsets.all(16.0),
                  //   decoration: boxDecoration,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       const Text(
                  //         'Select Payment Mode',
                  //         style: TextStyle(
                  //             fontSize: 16, fontWeight: FontWeight.bold),
                  //       ),
                  //       const SizedBox(height: 16),
                  //       AppButton(
                  //         text: "Select Payment Mode",
                  //         onPressed: () {
                  //           Navigator.of(context).push(
                  //             MaterialPageRoute(
                  //               builder: (context) => const PaymentPage(),
                  //             ),
                  //           );
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(height: 16),
                  AppTextField(
                    controller: _specialRequirementsController,
                    hintText: 'Enter any special requirements',
                    suffix: null,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Offer: PHP ${widget.babysitterRate.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Total Amount: PHP ${(hourlyRate * _durationHours).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    text: 'Proceed to Payment',
                    onPressed: _submitBooking,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

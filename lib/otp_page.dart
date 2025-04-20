import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  final String id;
  const OtpPage({super.key, required this.id});
  

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  // Revert to single controller
  final TextEditingController _otpController = TextEditingController();
  bool isloading = false;
  // No need for initState for single controller unless initializing text

  @override
  void dispose() {
    _otpController.dispose(); // Dispose the single controller
    super.dispose();
  }

  // Revert to simpler submit logic
  void _submitOtp() {
    final otp = _otpController.text;
    final id = widget.id;

    // Basic validation
    if (otp.isEmpty || otp.length < 6) { // Example: Check if empty or less than 6 digits
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid 6-digit OTP.')),
      );
      return;
    }

    setState(() {
      isloading = true;
    });

    // Simulate submission delay
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isloading = false;
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          title: const Text('OTP Submitted', textAlign: TextAlign.center),
          content: Text('OTP: $otp\nOrder ID: $id', textAlign: TextAlign.center),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                _otpController.clear();
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    print('otp page opened'); // Corrected typo
    return Scaffold(
      // Improved AppBar
      appBar: AppBar(
        title: const Text('Enter OTP Verification'),
        centerTitle: true, // Center title
        elevation: 0, // Remove shadow for a flatter look
        backgroundColor: Colors.transparent, // Make AppBar transparent
        foregroundColor: Theme.of(context).textTheme.bodyLarge?.color, // Use text color for icons/title
      ),
      // Use SafeArea to avoid OS intrusions
      body: SafeArea(
        child: Center( // Center the content vertically and horizontally
          child: SingleChildScrollView( // Allow scrolling on smaller screens
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0), // Add more padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center column content
              crossAxisAlignment: CrossAxisAlignment.center, // Center items horizontally
              children: [
                // Styled Order ID
                Text(
                  'Order ID: ${widget.id}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey[700],
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30), // Increased spacing

                // Styled instruction text
                Text(
                  'Please enter the 6-digit OTP sent to your registered email address.',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30), // Increased spacing

                // Reverted and styled TextField
                TextField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  maxLength: 6, // Set max length for OTP
                  textAlign: TextAlign.center, // Center the text inside
                  style: const TextStyle(fontSize: 24, letterSpacing: 10), // Larger font, letter spacing
                  decoration: InputDecoration(
                    counterText: "", // Hide the counter
                    hintText: '------', // Hint text like dashes
                    hintStyle: TextStyle(fontSize: 24, letterSpacing: 10, color: Colors.grey.shade400),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0), // More rounded corners
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15), // Adjust padding
                  ),
                ),
                const SizedBox(height: 40), // Increased spacing

                // Styled Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50), // Make button wider
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0), // Match text field border radius
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600), // Bolder text
                  ),
                  onPressed: isloading ? null : _submitOtp,
                  child: isloading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 3, color: Colors.white),
                        )
                      : const Text('Verify OTP'), // Changed button text
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

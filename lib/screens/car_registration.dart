import 'package:bantu/aunthentication/login.dart';
import 'package:bantu/screens/child_pickup.dart';
import 'package:bantu/screens/upload_images.dart';
import 'package:flutter/material.dart';

class CarRegistration extends StatefulWidget {
  const CarRegistration({Key? key});


  @override
  _CarRegistrationState createState() => _CarRegistrationState();
}


class _CarRegistrationState extends State<CarRegistration> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();



  // Define lists for dropdown items
  List<String> vehicleModels =
  ['BMW', 'Ford', 'Honda', 'Hyundai', 'Isuzu', 'Land Rover', 'Mazda', 'Mercedes',
    'Mitsubishi', 'Nissan', 'Range Rover', 'Suzuki', 'Toyota', 'Volkswagen'];
  Map<String, List<String>> vehicleTypeMap =
  {
    // BMW
    'BMW': ['3 Series', 'Alpina', 'E3', 'M3', 'M4', 'X1', 'X3', 'X4', 'X5', 'X6', 'X7', 'i5', 'Not-listed'],
    // Ford
    'Ford': ['Everest', 'Explorer', 'Focus', 'Mustang', 'Ranger', 'Not-listed'],
    // Honda
    'Honda': ['Accord', 'Brio', 'CR-V', 'Civic', 'Fit', 'Freed', 'HR-V', 'N-Box', 'Stepwagon', 'Not-listed'],
    // Hyundai
    'Hyundai': ['Accent', 'Creta', 'Elantra', 'Getz', 'H1', 'Kona', 'Santa Fe', 'Sonata', 'Tucson', 'i10', 'Not-listed'],
    // Isuzu
    'Isuzu': ['D-Max', 'mu-X', 'Not-listed'],
    // Land Rover
    'Land Rover': ['Defender', 'Discovery', 'Sport', 'Not-Listed'],
    // Mazda
    'Mazda': ['Atenza', 'Bongo', 'CX', 'Demio', 'Familia', 'Flair Wagon', 'Mazda3', 'Mazda5', 'Mazda6', 'Premacy', 'Roadstar', 'Tribute', 'Verisa', 'Not-listed'],
    // Mercedes
    'Mercedes': ['A-class', 'C-class', 'E-class', 'GLE', 'S-class', 'Not-listed'], // More research needs to be done
    // Mitsubishi
    'Mitsubishi': ['Attrange', 'Delica', 'Dignity', 'Eclipse', 'Lancer', 'Lancer Cargo', 'Mirage', 'Outlander', 'Pajero', 'Triton', 'eK Wagon', 'Not-listed'],
    // Nissan
    'Nissan': ['Hardbody', 'Magnite', 'March', 'Navara', 'NV350 Urvan', 'Patrol', 'Terra', 'Tiida', 'X-Trail', 'Not-listed'],
  // Range Rover
  'Range Rover': ['Sport', 'Velar', 'Vogue Super Chargerd', 'Not-Listed'],
    // Suzuki
    'Suzuki': ['Alto', 'Alto Turbo', 'Escudo', 'Jimmy Sierra', 'Landy', 'Vitara', 'Not-Listed'],
  // Toyota series
  'Toyota': ['Allion', 'Alphard', 'Belta', 'Camry', 'Corolla', 'Hilux', 'Hiace', 'Land Cruiser', 'Mark X', 'Prado', 'Quest', 'RAV4', 'Vitz', 'Not-listed'], // to be updated

// Volkswagen
    'Volkswagen': ['Amarok', 'Arteon', 'Caddy', 'Cross Polo', 'Golf', 'Jetta', 'Passat', 'Polo', 'Tiguan', 'Transporter', 'Not-listed'],


    //more will be added in second iteration

  };
  Map<String, List<String>> vehicleTypeCategoryMap = {
    //toyota series
    'Corolla': ['4 Seater', '6 Seater'],
    'Camry': ['4 Seater', '6 Seater'],
    'Rav4': ['6 Seater', '12 Seater'],
    'Allion': ['4 Seater'],
    'Land Cruiser': ['4 Seater', '6 Seater'],
    'Vitz': ['4 Seater'],
    'Hilux': ['4 Seater'],
    'Hiace': ['6 Seater', '12 Seater'],
    'Mark X': ['4 Seater'],
    'Alphard': ['4 Seater'],
    'Belta': ['4 Seater'],
    'Prado': ['6 Seater'],
    'Quest': ['4 Seater','6 Seater'],
    //Honda series
    'Civic': ['4 Seater','6 Seater'],
    'Accord': ['4 Seater', '6 Seater'],
    'CR-V': ['6 Seater', '12 Seater'],
    'HR-V': ['4 Seater','6 Seater'],
    'Fit': ['4 Seater','6 Seater'],
    'Stepwagon': ['6 Seater', '12 Seater'],
    'Brio': ['4 Seater','6 Seater'],
    'Freed': ['4 Seater','6 Seater'],
    'N-Box': ['4 Seater','6 Seater'],
    //BMW series
    'X1': ['4 Seater', '6 Seater'],
    'X3': ['4 Seater', '6 Seater'],
    'X4': ['4 Seater', '6 Seater'],
    'X5': ['4 Seater', '6 Seater'],
    'X6': ['4 Seater', '6 Seater'],
    'X7': ['4 Seater', '6 Seater'],
    '3 Series': ['4 Seater', '6 Seater'],
    'M4': ['4 Seater', '6 Seater'],
    'i5': ['4 Seater', '6 Seater'],
    'Alpina': ['4 Seater', '6 Seater'],
    'E3': ['4 Seater', '6 Seater'],
    //Mercedes series
    'A-class': ['4 Seater', '6 Seater'],
    'C-class': ['4 Seater', '6 Seater'],
    'E-class': ['4 Seater', '6 Seater'],
    'S-class': ['4 Seater', '6 Seater'],
    'GLE': ['4 Seater', '6 Seater'],
    //Nissan series
    'March': ['4 Seater', '6 Seater'],
    'Navara': ['4 Seater', '6 Seater'],
    'Tiida': ['4 Seater', '6 Seater'],
    'Patrol': ['4 Seater', '6 Seater'],
    'Hardbody': ['4 Seater', '6 Seater'],
    'Magnite': ['4 Seater', '6 Seater'],
    'Terra': ['4 Seater', '6 Seater'],
    'X-Trail': ['4 Seater', '6 Seater'],
    'NV350 Urvan': ['4 Seater', '6 Seater'],
    //Mitsubishi series
    'Triton': ['4 Seater', '6 Seater'],
    'Lancer Cargo': ['4 Seater', '6 Seater'],
    'Attrange': ['4 Seater', '6 Seater'],
    'Dignity': ['4 Seater', '6 Seater'],
    'Eclipse': ['4 Seater', '6 Seater'],
    'Mirage': ['4 Seater', '6 Seater'],
    'Pajero': ['4 Seater', '6 Seater'],
    'Outlander': ['4 Seater', '6 Seater'],
    'Lancer': ['4 Seater', '6 Seater'],
    'Delica': ['4 Seater', '6 Seater'],
    'eK Wagon': ['4 Seater', '6 Seater'],
    //Mazda
    'Atenza': ['4 Seater', '6 Seater'],
    'Tribute': ['4 Seater', '6 Seater'],
    'Familia': ['4 Seater', '6 Seater'],
    'Premacy': ['4 Seater', '6 Seater'],
    'Demio': ['4 Seater', '6 Seater'],
    'Roadstar': ['4 Seater', '6 Seater'],
    'CX': ['4 Seater', '6 Seater'],
    'Mazda3': ['4 Seater', '6 Seater'],
    'Mazda5': ['4 Seater', '6 Seater'],
    'Mazda6': ['4 Seater', '6 Seater'],
    'Flair Wagon': ['4 Seater', '6 Seater'],
    'Verisa': ['4 Seater', '6 Seater'],
    'Bongo': ['4 Seater', '6 Seater'],
    //Volkswagen
    'Golf': ['4 Seater', '6 Seater'],
    'Passat': ['4 Seater', '6 Seater'],
    'Arteon': ['4 Seater', '6 Seater'],
    'Transporter': ['4 Seater', '6 Seater'],
    'Tiguan': ['4 Seater', '6 Seater'],
    'Polo': ['4 Seater', '6 Seater'],
    'Jetta': ['4 Seater', '6 Seater'],
    'Amarok': ['4 Seater', '6 Seater'],
    'Caddy': ['4 Seater', '6 Seater'],
    'Cross Polo': ['4 Seater', '6 Seater'],
    //Isuzu
    'D-Max': ['4 Seater', '6 Seater'],
    'mu-X': ['4 Seater', '6 Seater'],
    //Ford
    'Focus': ['4 Seater', '6 Seater'],
    'Ranger': ['4 Seater', '6 Seater'],
    'Explorer': ['4 Seater', '6 Seater'],
    'Everest': ['4 Seater', '6 Seater'],
    //Suzuki
    'Vitara': ['4 Seater', '6 Seater'],
    'Landy': ['4 Seater', '6 Seater'],
    'Escudo': ['4 Seater', '6 Seater'],
    'Jimmy Sierra': ['4 Seater', '6 Seater'],
    'Alto Turbo': ['4 Seater', '6 Seater'],
    'Alto': ['4 Seater', '6 Seater'],
    //Hyundai
    'Tucson': ['4 Seater', '6 Seater'],
    'Kona': ['4 Seater', '6 Seater'],
    'Santa Fe': ['4 Seater', '6 Seater'],
    'Elantra': ['4 Seater', '6 Seater'],
    'i10': ['4 Seater', '6 Seater'],
    'Sonata': ['4 Seater', '6 Seater'],
    'Accent': ['4 Seater', '6 Seater'],
    'Getz': ['4 Seater', '6 Seater'],
    'H1': ['4 Seater', '6 Seater'],
    'Creta': ['4 Seater', '6 Seater'],
    //Land Rover
    'Discovery': ['4 Seater', '6 Seater'],
    'Sport': ['4 Seater', '6 Seater'],
    'Defender': ['4 Seater', '6 Seater'],
    //Range Rover
    'Velar': ['4 Seater', '6 Seater'],
    'Vogue Super Chargerd': ['4 Seater', '6 Seater'],
    //Others
    'Not-Listed' : ['4 Seater', '6 Seater','12 Seater'],

  };

  List<String> colors = ['Red', 'Blue', 'Black', 'White','Gray',
    'Beige','Green', 'Brown','Silver'];
  List<String> categories = ['Budget', 'Premium', 'Luxury'];
  List<String> types = ['4 Seater', '6 Seater', '12 Seater'];
  List<String> extraServices = ['None', 'Child Pickup Services'];
  String? selectedVehicleModel;
  String? selectedVehicleType;
  String? selectedColor;
  String? selectedCategory;
  String? selectedType;
  String? selectedExtraService;



  void _handleSignUp() {
    // Handle sign-up logic
    String name = _nameController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;
    String address = _addressController.text;
    String password = _passwordController.text;
    String password1 = _passwordController1.text;

    // if (selectedExtraService == 'None') {
    //   // Navigate to page1
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => UploadImages()),
    //   );
    // } else if (selectedExtraService == 'Child Pickup Services') {
    //   // Navigate to page2
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => ChildPickup()),
    //   );
    // }
  }


  List<DropdownMenuItem<String>> _buildVehicleTypeDropdownItems() {
    List<DropdownMenuItem<String>> items = [];
    if (selectedVehicleModel != null && selectedVehicleType != null &&
        vehicleTypeCategoryMap.containsKey(selectedVehicleType)) {
      for (String type in vehicleTypeCategoryMap[selectedVehicleType]!) {
        items.add(DropdownMenuItem<String>(
          value: type,
          child: Text(type),
        ));
      }
    }
    return items;
  }

  List<DropdownMenuItem<String>> _buildVehicleCategoryDropdownItems() {
    List<DropdownMenuItem<String>> items = [];
    if (selectedVehicleModel != null && vehicleTypeMap.containsKey(selectedVehicleModel)) {
      for (String type in vehicleTypeMap[selectedVehicleModel]!) {
        items.add(DropdownMenuItem<String>(
          value: type,
          child: Text(type),
        ));
      }
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.teal[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text(
              'Car Details',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              height: 50,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Vehicle registration number',
                  hintText: 'Enter your Vehicle registration number',
                  icon: Container(child: Icon(Icons.numbers_outlined,color: Colors.teal)),
                  iconColor: Colors.teal,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: 350,
              height: 50,
              child: TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'License number',
                  hintText: 'Enter your license number',
                  icon: Icon(Icons.format_list_numbered_rtl_sharp,
                  color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: 350,
              height: 50,
              child: TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'License expiration date',
                  hintText: 'Enter your expiration date',
                  icon: Icon(Icons.timelapse_sharp,color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Dropdown for Vehicle Model
            Container(
              width: 350,
              height: 60,
              child: DropdownButtonFormField<String>(
                value: selectedVehicleModel,
                decoration: InputDecoration(
                  labelText: 'Vehicle Brand',
                  icon: Icon(Icons.directions_car,color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                items: vehicleModels.map((String model) {
                  return DropdownMenuItem<String>(
                    value: model,
                    child: Text(model),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedVehicleModel = value;
                    // Reset selected type when model changes
                    selectedVehicleType = null;
                    selectedType = null;
                  });
                },
              ),
            ),
            SizedBox(height: 16),
            // Dropdown for Vehicle Type
            Container(
              width: 350,
              height: 60,
              child: DropdownButtonFormField<String>(
                value: selectedVehicleType,
                decoration: InputDecoration(
                  labelText: 'Vehicle Model',
                  icon: Icon(Icons.directions_car_sharp,color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                items: _buildVehicleCategoryDropdownItems(),
                onChanged: (String? value) {
                  setState(() {
                    selectedVehicleType = value;
                    selectedType = null;
                  });
                },
              ),
            ),
            SizedBox(height: 16),
            // Dropdown for Vehicle Category
            Container(
              width: 350,
              height: 60,
              child: DropdownButtonFormField<String>(
                value: selectedType,
                decoration: InputDecoration(
                  labelText: 'Vehicle Seats',
                  icon: Icon(Icons.chair_alt,color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                items: _buildVehicleTypeDropdownItems(),
                onChanged: (String? value) {
                  setState(() {
                    selectedType = value;
                  });
                },
              ),
            ),
            SizedBox(height: 16),
            // Dropdown for Color
            Container(
              width: 350,
              height: 60,
              child: DropdownButtonFormField<String>(
                value: selectedColor,
                decoration: InputDecoration(
                  labelText: 'Color',
                  icon: Icon(Icons.color_lens,color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                items: colors.map((String color) {
                  return DropdownMenuItem<String>(
                    value: color,
                    child: Text(color),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedColor = value;
                  });
                },
              ),
            ),
            SizedBox(height: 16),
            // Dropdown for Category
            Container(
              width: 350,
              height: 60,
              child: DropdownButtonFormField<String>(
                value: selectedCategory,
                decoration: InputDecoration(
                  labelText: 'Category',
                  icon: Icon(Icons.category,color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                items: categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
              ),
            ),

            SizedBox(height: 16),
            // Dropdown for Extra Services
            Container(
              width: 350,
              height: 60,
              child: DropdownButtonFormField<String>(
                value: selectedExtraService,
                decoration: InputDecoration(
                  labelText: 'Extra Services',
                  icon: Icon(Icons.local_taxi,color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                items: extraServices.map((String service) {
                  return DropdownMenuItem<String>(
                    value: service,
                    child: Text(service),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedExtraService = value;
                  });
                },
              ),
            ),
            if (selectedExtraService == 'Child Pickup Services')
              Column(
                children: [
                  SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      // Handle upload of police report
                    },
                    child: Container(
                      width: 200,
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Police Report',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Icon(Icons.upload_file, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      // Handle upload of police clearance
                    },
                    child: Container(
                      width: 200,
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Police Clearance',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Icon(Icons.upload_file, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UploadImages()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.teal[600],
                padding: EdgeInsets.symmetric(vertical: 17, horizontal: 50),
                textStyle: TextStyle(fontSize: 17),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Next'),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

}

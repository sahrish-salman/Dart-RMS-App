import 'dart:io';

int attempt = 0;
List allOrders = [];
Map<String, int> menuPrice = {
  "Chicken Burger": 400,
  "Beef Burger": 450,
  "Zinger Burger": 500,
  "Double Beef Burger": 750,
  "Double Zinger Burger": 900,
};
List employees = [];
int orderNo = 0;
void main() {
  print("");
  print("========> WELCOME TO RESTAURANT MANAGEMENT SYSTEM <========");
  print("");
  employees.add({
    "id": "01",
    "password": "xyz",
    "name": "Sahrish",
    "designation": "Manager"
  });
  employees.add({
    "id": "02",
    "password": "1234",
    "name": "Shahrukh",
    "designation": "Chef"
  });
  employees.add({
    "id": "03",
    "password": "abcd",
    "name": "Haroon",
    "designation": "Waiter"
  });
  login();
}

login() {
  while (attempt < 4) {
    attempt++;
    print("=====> Login <=====");
    stdout.write("Enter ID: ");
    var id = stdin.readLineSync()!;
    stdout.write("Enter Password: ");
    var password = stdin.readLineSync()!;
    bool isFound = false;
    for (int i = 0; i < employees.length; i++) {
      if (id == employees[i]["id"] && password == employees[i]["password"]) {
        isFound = true;
        mainMenu(i);
      }
    }
    if (!isFound) {
      print("Invalid ID or Password");
      print("Returning to Login");
      login();
    }
  }
  if (attempt == 4) {
    print(" => You have exceeded the maximum number of attempts");
    print("Please try again later");
    exit(0);
  }
}

mainMenu(int index) {
  print("");
  print(
      " =====> Welcome ${employees[index]["name"]} to Restaurant Management System <=====");
  print("1. Order");
  print("2. Update Price");
  print("3. Order History");
  print("4. Log out");
  print("5. Exit");
  stdout.write("Please enter your choice: ");
  var choice = int.parse(stdin.readLineSync()!);
  print("- - - - - - - - - ");
  if (choice == 1) {
    orderMenu(index);
  } else if (choice == 2) {
    updatePrice(index);
  } else if (choice == 3) {
    orderHistory(index);
  } else if (choice == 4) {
    login();
  } else if (choice == 5) {
    exit(0);
  } else {
    print("Invalid choice");
    mainMenu(index);
  }
}

updatePrice(int index) {
  if (employees[index]["designation"] != "Manager") {
    print("You are not authorized to update price");
    print("Returning to Main Menu");
    mainMenu(index);
  }
  print("Update Price");
  print("1. Chicken Burger Current Price: ${menuPrice["Chicken Burger"]}");
  print("2. Beef Burger Current Price: ${menuPrice["Beef Burger"]}");
  print("3. Zinger Burger Current Price: ${menuPrice["Zinger Burger"]}");
  print(
      "4. Double Beef Burger Current Price: ${menuPrice["Double Beef Burger"]}");
  print(
      "5. Double Zinger Burger Current Price: ${menuPrice["Double Zinger Burger"]}");
  print("Please enter your choice: ");
  var choice = int.parse(stdin.readLineSync()!);
  if (choice == 1) {
    stdout.write("Enter New Price: ");
    var newPrice = int.parse(stdin.readLineSync()!);
    menuPrice["Chicken Burger"] = newPrice;
  } else if (choice == 2) {
    stdout.write("Enter New Price: ");
    var newPrice = int.parse(stdin.readLineSync()!);
    menuPrice["Beef Burger"] = newPrice;
  } else if (choice == 3) {
    stdout.write("Enter New Price: ");
    var newPrice = int.parse(stdin.readLineSync()!);
    menuPrice["Zinger Burger"] = newPrice;
  } else if (choice == 4) {
    stdout.write("Enter New Price: ");
    var newPrice = int.parse(stdin.readLineSync()!);
    menuPrice["Double Beef Burger"] = newPrice;
  } else if (choice == 5) {
    stdout.write("Enter New Price: ");
    var newPrice = int.parse(stdin.readLineSync()!);
    menuPrice["Double Zinger Burger"] = newPrice;
  } else {
    print("Invalid choice");
    print("Returning to Main Menu");
    mainMenu(index);
  }
  print("Price Updated");
  print("Press Enter to Continue");
  stdin.readLineSync();
  print("- - - - - - - - - ");
  mainMenu(index);
}

orderHistory(int index) {
  print("=====> Order History <=====");
  print("1. All Orders");
  print("2. Search Order");
  print("3. Back to Main Menu");
  stdout.write("Please enter your choice: ");
  var choice = int.parse(stdin.readLineSync()!);
  if (choice == 1) {
    allOrders.forEach((element) {
      print(element);
    });
    mainMenu(index);
  } else if (choice == 2) {
    searchOrder(index);
  } else if (choice == 3) {
    mainMenu(index);
  } else {
    print("Invalid choice");
    orderHistory(index);
  }
}

searchOrder(int index) {
  bool isFound = false;
  stdout.write("Enter Order No: ");
  var orderNos = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < allOrders.length; i++) {
    if (orderNos == allOrders[i]["Order No"]) {
      print(allOrders[i]);
      isFound = true;
    }
  }
  if (!isFound) {
    print("Order Not Found");
    print("Returning to Order History");
    orderHistory(index);
  }
  mainMenu(index);
}

orderMenu(int index) {
  print("1. Add Order");
  print("2. Edit Order");
  print("3. Delete Order");
  print("4. Back to Main Menu");
  print("Please enter your choice: ");
  var choice = int.parse(stdin.readLineSync()!);
  if (choice == 1) {
    addOrder(index);
  } else if (choice == 2) {
    EditOrder(index);
  } else if (choice == 3) {
    DeleteOrder(index);
  } else if (choice == 4) {
    mainMenu(index);
  } else {
    print("Invalid choice");
    orderMenu(index);
  }
}

addOrder(int index) {
  Map order = {};
  var choice2;
  orderNo++;
  do {
    print("Order No: $orderNo");
    order['Order No'] = orderNo;
    print("=======> Menu <=======");
    print("1. Chicken Burger ${menuPrice["Chicken Burger"]}");
    print("2. Beef Burger ${menuPrice["Beef Burger"]}");
    print("3. Zinger Burger ${menuPrice["Zinger Burger"]}");
    print("4. Double Beef Burger ${menuPrice["Double Beef Burger"]}");
    print("5. Double Zinger Burger ${menuPrice["Double Zinger Burger"]}");
    stdout.write("Please enter your choice: ");
    var choice = int.parse(stdin.readLineSync()!);
    if (choice == 1) {
      stdout.write("Enter Quantity: ");
      var quantity = int.parse(stdin.readLineSync()!);
      order['Chicken Burger'] = quantity;
    } else if (choice == 2) {
      stdout.write("Enter Quantity: ");
      var quantity = int.parse(stdin.readLineSync()!);
      order['Beef Burger'] = quantity;
    } else if (choice == 3) {
      stdout.write("Enter Quantity: ");
      var quantity = int.parse(stdin.readLineSync()!);
      order['Zinger Burger'] = quantity;
    } else if (choice == 4) {
      stdout.write("Enter Quantity: ");
      var quantity = int.parse(stdin.readLineSync()!);
      order['Double Beef Burger'] = quantity;
    } else if (choice == 5) {
      stdout.write("Enter Quantity: ");
      var quantity = int.parse(stdin.readLineSync()!);
      order['Double Zinger Burger'] = quantity;
    } else {
      print("Invalid choice");
      print("- - - - - - - - - - - - - - -");
      addOrder(index);
    }
    stdout.write("Do you want to add Another Item:(y/n):");
    choice2 = stdin.readLineSync()!;
    print("- - - - - - - - - - - - - - -");
  } while (
      choice2 == 'y' || choice2 == 'Y' || choice2 == 'yes' || choice2 == 'Yes');
  allOrders.add(Map.from(order));
  billGenerator(index, order);
}

billGenerator(int index, Map order) {
  double total;
  double tax;
  double grandTotal;
  double discount;
  double netTotal;
  print("==> Select Payment Method <==");
  print("1. Cash");
  print("2. Credit Card");
  print("3. Cancel Order");
  stdout.write("Please enter your choice: ");
  var choice = int.parse(stdin.readLineSync()!);
  print("- - - - - - - - - - - - - - -");
  print("=======> Bill <=======");
  if (choice == 1) {
    total = 0;
    if (order["Chicken Burger"] != null) {
      total = total + order["Chicken Burger"] * menuPrice["Chicken Burger"];
      print(
          "Chicken Burger: ${order["Chicken Burger"]} x ${menuPrice["Chicken Burger"]} = ${order["Chicken Burger"] * menuPrice["Chicken Burger"]}");
    }
    if (order["Beef Burger"] != null) {
      total = total + order["Beef Burger"] * menuPrice["Beef Burger"];
      print(
          "Beef Burger: ${order["Beef Burger"]} x ${menuPrice["Beef Burger"]} = ${order["Beef Burger"] * menuPrice["Beef Burger"]}");
    }
    if (order["Zinger Burger"] != null) {
      total = total + order["Zinger Burger"] * menuPrice["Zinger Burger"];
      print(
          "Zinger Burger: ${order["Zinger Burger"]} x ${menuPrice["Zinger Burger"]} = ${order["Zinger Burger"] * menuPrice["Zinger Burger"]}");
    }
    if (order["Double Beef Burger"] != null) {
      total =
          total + order["Double Beef Burger"] * menuPrice["Double Beef Burger"];
      print(
          "Double Beef Burger: ${order["Double Beef Burger"]} x ${menuPrice["Double Beef Burger"]} = ${order["Double Beef Burger"] * menuPrice["Double Beef Burger"]}");
      if (order["Double Zinger Burger"] != null) {
        total = total +
            order["Double Zinger Burger"] * menuPrice["Double Zinger Burger"];
        print(
            "Double Zinger Burger: ${order["Double Zinger Burger"]} x ${menuPrice["Double Zinger Burger"]} = ${order["Double Zinger Burger"] * menuPrice["Double Zinger Burger"]}");
        print("- - - - - - - - - - - - - - -");
      }
    }
    tax = total * 0.12;
    grandTotal = total + tax;
    discount = grandTotal * 0.09;
    netTotal = grandTotal - discount;
    print("Total: Rs $total");
    print("Tax: Rs $tax");
    print("Grand Total: Rs $grandTotal");
    print("Discount: Rs $discount");
    print("Net Total: Rs $netTotal");
    print("================================");
    stdout.write("Enter Cash Amount Recieved: ");
    var Cash = double.parse(stdin.readLineSync()!);
    print("Cash: Rs $Cash");
    print("Change: Rs ${Cash - netTotal}");
    print("Thank you for visiting");
    print("================================");
    print("Press Enter to Continue");
    stdin.readLineSync();
    order.clear();
    mainMenu(index);
  }
  if (choice == 2) {
    stdout.write("Enter Credit Card Number: ");
    var creditCard = stdin.readLineSync()!;
    print("- - - - - - - - - - - - - - -");
    total = 0;
    if (order["Chicken Burger"] != null) {
      total = total + order["Chicken Burger"] * menuPrice["Chicken Burger"];
      print(
          "Chicken Burger: ${order["Chicken Burger"]} x ${menuPrice["Chicken Burger"]} = ${order["Chicken Burger"] * menuPrice["Chicken Burger"]}");
    }
    if (order["Beef Burger"] != null) {
      total = total + order["Beef Burger"] * menuPrice["Beef Burger"];
      print(
          "Beef Burger: ${order["Beef Burger"]} x ${menuPrice["Beef Burger"]} = ${order["Beef Burger"] * menuPrice["Beef Burger"]}");
    }
    if (order["Zinger Burger"] != null) {
      total = total + order["Zinger Burger"] * menuPrice["Zinger Burger"];
      print(
          "Zinger Burger: ${order["Zinger Burger"]} x ${menuPrice["Zinger Burger"]} = ${order["Zinger Burger"] * menuPrice["Zinger Burger"]}");
    }
    if (order["Double Beef Burger"] != null) {
      total =
          total + order["Double Beef Burger"] * menuPrice["Double Beef Burger"];
      print(
          "Double Beef Burger: ${order["Double Beef Burger"]} x ${menuPrice["Double Beef Burger"]} = ${order["Double Beef Burger"] * menuPrice["Double Beef Burger"]}");
      if (order["Double Zinger Burger"] != null) {
        total = total +
            order["Double Zinger Burger"] * menuPrice["Double Zinger Burger"];
        print(
            "Double Zinger Burger: ${order["Double Zinger Burger"]} x ${menuPrice["Double Zinger Burger"]} = ${order["Double Zinger Burger"] * menuPrice["Double Zinger Burger"]}");
        print("- - - - - - - - - - - - - - -");
      }
      tax = total * 0.12;
      grandTotal = total + tax;
      discount = grandTotal * 0.09;
      netTotal = grandTotal - discount;
      print("Total: Rs $total");
      print("Tax: Rs $tax");
      print("Grand Total: Rs $grandTotal");
      print("Discount: Rs $discount");
      print("Net Total: Rs $netTotal");
      print("Credit Card Number: $creditCard");
      print("Thank you for visiting");
      print("==============================");
      print("Press Enter to Continue");
      order.clear();
      stdin.readLineSync();
      orderMenu(index);
    }
    if (choice == 3) {
      order.clear();
      print("Order Cancelled Sucessfully");
      allOrders.removeAt(allOrders.length - 1);
      mainMenu(index);
    } else {
      print("Invalid choice");
      billGenerator(index, order);
    }
  }
}

EditOrder(int index) {
  var choice2;
  Map orderEdit = {};
  stdout.write("Enter Order No: ");
  var orderNos = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < allOrders.length; i++) {
    if (orderNos == allOrders[i]["Order No"]) {
      orderEdit = allOrders[i];
      do {
        print("==> Re-Enter Order <==");
        print("Order No: ${orderEdit["Order No"]}");
        print("1. Chicken Burger ${menuPrice["Chicken Burger"]}");
        print("2. Beef Burger ${menuPrice["Beef Burger"]}");
        print("3. Zinger Burger ${menuPrice["Zinger Burger"]}");
        print("4. Double Beef Burger ${menuPrice["Double Beef Burger"]}");
        print("5. Double Zinger Burger ${menuPrice["Double Zinger Burger"]}");
        stdout.write("Please enter your choice: ");
        var choice = int.parse(stdin.readLineSync()!);
        if (choice == 1) {
          stdout.write("Enter Quantity: ");
          var quantity = int.parse(stdin.readLineSync()!);
          orderEdit["Chicken Burger"] = quantity;
        } else if (choice == 2) {
          stdout.write("Enter Quantity: ");
          var quantity = int.parse(stdin.readLineSync()!);
          orderEdit["Beef Burger"] = quantity;
        } else if (choice == 3) {
          stdout.write("Enter Quantity: ");
          var quantity = int.parse(stdin.readLineSync()!);
          orderEdit["Zinger Burger"] = quantity;
        } else if (choice == 4) {
          stdout.write("Enter Quantity: ");
          var quantity = int.parse(stdin.readLineSync()!);
          orderEdit["Double Beef Burger"] = quantity;
        } else if (choice == 5) {
          stdout.write("Enter Quantity: ");
          var quantity = int.parse(stdin.readLineSync()!);
          orderEdit["Double Zinger Burger"] = quantity;
        } else {
          print("Invalid choice");
          orderMenu(index);
        }
        stdout.write("Do you want to add Another Item:(y/n):");
        choice2 = stdin.readLineSync()!;
        print("=========================");
      } while (choice2 == 'y' ||
          choice2 == 'Y' ||
          choice2 == 'yes' ||
          choice2 == 'Yes');
      allOrders.add(Map.from(orderEdit));
      billGenerator(index, orderEdit);
    }
  }
}

DeleteOrder(int index) {
  bool isDeleted = false;
  print("==> Delete Order <==");
  stdout.write("Enter Order No: ");
  var orderNos = int.parse(stdin.readLineSync()!);
  print("========================");
  for (int i = 0; i < allOrders.length; i++) {
    if (orderNos == allOrders[i]["Order No"]) {
      allOrders.removeAt(i);
      isDeleted = true;
    }
  }
  if (!isDeleted) {
    print("=======================");
    print("Order Not Found");
    print("Returning to mainMenu");
    print("======================");
    orderMenu(index);
  }
}

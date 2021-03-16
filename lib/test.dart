// main() {
//   for (int i = 99; i > 0; i--) {
//     print(
//         '$i ${(i == 1) ? 'bottle' : 'bottles'} of beer on the wall, $i ${(i == 1) ? 'bottle' : 'bottles'} of beer. Take one down and pass it around, ${(i - 1) == 0 ? 'no more' : i - 1} ${(i - 1 == 1) ? 'bottle' : 'bottles'} of beer on the wall');
//   }
// }

List<int> winningNumbers = [12, 6, 34, 22, 41, 9];

void main() {
  List<int> ticket1 = [41, 2, 9, 18, 21, 33];
  // ignore: unused_local_variable
  List<int> ticket2 = [41, 17, 26, 32, 7, 35];

  checkNumbers(ticket1);
}

void checkNumbers(List<int> myNumbers) {
  int matches = 0;
  for (int myNum in myNumbers) {
    for (int winningNum in winningNumbers) {
      if (winningNum == myNum) {
        matches++;
      }
    }
  }
  print('You have $matches matching numbers');
}

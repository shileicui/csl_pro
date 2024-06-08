#include<iostream>
#include <ctime>
#include <cstdlib>

int main() {
    srand(time(0));
    int num = rand() % 100 + 1; // 生成1~100的随机数
    int guess;
    std::cout << "请猜一个1到100之间的整数: ";

    while (true) {
        std::cin >> guess;
        if (guess == num) {
            std::cout << "恭喜你，猜对了！"<< std::endl;
            break;
        } else if (guess < num) {
            std::cout << "猜小了，请继续猜: ";
        } else {
            std::cout << "猜大了，请继续猜: ";
        }
    }
    return 0;
}



// int main() {
//     srand(time(0));
//     int num = rand() % 100 + 1; // 生成1~100的随机数
//     int guess;

//     do {
//         std::cout << "请猜一个1到100之间的整数: ";
//         std::cin >> guess;
//         if (guess == num) {
//             std::cout << "恭喜你，猜对了！"<< std::endl;
//         } else if (guess < num) {
//             std::cout << "猜小了，请继续猜: ";
//         } else {
//             std::cout << "猜大了，请继续猜: ";
//         }
//     } while (guess != num);

//     return 0;
// }
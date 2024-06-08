#include<iostream>
#include<string>

int count_letters(const std::string& sentence) {
    int count = 0;
    for (char c : sentence) {
        if (isalpha(c)) {
            count++;
        }
    }
    return count;
}

int main() {
    std::string input;
    std::cout << "请输入一条英文句子: ";
    std::getline(std::cin, input);

    int letter_count = count_letters(input);
    std::cout << "句子中字母的个数为: "<< letter_count<< std::endl;

    return 0;
}
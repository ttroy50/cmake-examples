#include <fmt/core.h>
#include <iostream>
#include <string>
int main() {
    std::cout << "Enter your name: ";
    std::string name;
    std::cin >> name;
    fmt::print("Hello {}!\n", name);
    return 0;
}

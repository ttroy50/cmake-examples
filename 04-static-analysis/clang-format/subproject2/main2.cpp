#include <iostream>

class TestClass {
public:
    TestClass();
};

TestClass::TestClass() {

}

int main(int argc, char* argv[])
{
    std::cout << "Hello Main2!" << std::endl;
    int* x = NULL;
    std::cout << *x << std::endl;
    return 0;
}

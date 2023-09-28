#include <iostream>
#include <cpr/cpr.h>

int main(int argc, char** argv) {
  auto url = cpr::Url{"https://api.github.com/repos/libcpr/cpr"};
  cpr::Response r = cpr::Get(url);
  std::cout << r.status_code << "\n";
  std::cout << r.header["content-type"] << "\n";
  std::cout << r.text.substr(0, 150) << "...\n";
  return 0;
}

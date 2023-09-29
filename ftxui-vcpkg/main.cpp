#include "ftxui/component/captured_mouse.hpp"
#include "ftxui/component/component.hpp"
#include "ftxui/component/component_options.hpp"
#include "ftxui/component/screen_interactive.hpp"
#include <functional>
#include <iostream>
#include <string>
#include <vector>

int main() {
  auto screen = ftxui::ScreenInteractive::TerminalOutput();
  ftxui::MenuOption option;
  option.on_enter = screen.ExitLoopClosure();
  std::vector<std::string> entries = {
      "entry 1",
      "entry 2",
      "entry 3",
  };
  int selected = 0;
  auto menu = ftxui::Menu(&entries, &selected, option);
  screen.Loop(menu);
  std::cout << "Selected element = " << selected << std::endl;
}

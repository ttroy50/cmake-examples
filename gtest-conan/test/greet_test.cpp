#include "../src/greet.h"
#include <gtest/gtest.h>

TEST(GreetTest, GreetWithName) { EXPECT_EQ(greet("Alice"), "Hello Alice!"); }

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}

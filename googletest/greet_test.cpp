#include "greet.hpp"
#include <gtest/gtest.h>

// Demonstrate some basic assertions.
TEST(HelloTest, BasicAssertions) {
  // Expect two strings not to be equal.
  EXPECT_STRNE("hello", "world");
  // Expect equality.
  EXPECT_EQ(7 * 6, 42);
}

TEST(GreetTest, GreetWithName) {
  EXPECT_EQ(greet("Alice"), "Hello Alice!");
  EXPECT_EQ(greet("Alan Turing"), "Hello Alan Turing!");
}

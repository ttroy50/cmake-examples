#include <string>
#include "Reverse.h"
#include "Palindrome.h"

#include <gtest/gtest.h>

class ReverseTests : public ::testing::Test
{
};

TEST_F(ReverseTests, simple )
{
    std::string toRev = "Hello";

    Reverse rev;
    std::string res = rev.reverse(toRev);

    EXPECT_EQ(res, "olleH" );

}

TEST_F(ReverseTests, empty )
{
    std::string toRev;

    Reverse rev;
    std::string res = rev.reverse(toRev);

    EXPECT_EQ(res, "" );
}

TEST_F(ReverseTests,  is_palindrome )
{
    std::string pal = "mom";
    Palindrome pally;

    EXPECT_TRUE(pally.isPalindrome(pal));

}

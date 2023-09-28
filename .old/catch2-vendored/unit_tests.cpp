#include <string>
#include "Reverse.h"
#include "Palindrome.h"

#define CATCH_CONFIG_MAIN
#include "catch2/catch.hpp"


TEST_CASE( "simple" )
{
    std::string toRev = "Hello";

    Reverse rev;
    std::string res = rev.reverse(toRev);

    REQUIRE( res == "olleH" );
}

TEST_CASE( "empty" )
{
    std::string toRev;

    Reverse rev;
    std::string res = rev.reverse(toRev);

    REQUIRE( res == "" );
}

TEST_CASE( "is_palindrome" )
{
    std::string pal = "mom";
    Palindrome pally;

    REQUIRE( pally.isPalindrome(pal) == true );

}

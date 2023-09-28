#include <string>
#include "Reverse.h"
#include "Palindrome.h"

#define BOOST_TEST_MODULE VsidCommonTest
#include <boost/test/unit_test.hpp>

BOOST_AUTO_TEST_SUITE( reverse_tests )

BOOST_AUTO_TEST_CASE( simple )
{
    std::string toRev = "Hello";

    Reverse rev;
    std::string res = rev.reverse(toRev);

    BOOST_CHECK_EQUAL( res, "olleH" );

}


BOOST_AUTO_TEST_CASE( empty )
{
    std::string toRev;

    Reverse rev;
    std::string res = rev.reverse(toRev);

    BOOST_CHECK_EQUAL( res, "" );
}

BOOST_AUTO_TEST_SUITE_END()


BOOST_AUTO_TEST_SUITE( palindrome_tests )

BOOST_AUTO_TEST_CASE( is_palindrome )
{
    std::string pal = "mom";
    Palindrome pally;

    BOOST_CHECK_EQUAL( pally.isPalindrome(pal), true );

}

BOOST_AUTO_TEST_SUITE_END()

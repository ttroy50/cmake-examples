#include "Palindrome.h"

bool Palindrome::isPalindrome(const std::string& toCheck)
{

    if (toCheck == std::string(toCheck.rbegin(), toCheck.rend())) {
        return true;
    }

    return false;
}

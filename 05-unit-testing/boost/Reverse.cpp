#include "Reverse.h"

std::string Reverse::reverse(std::string& toReverse)
{
    std::string ret;

    for(std::string::reverse_iterator rit=toReverse.rbegin(); rit!=toReverse.rend(); ++rit)
    {
        ret.insert(ret.end(), *rit);
    }
    return ret;
}

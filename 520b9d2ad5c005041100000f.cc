#include <regex>
auto pig_it(std::string str) {
    return regex_replace(str, std::regex{"(\\w)(\\w*)"}, "$2$1ay");
}

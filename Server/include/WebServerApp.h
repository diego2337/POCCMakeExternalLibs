#ifndef WebServerApp_H_
#define WebServerApp_H_

#include "Poco/Util/ServerApplication.h"

using namespace Poco::Util;

class WebServerApp: public ServerApplication
{
    void initialize(Application& self);
    int main(const std::vector<std::string>&);
};

#endif

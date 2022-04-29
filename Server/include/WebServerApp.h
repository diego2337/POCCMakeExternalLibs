#ifndef WebServerApp_H_
#define WebServerApp_H_

#include <iostream>

#include "Poco/Net/HTTPServer.h"
#include "Poco/Net/HTTPServerRequest.h"
#include "Poco/Net/HTTPServerResponse.h"
#include "Poco/Util/ServerApplication.h"

#include "../include/factory/HelloRequestHandlerFactory.h"

using namespace Poco;
using namespace Poco::Net;
using namespace Poco::Util;

class WebServerApp: public ServerApplication
{
    void initialize(Application& self);
    int main(const std::vector<std::string>&);
};

#endif

#ifndef HelloRequestHandlerFactory_H_
#define HelloRequestHandlerFactory_H_

#include "Poco/Net/HTTPRequestHandlerFactory.h"
#include "Poco/Net/HTTPRequestHandler.h"
#include "Poco/Net/HTTPRequestHandlerFactory.h"

#include "../HelloRequestHandler.h"

using namespace Poco::Net;

class HelloRequestHandlerFactory: public HTTPRequestHandlerFactory
{
    HTTPRequestHandler* createRequestHandler(const HTTPServerRequest&)
    {
        return new HelloRequestHandler;
    }
};

#endif

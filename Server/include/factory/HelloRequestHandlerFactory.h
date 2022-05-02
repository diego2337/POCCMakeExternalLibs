#ifndef HelloRequestHandlerFactory_H_
#define HelloRequestHandlerFactory_H_

#include "Poco/Net/HTTPRequestHandlerFactory.h"

class HelloRequestHandlerFactory: public HTTPRequestHandlerFactory
{
    HTTPRequestHandler* createRequestHandler(const HTTPServerRequest&)
    {
        return new HelloRequestHandler;
    }
};

#endif

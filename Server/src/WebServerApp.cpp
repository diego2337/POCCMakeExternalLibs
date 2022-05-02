#ifndef WebServerApp_H_
#include "../include/WebServerApp.h"
#endif

void WebServerApp::initialize(Application& self)
{
    loadConfiguration();
    ServerApplication::initialize(self);
}

int WebServerApp::main(const std::vector<std::string>&)
{
    UInt16 port = static_cast<UInt16>(config().getUInt("port", 8080));

    HTTPServer srv(new HelloRequestHandlerFactory, port);
    srv.start();
    logger().information("HTTP Server started on port %hu.", port);
    waitForTerminationRequest();
    logger().information("Stopping HTTP Server...");
    srv.stop();

    return Application::EXIT_OK;
}

POCO_SERVER_MAIN(WebServerApp)
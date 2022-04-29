#ifndef HelloRequestHandler_H_
#include "../include/HelloRequestHandler.h"
#endif
#ifndef HelloXML_H_
#include "../../XMLSerializer/include/HelloXML.h"
#endif

void HelloRequestHandler::handleRequest(HTTPServerRequest& request, HTTPServerResponse& response)
{
    Application& app = Application::instance();
    app.logger().information("Request from %s", request.clientAddress().toString());

    response.setChunkedTransferEncoding(true);
    response.setContentType("text/html");

    response.send()
        << "<html>"
        << "<head><title>Hello</title></head>"
        << "<body><h1>Hello from the POCO Web Server</h1></body>"
        << "</html>";
}
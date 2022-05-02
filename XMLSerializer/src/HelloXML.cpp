#ifndef HelloXML_H_
#include "../include/HelloXML.h"
#endif

namespace XMLSerializer 
{
    std::string HelloXML::serialize(std::string XML)
    {
        return "<html><head><title>Hello</title></head><body><h1>Hello from the POCO Web Server</h1></body></html>";
    }
}

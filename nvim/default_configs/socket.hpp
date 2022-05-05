#ifndef SOCKET_H
#define SOCKET_H

#include <arpa/inet.h>
#include <string>


namespace Sockets {

/*Base class that holds data about socket*/
class Socket {
private:
protected:
  /*paramaters got from base C library*/
  sockaddr_in socketHint;

public:
  Socket(std::string address, uint16_t port);

  // Getters
  uint16_t getPort() const;
  std::string getAddress() const;
  const sockaddr_in &getSocketHint() const;
};

class BoundSocket;
class ListenSocket;
class ConnectSocket;

} // namespace Sockets
#endif

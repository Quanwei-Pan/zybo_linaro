
/* /usr/include/sys/socket.h */

enum PF_TYPE {
	PF_UNIX      = 1,      /* Unix domain sockets          */
	PF_LOCAL     = 1,      /* POSIX name for AF_UNIX       */
	PF_INET      = 2,      /* Internet IP Protocol         */
	PF_AX25      = 3,      /* Amateur Radio AX.25          */
	PF_IPX       = 4,      /* Novell IPX                   */
	PF_APPLETALK = 5,      /* AppleTalk DDP                */
	PF_NETROM    = 6,      /* Amateur Radio NET/ROM        */
	PF_BRIDGE    = 7,      /* Multiprotocol bridge         */
	PF_ATMPVC    = 8,      /* ATM PVCs                     */
	PF_X25       = 9,      /* Reserved for X.25 project    */
	PF_INET6     = 10,     /* IP version 6                 */
	PF_ROSE      = 11,     /* Amateur Radio X.25 PLP       */
	PF_DECnet    = 12,     /* Reserved for DECnet project  */
	PF_NETBEUI   = 13,     /* Reserved for 802.2LLC project*/
	PF_SECURITY  = 14,     /* Security callback pseudo AF */
	PF_KEY       = 15,     /* PF_KEY key management API */
	PF_NETLINK   = 16,
	PF_ROUTE     = 16,        /* Alias to emulate 4.4BSD */
	PF_PACKET    = 17,     /* Packet family                */
	PF_ASH       = 18,     /* Ash                          */
	PF_ECONET    = 19,     /* Acorn Econet                 */
	PF_ATMSVC    = 20,     /* ATM SVCs                     */
	PF_RDS       = 21,     /* RDS sockets                  */
	PF_SNA       = 22,     /* Linux SNA Project (nutters!) */
	PF_IRDA      = 23,     /* IRDA sockets                 */
	PF_PPPOX     = 24,     /* PPPoX sockets                */
	PF_WANPIPE   = 25,     /* Wanpipe API Sockets */
	PF_LLC       = 26,     /* Linux LLC                    */
	PF_CAN       = 29,     /* Controller Area Network      */
	PF_TIPC      = 30,     /* TIPC sockets                 */
	PF_BLUETOOTH = 31,     /* Bluetooth sockets            */
	PF_IUCV      = 32,     /* IUCV sockets                 */
	PF_RXRPC     = 33,     /* RxRPC sockets                */
	PF_ISDN      = 34,     /* mISDN sockets                */
	PF_PHONET    = 35      /* Phonet sockets               */
};

enum SOCK_TYPE {
        SOCK_STREAM     = 1,
        SOCK_DGRAM      = 2,
        SOCK_RAW        = 3,
        SOCK_RDM        = 4,
        SOCK_SEQPACKET  = 5,
        SOCK_DCCP       = 6,
        SOCK_PACKET     = 10
};

int socket(int domain = PF_TYPE, int type = SOCK_TYPE, int protocol);
int socketpair(int domain = PF_TYPE, int type = SOCK_TYPE, int protocol, void *fds);
int bind(int fd, void *addr, socklen_t len);
int getsockname(int fd, void *addr, socklen_t *len);
int connect(int fd, void *addr, socklen_t len);
int getpeername(int fd, void *addr, socklen_t *len);


size_t send(int fd, void *buf, size_t n, int flags);
size_t recv(int fd, void *buf, size_t n, int flags);


size_t sendto(int fd, void *buf, size_t n, int flags, void *addr, socklen_t addr_len);
size_t recvfrom(int fd, void *buf, size_t n, int flags, void *addr, socklen_t *addr_len);
size_t sendmsg(int fd, void *message, int flags);
size_t recvmsg(int fd, void *message, int flags);


int getsockopt(int fd, int level, int optname, void *optval, socklen_t *optlen);
int setsockopt(int fd, int level, int optname, void *optval, socklen_t optlen);


int listen(int fd, int n);
int accept(int fd, void *addr, socklen_t *addr_len);
int shutdown(int fd, int how);
int sockatmark(int fd);
int isfdtype(int fd, int fdtype);

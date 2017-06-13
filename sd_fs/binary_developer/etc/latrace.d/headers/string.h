
/* /usr/include/string.h */


void*   memcpy(void *dest, void *src, size_t n);
void*   memmove(void *dest, void *src, size_t n);
void*   memccpy(void *dest, void *src, int c, size_t n);
void*   memset(void *s, int c, size_t n);
int     memcmp(void *s1, void *s2, size_t n);
void*   memchr(void *s, int c, size_t n);
void*   rawmemchr(void *s, int c);
void*   memrchr(void *s, int c, size_t n);


char*   strcpy(void *dest, char *src);
char*   strncpy(void *dest, char *src, size_t n);
char*   strcat(void *dest, char *src);
char*   strncat(void *dest, char *src, size_t n);
int     strcmp(char *s1, char *s2);
int     strncmp(char *s1, char *s2, size_t n);
int     strcoll(char *s1, char *s2);
size_t  strxfrm(char *dest, char *src, size_t n);


int     strcoll_l(char *s1, char *s2, __locale_t l);
size_t  strxfrm_l(char *dest, char *src, size_t n, __locale_t l);


char*   strdup(char *s);
char*   strndup(char *string, size_t n);
char*   strchr(char *s, int c);
char*   strrchr(char *s, int c);
char*   strchrnul(char *s, int c);
size_t  strcspn(char *s, char *reject);
size_t  strspn(char *s, char *accept);
char*   strpbrk(char *s, char *accept);
char*   strstr(char *haystack, char *needle);
char*   strtok(char *s, char *delim);
char*   __strtok_r(char *s, char *delim, void *save_ptr);
char*   strtok_r(char *s, char *delim, void *save_ptr);


char*   strcasestr(char *haystack, char *needle);
void*   memmem(void *haystack, size_t haystacklen, void *needle, size_t needlelen);
void*   __mempcpy(void *dest, void *src, size_t n);
void*   mempcpy(void *dest, void *src, size_t n);
size_t  strlen(char *s);
size_t  strnlen(char *string, size_t maxlen);
char*   strerror(int errnum);


int     __xpg_strerror_r(int errnum, char *buf, size_t buflen);
char*   strerror_r(int errnum, char *buf, size_t buflen);
char*   strerror_l(int errnum, __locale_t l);
void    __bzero(void *s, size_t n);
void    bcopy(void *src, void *dest, size_t n);
void    bzero(void *s, size_t n);
int     bcmp(void *s1, void *s2, size_t n);
char*   index(char *s, int c);
char*   rindex(char *s, int c);

int     ffs(int i);
int     ffsl(long l);

/*	we dont do big numbers so far

__extension__ extern int ffsll (long long int __ll)

*/


int     strcasecmp(char *s1, char *s2);
int     strncasecmp(char *s1, char *s2, size_t n);
int     strcasecmp_l(char *s1, char *s2, __locale_t loc);
int     strncasecmp_l(char *s1, char *s2, size_t n, __locale_t loc);
char*   strsep(void *stringp, char *delim);
int     strverscmp(char *s1, char *s2);
char*   strsignal(int sig);
+char*   __stpcpy(void *dest, char *src);
+char*   stpcpy(void *dest, char *src);
+char*   __stpncpy(void *dest, char *src, size_t n);
+char*   stpncpy(void *dest, char *src, size_t n);
char*   strfry(char *string);
void*   memfrob(void *s, size_t n);
char*   basename(char *filename);

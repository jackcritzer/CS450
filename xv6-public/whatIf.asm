
_whatIf:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
	close(file);
}


int
main(int argc, char *argv[]){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 20             	sub    $0x20,%esp
  14:	8b 19                	mov    (%ecx),%ebx
  16:	8b 71 04             	mov    0x4(%ecx),%esi
	int fd = 0;
	int child_file = open("child.txt", O_CREATE|O_WRONLY);
  19:	68 01 02 00 00       	push   $0x201
  1e:	68 d0 07 00 00       	push   $0x7d0
  23:	e8 7a 03 00 00       	call   3a2 <open>
  28:	89 c7                	mov    %eax,%edi
	int parent_file = open("parent.txt", O_CREATE|O_WRONLY);
  2a:	58                   	pop    %eax
  2b:	5a                   	pop    %edx
  2c:	68 01 02 00 00       	push   $0x201
  31:	68 da 07 00 00       	push   $0x7da
  36:	e8 67 03 00 00       	call   3a2 <open>
	
	if(argc == 1){
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	83 fb 01             	cmp    $0x1,%ebx

int
main(int argc, char *argv[]){
	int fd = 0;
	int child_file = open("child.txt", O_CREATE|O_WRONLY);
	int parent_file = open("parent.txt", O_CREATE|O_WRONLY);
  41:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	
	if(argc == 1){
  44:	74 43                	je     89 <main+0x89>
		fd = 0;
	}
	else{
		fd = open(argv[1], O_RDONLY);
  46:	83 ec 08             	sub    $0x8,%esp
  49:	6a 00                	push   $0x0
  4b:	ff 76 04             	pushl  0x4(%esi)
  4e:	e8 4f 03 00 00       	call   3a2 <open>
		if(fd == -1){
  53:	83 c4 10             	add    $0x10,%esp
  56:	83 f8 ff             	cmp    $0xffffffff,%eax
	
	if(argc == 1){
		fd = 0;
	}
	else{
		fd = open(argv[1], O_RDONLY);
  59:	89 c3                	mov    %eax,%ebx
		if(fd == -1){
  5b:	74 43                	je     a0 <main+0xa0>
			printf(1, "no file named %s", argv[1]);
			exit();
		}
	}
		
	int pid = fork();
  5d:	e8 f8 02 00 00       	call   35a <fork>
		
	if(pid < 0) {
  62:	85 c0                	test   %eax,%eax
  64:	78 27                	js     8d <main+0x8d>
		printf(1, "fork failed\n");
		exit();
	}
	else if (pid == 0){
  66:	74 13                	je     7b <main+0x7b>
		//write to child
		writetofile(child_file, fd);
	}
	else{
		//write to parent
		writetofile(parent_file, fd);
  68:	50                   	push   %eax
  69:	50                   	push   %eax
  6a:	53                   	push   %ebx
  6b:	ff 75 e4             	pushl  -0x1c(%ebp)
  6e:	e8 4d 00 00 00       	call   c0 <writetofile>
  73:	83 c4 10             	add    $0x10,%esp
	}
	
	exit();
  76:	e8 e7 02 00 00       	call   362 <exit>
		printf(1, "fork failed\n");
		exit();
	}
	else if (pid == 0){
		//write to child
		writetofile(child_file, fd);
  7b:	52                   	push   %edx
  7c:	52                   	push   %edx
  7d:	53                   	push   %ebx
  7e:	57                   	push   %edi
  7f:	e8 3c 00 00 00       	call   c0 <writetofile>
  84:	83 c4 10             	add    $0x10,%esp
  87:	eb ed                	jmp    76 <main+0x76>
	int fd = 0;
	int child_file = open("child.txt", O_CREATE|O_WRONLY);
	int parent_file = open("parent.txt", O_CREATE|O_WRONLY);
	
	if(argc == 1){
		fd = 0;
  89:	31 db                	xor    %ebx,%ebx
  8b:	eb d0                	jmp    5d <main+0x5d>
	}
		
	int pid = fork();
		
	if(pid < 0) {
		printf(1, "fork failed\n");
  8d:	51                   	push   %ecx
  8e:	51                   	push   %ecx
  8f:	68 f6 07 00 00       	push   $0x7f6
  94:	6a 01                	push   $0x1
  96:	e8 15 04 00 00       	call   4b0 <printf>
		exit();
  9b:	e8 c2 02 00 00       	call   362 <exit>
		fd = 0;
	}
	else{
		fd = open(argv[1], O_RDONLY);
		if(fd == -1){
			printf(1, "no file named %s", argv[1]);
  a0:	53                   	push   %ebx
  a1:	ff 76 04             	pushl  0x4(%esi)
  a4:	68 e5 07 00 00       	push   $0x7e5
  a9:	6a 01                	push   $0x1
  ab:	e8 00 04 00 00       	call   4b0 <printf>
			exit();
  b0:	e8 ad 02 00 00       	call   362 <exit>
  b5:	66 90                	xchg   %ax,%ax
  b7:	66 90                	xchg   %ax,%ax
  b9:	66 90                	xchg   %ax,%ax
  bb:	66 90                	xchg   %ax,%ax
  bd:	66 90                	xchg   %ax,%ax
  bf:	90                   	nop

000000c0 <writetofile>:

// Parsed command representation
#define MAXBUF 512

void
writetofile(int file, int fd){
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	57                   	push   %edi
  c4:	56                   	push   %esi
  c5:	53                   	push   %ebx
  c6:	8d 9d e8 fd ff ff    	lea    -0x218(%ebp),%ebx
  cc:	81 ec 0c 02 00 00    	sub    $0x20c,%esp
  d2:	8b 75 08             	mov    0x8(%ebp),%esi
  d5:	8b 7d 0c             	mov    0xc(%ebp),%edi
  d8:	eb 14                	jmp    ee <writetofile+0x2e>
  da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	while(1){
		int n = read(fd, buf, sizeof(buf));
		
		if(n <= 0) break;
		
		write(file, buf, n);
  e0:	83 ec 04             	sub    $0x4,%esp
  e3:	50                   	push   %eax
  e4:	53                   	push   %ebx
  e5:	56                   	push   %esi
  e6:	e8 97 02 00 00       	call   382 <write>
	}		
  eb:	83 c4 10             	add    $0x10,%esp
void
writetofile(int file, int fd){
	char buf[MAXBUF];

	while(1){
		int n = read(fd, buf, sizeof(buf));
  ee:	83 ec 04             	sub    $0x4,%esp
  f1:	68 00 02 00 00       	push   $0x200
  f6:	53                   	push   %ebx
  f7:	57                   	push   %edi
  f8:	e8 7d 02 00 00       	call   37a <read>
		
		if(n <= 0) break;
  fd:	83 c4 10             	add    $0x10,%esp
 100:	85 c0                	test   %eax,%eax
 102:	7f dc                	jg     e0 <writetofile+0x20>
		
		write(file, buf, n);
	}		
	close(file);
 104:	83 ec 0c             	sub    $0xc,%esp
 107:	56                   	push   %esi
 108:	e8 7d 02 00 00       	call   38a <close>
}
 10d:	83 c4 10             	add    $0x10,%esp
 110:	8d 65 f4             	lea    -0xc(%ebp),%esp
 113:	5b                   	pop    %ebx
 114:	5e                   	pop    %esi
 115:	5f                   	pop    %edi
 116:	5d                   	pop    %ebp
 117:	c3                   	ret    
 118:	66 90                	xchg   %ax,%ax
 11a:	66 90                	xchg   %ax,%ax
 11c:	66 90                	xchg   %ax,%ax
 11e:	66 90                	xchg   %ax,%ax

00000120 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	8b 45 08             	mov    0x8(%ebp),%eax
 127:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 12a:	89 c2                	mov    %eax,%edx
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 130:	83 c1 01             	add    $0x1,%ecx
 133:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 137:	83 c2 01             	add    $0x1,%edx
 13a:	84 db                	test   %bl,%bl
 13c:	88 5a ff             	mov    %bl,-0x1(%edx)
 13f:	75 ef                	jne    130 <strcpy+0x10>
    ;
  return os;
}
 141:	5b                   	pop    %ebx
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    
 144:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 14a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	56                   	push   %esi
 154:	53                   	push   %ebx
 155:	8b 55 08             	mov    0x8(%ebp),%edx
 158:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 15b:	0f b6 02             	movzbl (%edx),%eax
 15e:	0f b6 19             	movzbl (%ecx),%ebx
 161:	84 c0                	test   %al,%al
 163:	75 1e                	jne    183 <strcmp+0x33>
 165:	eb 29                	jmp    190 <strcmp+0x40>
 167:	89 f6                	mov    %esi,%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 170:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 173:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 176:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 179:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 17d:	84 c0                	test   %al,%al
 17f:	74 0f                	je     190 <strcmp+0x40>
 181:	89 f1                	mov    %esi,%ecx
 183:	38 d8                	cmp    %bl,%al
 185:	74 e9                	je     170 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 187:	29 d8                	sub    %ebx,%eax
}
 189:	5b                   	pop    %ebx
 18a:	5e                   	pop    %esi
 18b:	5d                   	pop    %ebp
 18c:	c3                   	ret    
 18d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 190:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 192:	29 d8                	sub    %ebx,%eax
}
 194:	5b                   	pop    %ebx
 195:	5e                   	pop    %esi
 196:	5d                   	pop    %ebp
 197:	c3                   	ret    
 198:	90                   	nop
 199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001a0 <strlen>:

uint
strlen(const char *s)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1a6:	80 39 00             	cmpb   $0x0,(%ecx)
 1a9:	74 12                	je     1bd <strlen+0x1d>
 1ab:	31 d2                	xor    %edx,%edx
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
 1b0:	83 c2 01             	add    $0x1,%edx
 1b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1b7:	89 d0                	mov    %edx,%eax
 1b9:	75 f5                	jne    1b0 <strlen+0x10>
    ;
  return n;
}
 1bb:	5d                   	pop    %ebp
 1bc:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 1bd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 1bf:	5d                   	pop    %ebp
 1c0:	c3                   	ret    
 1c1:	eb 0d                	jmp    1d0 <memset>
 1c3:	90                   	nop
 1c4:	90                   	nop
 1c5:	90                   	nop
 1c6:	90                   	nop
 1c7:	90                   	nop
 1c8:	90                   	nop
 1c9:	90                   	nop
 1ca:	90                   	nop
 1cb:	90                   	nop
 1cc:	90                   	nop
 1cd:	90                   	nop
 1ce:	90                   	nop
 1cf:	90                   	nop

000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1da:	8b 45 0c             	mov    0xc(%ebp),%eax
 1dd:	89 d7                	mov    %edx,%edi
 1df:	fc                   	cld    
 1e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e2:	89 d0                	mov    %edx,%eax
 1e4:	5f                   	pop    %edi
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    
 1e7:	89 f6                	mov    %esi,%esi
 1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	53                   	push   %ebx
 1f4:	8b 45 08             	mov    0x8(%ebp),%eax
 1f7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 1fa:	0f b6 10             	movzbl (%eax),%edx
 1fd:	84 d2                	test   %dl,%dl
 1ff:	74 1d                	je     21e <strchr+0x2e>
    if(*s == c)
 201:	38 d3                	cmp    %dl,%bl
 203:	89 d9                	mov    %ebx,%ecx
 205:	75 0d                	jne    214 <strchr+0x24>
 207:	eb 17                	jmp    220 <strchr+0x30>
 209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 210:	38 ca                	cmp    %cl,%dl
 212:	74 0c                	je     220 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 214:	83 c0 01             	add    $0x1,%eax
 217:	0f b6 10             	movzbl (%eax),%edx
 21a:	84 d2                	test   %dl,%dl
 21c:	75 f2                	jne    210 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 21e:	31 c0                	xor    %eax,%eax
}
 220:	5b                   	pop    %ebx
 221:	5d                   	pop    %ebp
 222:	c3                   	ret    
 223:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000230 <gets>:

char*
gets(char *buf, int max)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
 235:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 236:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 238:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 23b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 23e:	eb 29                	jmp    269 <gets+0x39>
    cc = read(0, &c, 1);
 240:	83 ec 04             	sub    $0x4,%esp
 243:	6a 01                	push   $0x1
 245:	57                   	push   %edi
 246:	6a 00                	push   $0x0
 248:	e8 2d 01 00 00       	call   37a <read>
    if(cc < 1)
 24d:	83 c4 10             	add    $0x10,%esp
 250:	85 c0                	test   %eax,%eax
 252:	7e 1d                	jle    271 <gets+0x41>
      break;
    buf[i++] = c;
 254:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 258:	8b 55 08             	mov    0x8(%ebp),%edx
 25b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 25d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 25f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 263:	74 1b                	je     280 <gets+0x50>
 265:	3c 0d                	cmp    $0xd,%al
 267:	74 17                	je     280 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 269:	8d 5e 01             	lea    0x1(%esi),%ebx
 26c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 26f:	7c cf                	jl     240 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 271:	8b 45 08             	mov    0x8(%ebp),%eax
 274:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 278:	8d 65 f4             	lea    -0xc(%ebp),%esp
 27b:	5b                   	pop    %ebx
 27c:	5e                   	pop    %esi
 27d:	5f                   	pop    %edi
 27e:	5d                   	pop    %ebp
 27f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 280:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 283:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 285:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 289:	8d 65 f4             	lea    -0xc(%ebp),%esp
 28c:	5b                   	pop    %ebx
 28d:	5e                   	pop    %esi
 28e:	5f                   	pop    %edi
 28f:	5d                   	pop    %ebp
 290:	c3                   	ret    
 291:	eb 0d                	jmp    2a0 <stat>
 293:	90                   	nop
 294:	90                   	nop
 295:	90                   	nop
 296:	90                   	nop
 297:	90                   	nop
 298:	90                   	nop
 299:	90                   	nop
 29a:	90                   	nop
 29b:	90                   	nop
 29c:	90                   	nop
 29d:	90                   	nop
 29e:	90                   	nop
 29f:	90                   	nop

000002a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a5:	83 ec 08             	sub    $0x8,%esp
 2a8:	6a 00                	push   $0x0
 2aa:	ff 75 08             	pushl  0x8(%ebp)
 2ad:	e8 f0 00 00 00       	call   3a2 <open>
  if(fd < 0)
 2b2:	83 c4 10             	add    $0x10,%esp
 2b5:	85 c0                	test   %eax,%eax
 2b7:	78 27                	js     2e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2b9:	83 ec 08             	sub    $0x8,%esp
 2bc:	ff 75 0c             	pushl  0xc(%ebp)
 2bf:	89 c3                	mov    %eax,%ebx
 2c1:	50                   	push   %eax
 2c2:	e8 f3 00 00 00       	call   3ba <fstat>
 2c7:	89 c6                	mov    %eax,%esi
  close(fd);
 2c9:	89 1c 24             	mov    %ebx,(%esp)
 2cc:	e8 b9 00 00 00       	call   38a <close>
  return r;
 2d1:	83 c4 10             	add    $0x10,%esp
 2d4:	89 f0                	mov    %esi,%eax
}
 2d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2d9:	5b                   	pop    %ebx
 2da:	5e                   	pop    %esi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret    
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 2e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2e5:	eb ef                	jmp    2d6 <stat+0x36>
 2e7:	89 f6                	mov    %esi,%esi
 2e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002f0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	53                   	push   %ebx
 2f4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2f7:	0f be 11             	movsbl (%ecx),%edx
 2fa:	8d 42 d0             	lea    -0x30(%edx),%eax
 2fd:	3c 09                	cmp    $0x9,%al
 2ff:	b8 00 00 00 00       	mov    $0x0,%eax
 304:	77 1f                	ja     325 <atoi+0x35>
 306:	8d 76 00             	lea    0x0(%esi),%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 310:	8d 04 80             	lea    (%eax,%eax,4),%eax
 313:	83 c1 01             	add    $0x1,%ecx
 316:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 31a:	0f be 11             	movsbl (%ecx),%edx
 31d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 320:	80 fb 09             	cmp    $0x9,%bl
 323:	76 eb                	jbe    310 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 325:	5b                   	pop    %ebx
 326:	5d                   	pop    %ebp
 327:	c3                   	ret    
 328:	90                   	nop
 329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000330 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	56                   	push   %esi
 334:	53                   	push   %ebx
 335:	8b 5d 10             	mov    0x10(%ebp),%ebx
 338:	8b 45 08             	mov    0x8(%ebp),%eax
 33b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 33e:	85 db                	test   %ebx,%ebx
 340:	7e 14                	jle    356 <memmove+0x26>
 342:	31 d2                	xor    %edx,%edx
 344:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 348:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 34c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 34f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 352:	39 da                	cmp    %ebx,%edx
 354:	75 f2                	jne    348 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 356:	5b                   	pop    %ebx
 357:	5e                   	pop    %esi
 358:	5d                   	pop    %ebp
 359:	c3                   	ret    

0000035a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 35a:	b8 01 00 00 00       	mov    $0x1,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <exit>:
SYSCALL(exit)
 362:	b8 02 00 00 00       	mov    $0x2,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <wait>:
SYSCALL(wait)
 36a:	b8 03 00 00 00       	mov    $0x3,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <pipe>:
SYSCALL(pipe)
 372:	b8 04 00 00 00       	mov    $0x4,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <read>:
SYSCALL(read)
 37a:	b8 05 00 00 00       	mov    $0x5,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <write>:
SYSCALL(write)
 382:	b8 10 00 00 00       	mov    $0x10,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <close>:
SYSCALL(close)
 38a:	b8 15 00 00 00       	mov    $0x15,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <kill>:
SYSCALL(kill)
 392:	b8 06 00 00 00       	mov    $0x6,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <exec>:
SYSCALL(exec)
 39a:	b8 07 00 00 00       	mov    $0x7,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <open>:
SYSCALL(open)
 3a2:	b8 0f 00 00 00       	mov    $0xf,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <mknod>:
SYSCALL(mknod)
 3aa:	b8 11 00 00 00       	mov    $0x11,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <unlink>:
SYSCALL(unlink)
 3b2:	b8 12 00 00 00       	mov    $0x12,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <fstat>:
SYSCALL(fstat)
 3ba:	b8 08 00 00 00       	mov    $0x8,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <link>:
SYSCALL(link)
 3c2:	b8 13 00 00 00       	mov    $0x13,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <mkdir>:
SYSCALL(mkdir)
 3ca:	b8 14 00 00 00       	mov    $0x14,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <chdir>:
SYSCALL(chdir)
 3d2:	b8 09 00 00 00       	mov    $0x9,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <dup>:
SYSCALL(dup)
 3da:	b8 0a 00 00 00       	mov    $0xa,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <getpid>:
SYSCALL(getpid)
 3e2:	b8 0b 00 00 00       	mov    $0xb,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <sbrk>:
SYSCALL(sbrk)
 3ea:	b8 0c 00 00 00       	mov    $0xc,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <sleep>:
SYSCALL(sleep)
 3f2:	b8 0d 00 00 00       	mov    $0xd,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <uptime>:
SYSCALL(uptime)
 3fa:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <alsonice>:
SYSCALL(alsonice)
 402:	b8 16 00 00 00       	mov    $0x16,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    
 40a:	66 90                	xchg   %ax,%ax
 40c:	66 90                	xchg   %ax,%ax
 40e:	66 90                	xchg   %ax,%ax

00000410 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	53                   	push   %ebx
 416:	89 c6                	mov    %eax,%esi
 418:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 41b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 41e:	85 db                	test   %ebx,%ebx
 420:	74 7e                	je     4a0 <printint+0x90>
 422:	89 d0                	mov    %edx,%eax
 424:	c1 e8 1f             	shr    $0x1f,%eax
 427:	84 c0                	test   %al,%al
 429:	74 75                	je     4a0 <printint+0x90>
    neg = 1;
    x = -xx;
 42b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 42d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 434:	f7 d8                	neg    %eax
 436:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 439:	31 ff                	xor    %edi,%edi
 43b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 43e:	89 ce                	mov    %ecx,%esi
 440:	eb 08                	jmp    44a <printint+0x3a>
 442:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 448:	89 cf                	mov    %ecx,%edi
 44a:	31 d2                	xor    %edx,%edx
 44c:	8d 4f 01             	lea    0x1(%edi),%ecx
 44f:	f7 f6                	div    %esi
 451:	0f b6 92 0c 08 00 00 	movzbl 0x80c(%edx),%edx
  }while((x /= base) != 0);
 458:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 45a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 45d:	75 e9                	jne    448 <printint+0x38>
  if(neg)
 45f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 462:	8b 75 c0             	mov    -0x40(%ebp),%esi
 465:	85 c0                	test   %eax,%eax
 467:	74 08                	je     471 <printint+0x61>
    buf[i++] = '-';
 469:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 46e:	8d 4f 02             	lea    0x2(%edi),%ecx
 471:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 475:	8d 76 00             	lea    0x0(%esi),%esi
 478:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 47b:	83 ec 04             	sub    $0x4,%esp
 47e:	83 ef 01             	sub    $0x1,%edi
 481:	6a 01                	push   $0x1
 483:	53                   	push   %ebx
 484:	56                   	push   %esi
 485:	88 45 d7             	mov    %al,-0x29(%ebp)
 488:	e8 f5 fe ff ff       	call   382 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 48d:	83 c4 10             	add    $0x10,%esp
 490:	39 df                	cmp    %ebx,%edi
 492:	75 e4                	jne    478 <printint+0x68>
    putc(fd, buf[i]);
}
 494:	8d 65 f4             	lea    -0xc(%ebp),%esp
 497:	5b                   	pop    %ebx
 498:	5e                   	pop    %esi
 499:	5f                   	pop    %edi
 49a:	5d                   	pop    %ebp
 49b:	c3                   	ret    
 49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4a0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4a2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4a9:	eb 8b                	jmp    436 <printint+0x26>
 4ab:	90                   	nop
 4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004b0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4b6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4b9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4bc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4bf:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4c2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4c5:	0f b6 1e             	movzbl (%esi),%ebx
 4c8:	83 c6 01             	add    $0x1,%esi
 4cb:	84 db                	test   %bl,%bl
 4cd:	0f 84 b0 00 00 00    	je     583 <printf+0xd3>
 4d3:	31 d2                	xor    %edx,%edx
 4d5:	eb 39                	jmp    510 <printf+0x60>
 4d7:	89 f6                	mov    %esi,%esi
 4d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4e0:	83 f8 25             	cmp    $0x25,%eax
 4e3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 4e6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4eb:	74 18                	je     505 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4ed:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 4f0:	83 ec 04             	sub    $0x4,%esp
 4f3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 4f6:	6a 01                	push   $0x1
 4f8:	50                   	push   %eax
 4f9:	57                   	push   %edi
 4fa:	e8 83 fe ff ff       	call   382 <write>
 4ff:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 502:	83 c4 10             	add    $0x10,%esp
 505:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 508:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 50c:	84 db                	test   %bl,%bl
 50e:	74 73                	je     583 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 510:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 512:	0f be cb             	movsbl %bl,%ecx
 515:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 518:	74 c6                	je     4e0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 51a:	83 fa 25             	cmp    $0x25,%edx
 51d:	75 e6                	jne    505 <printf+0x55>
      if(c == 'd'){
 51f:	83 f8 64             	cmp    $0x64,%eax
 522:	0f 84 f8 00 00 00    	je     620 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 528:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 52e:	83 f9 70             	cmp    $0x70,%ecx
 531:	74 5d                	je     590 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 533:	83 f8 73             	cmp    $0x73,%eax
 536:	0f 84 84 00 00 00    	je     5c0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 53c:	83 f8 63             	cmp    $0x63,%eax
 53f:	0f 84 ea 00 00 00    	je     62f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 545:	83 f8 25             	cmp    $0x25,%eax
 548:	0f 84 c2 00 00 00    	je     610 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 54e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 551:	83 ec 04             	sub    $0x4,%esp
 554:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 558:	6a 01                	push   $0x1
 55a:	50                   	push   %eax
 55b:	57                   	push   %edi
 55c:	e8 21 fe ff ff       	call   382 <write>
 561:	83 c4 0c             	add    $0xc,%esp
 564:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 567:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 56a:	6a 01                	push   $0x1
 56c:	50                   	push   %eax
 56d:	57                   	push   %edi
 56e:	83 c6 01             	add    $0x1,%esi
 571:	e8 0c fe ff ff       	call   382 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 576:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 57a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 57d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 57f:	84 db                	test   %bl,%bl
 581:	75 8d                	jne    510 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 583:	8d 65 f4             	lea    -0xc(%ebp),%esp
 586:	5b                   	pop    %ebx
 587:	5e                   	pop    %esi
 588:	5f                   	pop    %edi
 589:	5d                   	pop    %ebp
 58a:	c3                   	ret    
 58b:	90                   	nop
 58c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 590:	83 ec 0c             	sub    $0xc,%esp
 593:	b9 10 00 00 00       	mov    $0x10,%ecx
 598:	6a 00                	push   $0x0
 59a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 59d:	89 f8                	mov    %edi,%eax
 59f:	8b 13                	mov    (%ebx),%edx
 5a1:	e8 6a fe ff ff       	call   410 <printint>
        ap++;
 5a6:	89 d8                	mov    %ebx,%eax
 5a8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5ab:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 5ad:	83 c0 04             	add    $0x4,%eax
 5b0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5b3:	e9 4d ff ff ff       	jmp    505 <printf+0x55>
 5b8:	90                   	nop
 5b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 5c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5c3:	8b 18                	mov    (%eax),%ebx
        ap++;
 5c5:	83 c0 04             	add    $0x4,%eax
 5c8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 5cb:	b8 03 08 00 00       	mov    $0x803,%eax
 5d0:	85 db                	test   %ebx,%ebx
 5d2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 5d5:	0f b6 03             	movzbl (%ebx),%eax
 5d8:	84 c0                	test   %al,%al
 5da:	74 23                	je     5ff <printf+0x14f>
 5dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5e0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5e3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 5e6:	83 ec 04             	sub    $0x4,%esp
 5e9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 5eb:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5ee:	50                   	push   %eax
 5ef:	57                   	push   %edi
 5f0:	e8 8d fd ff ff       	call   382 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5f5:	0f b6 03             	movzbl (%ebx),%eax
 5f8:	83 c4 10             	add    $0x10,%esp
 5fb:	84 c0                	test   %al,%al
 5fd:	75 e1                	jne    5e0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5ff:	31 d2                	xor    %edx,%edx
 601:	e9 ff fe ff ff       	jmp    505 <printf+0x55>
 606:	8d 76 00             	lea    0x0(%esi),%esi
 609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 610:	83 ec 04             	sub    $0x4,%esp
 613:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 616:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 619:	6a 01                	push   $0x1
 61b:	e9 4c ff ff ff       	jmp    56c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 620:	83 ec 0c             	sub    $0xc,%esp
 623:	b9 0a 00 00 00       	mov    $0xa,%ecx
 628:	6a 01                	push   $0x1
 62a:	e9 6b ff ff ff       	jmp    59a <printf+0xea>
 62f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 632:	83 ec 04             	sub    $0x4,%esp
 635:	8b 03                	mov    (%ebx),%eax
 637:	6a 01                	push   $0x1
 639:	88 45 e4             	mov    %al,-0x1c(%ebp)
 63c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 63f:	50                   	push   %eax
 640:	57                   	push   %edi
 641:	e8 3c fd ff ff       	call   382 <write>
 646:	e9 5b ff ff ff       	jmp    5a6 <printf+0xf6>
 64b:	66 90                	xchg   %ax,%ax
 64d:	66 90                	xchg   %ax,%ax
 64f:	90                   	nop

00000650 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 650:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 651:	a1 dc 0a 00 00       	mov    0xadc,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 656:	89 e5                	mov    %esp,%ebp
 658:	57                   	push   %edi
 659:	56                   	push   %esi
 65a:	53                   	push   %ebx
 65b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 65e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 660:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 663:	39 c8                	cmp    %ecx,%eax
 665:	73 19                	jae    680 <free+0x30>
 667:	89 f6                	mov    %esi,%esi
 669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 670:	39 d1                	cmp    %edx,%ecx
 672:	72 1c                	jb     690 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 674:	39 d0                	cmp    %edx,%eax
 676:	73 18                	jae    690 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 678:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 67a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 67c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 67e:	72 f0                	jb     670 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 680:	39 d0                	cmp    %edx,%eax
 682:	72 f4                	jb     678 <free+0x28>
 684:	39 d1                	cmp    %edx,%ecx
 686:	73 f0                	jae    678 <free+0x28>
 688:	90                   	nop
 689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 690:	8b 73 fc             	mov    -0x4(%ebx),%esi
 693:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 696:	39 d7                	cmp    %edx,%edi
 698:	74 19                	je     6b3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 69a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 69d:	8b 50 04             	mov    0x4(%eax),%edx
 6a0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6a3:	39 f1                	cmp    %esi,%ecx
 6a5:	74 23                	je     6ca <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6a7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6a9:	a3 dc 0a 00 00       	mov    %eax,0xadc
}
 6ae:	5b                   	pop    %ebx
 6af:	5e                   	pop    %esi
 6b0:	5f                   	pop    %edi
 6b1:	5d                   	pop    %ebp
 6b2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 6b3:	03 72 04             	add    0x4(%edx),%esi
 6b6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6b9:	8b 10                	mov    (%eax),%edx
 6bb:	8b 12                	mov    (%edx),%edx
 6bd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6c0:	8b 50 04             	mov    0x4(%eax),%edx
 6c3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6c6:	39 f1                	cmp    %esi,%ecx
 6c8:	75 dd                	jne    6a7 <free+0x57>
    p->s.size += bp->s.size;
 6ca:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 6cd:	a3 dc 0a 00 00       	mov    %eax,0xadc
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 6d2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6d5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6d8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6da:	5b                   	pop    %ebx
 6db:	5e                   	pop    %esi
 6dc:	5f                   	pop    %edi
 6dd:	5d                   	pop    %ebp
 6de:	c3                   	ret    
 6df:	90                   	nop

000006e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	57                   	push   %edi
 6e4:	56                   	push   %esi
 6e5:	53                   	push   %ebx
 6e6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6ec:	8b 15 dc 0a 00 00    	mov    0xadc,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6f2:	8d 78 07             	lea    0x7(%eax),%edi
 6f5:	c1 ef 03             	shr    $0x3,%edi
 6f8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 6fb:	85 d2                	test   %edx,%edx
 6fd:	0f 84 a3 00 00 00    	je     7a6 <malloc+0xc6>
 703:	8b 02                	mov    (%edx),%eax
 705:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 708:	39 cf                	cmp    %ecx,%edi
 70a:	76 74                	jbe    780 <malloc+0xa0>
 70c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 712:	be 00 10 00 00       	mov    $0x1000,%esi
 717:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 71e:	0f 43 f7             	cmovae %edi,%esi
 721:	ba 00 80 00 00       	mov    $0x8000,%edx
 726:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 72c:	0f 46 da             	cmovbe %edx,%ebx
 72f:	eb 10                	jmp    741 <malloc+0x61>
 731:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 738:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 73a:	8b 48 04             	mov    0x4(%eax),%ecx
 73d:	39 cf                	cmp    %ecx,%edi
 73f:	76 3f                	jbe    780 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 741:	39 05 dc 0a 00 00    	cmp    %eax,0xadc
 747:	89 c2                	mov    %eax,%edx
 749:	75 ed                	jne    738 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 74b:	83 ec 0c             	sub    $0xc,%esp
 74e:	53                   	push   %ebx
 74f:	e8 96 fc ff ff       	call   3ea <sbrk>
  if(p == (char*)-1)
 754:	83 c4 10             	add    $0x10,%esp
 757:	83 f8 ff             	cmp    $0xffffffff,%eax
 75a:	74 1c                	je     778 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 75c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 75f:	83 ec 0c             	sub    $0xc,%esp
 762:	83 c0 08             	add    $0x8,%eax
 765:	50                   	push   %eax
 766:	e8 e5 fe ff ff       	call   650 <free>
  return freep;
 76b:	8b 15 dc 0a 00 00    	mov    0xadc,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 771:	83 c4 10             	add    $0x10,%esp
 774:	85 d2                	test   %edx,%edx
 776:	75 c0                	jne    738 <malloc+0x58>
        return 0;
 778:	31 c0                	xor    %eax,%eax
 77a:	eb 1c                	jmp    798 <malloc+0xb8>
 77c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 780:	39 cf                	cmp    %ecx,%edi
 782:	74 1c                	je     7a0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 784:	29 f9                	sub    %edi,%ecx
 786:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 789:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 78c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 78f:	89 15 dc 0a 00 00    	mov    %edx,0xadc
      return (void*)(p + 1);
 795:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 798:	8d 65 f4             	lea    -0xc(%ebp),%esp
 79b:	5b                   	pop    %ebx
 79c:	5e                   	pop    %esi
 79d:	5f                   	pop    %edi
 79e:	5d                   	pop    %ebp
 79f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 7a0:	8b 08                	mov    (%eax),%ecx
 7a2:	89 0a                	mov    %ecx,(%edx)
 7a4:	eb e9                	jmp    78f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 7a6:	c7 05 dc 0a 00 00 e0 	movl   $0xae0,0xadc
 7ad:	0a 00 00 
 7b0:	c7 05 e0 0a 00 00 e0 	movl   $0xae0,0xae0
 7b7:	0a 00 00 
    base.s.size = 0;
 7ba:	b8 e0 0a 00 00       	mov    $0xae0,%eax
 7bf:	c7 05 e4 0a 00 00 00 	movl   $0x0,0xae4
 7c6:	00 00 00 
 7c9:	e9 3e ff ff ff       	jmp    70c <malloc+0x2c>

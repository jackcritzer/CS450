
_lseekTest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
void printFile(int fd);
void testOffsetRead(int fd, int offset);
void testOffsetWrite(int fd, int offset);

int
main(void) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 10             	sub    $0x10,%esp

    // test pointer-based file

    testFile(PTR_FILE);
  11:	6a 01                	push   $0x1
  13:	e8 78 01 00 00       	call   190 <testFile>
  18:	66 90                	xchg   %ax,%ax
  1a:	66 90                	xchg   %ax,%ax
  1c:	66 90                	xchg   %ax,%ax
  1e:	66 90                	xchg   %ax,%ax

00000020 <printFile>:
}


// prints contents of file from its current offset
void
printFile(int fd) {
  20:	55                   	push   %ebp
  21:	89 e5                	mov    %esp,%ebp
  23:	57                   	push   %edi
  24:	56                   	push   %esi
  25:	53                   	push   %ebx
  26:	83 ec 14             	sub    $0x14,%esp
  29:	8b 7d 08             	mov    0x8(%ebp),%edi
    testNum++;
  2c:	83 05 00 10 00 00 01 	addl   $0x1,0x1000

    printf(1, "\nPrint result: ");
  33:	68 a0 09 00 00       	push   $0x9a0
  38:	6a 01                	push   $0x1
  3a:	e8 41 06 00 00       	call   680 <printf>

    int n, i;
    while((n = read(fd, inbuf, sizeof(inbuf))) > 0) {
  3f:	83 c4 10             	add    $0x10,%esp
  42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  48:	83 ec 04             	sub    $0x4,%esp
  4b:	68 00 02 00 00       	push   $0x200
  50:	68 20 10 00 00       	push   $0x1020
  55:	57                   	push   %edi
  56:	e8 df 04 00 00       	call   53a <read>
  5b:	83 c4 10             	add    $0x10,%esp
  5e:	85 c0                	test   %eax,%eax
  60:	89 c6                	mov    %eax,%esi
  62:	7e 33                	jle    97 <printFile+0x77>
  64:	31 db                	xor    %ebx,%ebx
  66:	8d 76 00             	lea    0x0(%esi),%esi
  69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        for(i=0;i<=n ;i++){			//print the characters in the line 
            if(inbuf[i]!='\n'){			
  70:	0f be 83 20 10 00 00 	movsbl 0x1020(%ebx),%eax
  77:	3c 0a                	cmp    $0xa,%al
  79:	74 13                	je     8e <printFile+0x6e>
      	        printf(1,"%c",inbuf[i]);
  7b:	83 ec 04             	sub    $0x4,%esp
  7e:	50                   	push   %eax
  7f:	68 b0 09 00 00       	push   $0x9b0
  84:	6a 01                	push   $0x1
  86:	e8 f5 05 00 00       	call   680 <printf>
  8b:	83 c4 10             	add    $0x10,%esp

    printf(1, "\nPrint result: ");

    int n, i;
    while((n = read(fd, inbuf, sizeof(inbuf))) > 0) {
        for(i=0;i<=n ;i++){			//print the characters in the line 
  8e:	83 c3 01             	add    $0x1,%ebx
  91:	39 de                	cmp    %ebx,%esi
  93:	7d db                	jge    70 <printFile+0x50>
  95:	eb b1                	jmp    48 <printFile+0x28>
        if(n<0){
            printf(1, "read error\n");
            exit();
        }
    }
    printf(1, "\n\n");
  97:	83 ec 08             	sub    $0x8,%esp
  9a:	68 46 0a 00 00       	push   $0xa46
  9f:	6a 01                	push   $0x1
  a1:	e8 da 05 00 00       	call   680 <printf>
  a6:	83 c4 10             	add    $0x10,%esp
  a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ac:	5b                   	pop    %ebx
  ad:	5e                   	pop    %esi
  ae:	5f                   	pop    %edi
  af:	5d                   	pop    %ebp
  b0:	c3                   	ret    
  b1:	eb 0d                	jmp    c0 <testOffsetRead>
  b3:	90                   	nop
  b4:	90                   	nop
  b5:	90                   	nop
  b6:	90                   	nop
  b7:	90                   	nop
  b8:	90                   	nop
  b9:	90                   	nop
  ba:	90                   	nop
  bb:	90                   	nop
  bc:	90                   	nop
  bd:	90                   	nop
  be:	90                   	nop
  bf:	90                   	nop

000000c0 <testOffsetRead>:

    exit();
}

void
testOffsetRead(int fd, int offset) {
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	56                   	push   %esi
  c4:	53                   	push   %ebx
  c5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  c8:	8b 75 08             	mov    0x8(%ebp),%esi
    int result = -1;

    printf(1, "Test offset: %d\n", offset);
  cb:	83 ec 04             	sub    $0x4,%esp
  ce:	53                   	push   %ebx
  cf:	68 b3 09 00 00       	push   $0x9b3
  d4:	6a 01                	push   $0x1
  d6:	e8 a5 05 00 00       	call   680 <printf>

    if((result = lseek(fd, offset)) != -1) printFile(fd);
  db:	58                   	pop    %eax
  dc:	5a                   	pop    %edx
  dd:	53                   	push   %ebx
  de:	56                   	push   %esi
  df:	e8 ee 04 00 00       	call   5d2 <lseek>
  e4:	83 c4 10             	add    $0x10,%esp
  e7:	83 f8 ff             	cmp    $0xffffffff,%eax
  ea:	74 14                	je     100 <testOffsetRead+0x40>
  ec:	89 75 08             	mov    %esi,0x8(%ebp)
}
  ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
  f2:	5b                   	pop    %ebx
  f3:	5e                   	pop    %esi
  f4:	5d                   	pop    %ebp
testOffsetRead(int fd, int offset) {
    int result = -1;

    printf(1, "Test offset: %d\n", offset);

    if((result = lseek(fd, offset)) != -1) printFile(fd);
  f5:	e9 26 ff ff ff       	jmp    20 <printFile>
  fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
}
 100:	8d 65 f8             	lea    -0x8(%ebp),%esp
 103:	5b                   	pop    %ebx
 104:	5e                   	pop    %esi
 105:	5d                   	pop    %ebp
 106:	c3                   	ret    
 107:	89 f6                	mov    %esi,%esi
 109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000110 <testOffsetWrite>:

void testOffsetWrite(int fd, int offset) {
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	56                   	push   %esi
 114:	53                   	push   %ebx
 115:	8b 75 0c             	mov    0xc(%ebp),%esi
 118:	8b 5d 08             	mov    0x8(%ebp),%ebx
    int result = -1;
    printf(1, "Test offset: %d\n", offset);
 11b:	83 ec 04             	sub    $0x4,%esp
 11e:	56                   	push   %esi
 11f:	68 b3 09 00 00       	push   $0x9b3
 124:	6a 01                	push   $0x1
 126:	e8 55 05 00 00       	call   680 <printf>
    
    if((result = lseek(fd, offset)) != -1) {
 12b:	59                   	pop    %ecx
 12c:	58                   	pop    %eax
 12d:	56                   	push   %esi
 12e:	53                   	push   %ebx
 12f:	e8 9e 04 00 00       	call   5d2 <lseek>
 134:	83 c4 10             	add    $0x10,%esp
 137:	83 f8 ff             	cmp    $0xffffffff,%eax
 13a:	74 44                	je     180 <testOffsetWrite+0x70>
        printf(1, "\nWriting to file\n");
 13c:	83 ec 08             	sub    $0x8,%esp
 13f:	68 c4 09 00 00       	push   $0x9c4
 144:	6a 01                	push   $0x1
 146:	e8 35 05 00 00       	call   680 <printf>
        write(fd, "..", 2);
 14b:	83 c4 0c             	add    $0xc,%esp
 14e:	6a 02                	push   $0x2
 150:	68 d6 09 00 00       	push   $0x9d6
 155:	53                   	push   %ebx
 156:	e8 e7 03 00 00       	call   542 <write>
        lseek(fd, 0);
 15b:	58                   	pop    %eax
 15c:	5a                   	pop    %edx
 15d:	6a 00                	push   $0x0
 15f:	53                   	push   %ebx
 160:	e8 6d 04 00 00       	call   5d2 <lseek>
        printFile(fd);
 165:	89 5d 08             	mov    %ebx,0x8(%ebp)
 168:	83 c4 10             	add    $0x10,%esp
    }
}
 16b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 16e:	5b                   	pop    %ebx
 16f:	5e                   	pop    %esi
 170:	5d                   	pop    %ebp
    
    if((result = lseek(fd, offset)) != -1) {
        printf(1, "\nWriting to file\n");
        write(fd, "..", 2);
        lseek(fd, 0);
        printFile(fd);
 171:	e9 aa fe ff ff       	jmp    20 <printFile>
 176:	8d 76 00             	lea    0x0(%esi),%esi
 179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    }
}
 180:	8d 65 f8             	lea    -0x8(%ebp),%esp
 183:	5b                   	pop    %ebx
 184:	5e                   	pop    %esi
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    
 187:	89 f6                	mov    %esi,%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <testFile>:

    return 0;
}

void
testFile(int type) {
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	56                   	push   %esi
 194:	53                   	push   %ebx
 195:	83 ec 20             	sub    $0x20,%esp
 198:	8b 45 08             	mov    0x8(%ebp),%eax
    int fd = -1;

    switch(type) {
 19b:	83 f8 01             	cmp    $0x1,%eax
 19e:	0f 84 c0 00 00 00    	je     264 <testFile+0xd4>
 1a4:	83 f8 02             	cmp    $0x2,%eax
 1a7:	0f 84 8a 00 00 00    	je     237 <testFile+0xa7>
    return 0;
}

void
testFile(int type) {
    int fd = -1;
 1ad:	83 ce ff             	or     $0xffffffff,%esi
        }

    int offsetArr[5] = {-10, 525, 0, 5, 10};
    int i = 0;

    printf(1, "READ TEST\n\n");
 1b0:	52                   	push   %edx
 1b1:	52                   	push   %edx
    for(i = 0; i < 5; i++) {
 1b2:	31 db                	xor    %ebx,%ebx
        }

    int offsetArr[5] = {-10, 525, 0, 5, 10};
    int i = 0;

    printf(1, "READ TEST\n\n");
 1b4:	68 49 0a 00 00       	push   $0xa49
 1b9:	6a 01                	push   $0x1
            //write(fd, buf, sizeof(buf));
            printf(1, "\nText \"%s\" written to %s\n\n", buf, efname);
            exit();
        }

    int offsetArr[5] = {-10, 525, 0, 5, 10};
 1bb:	c7 45 e4 f6 ff ff ff 	movl   $0xfffffff6,-0x1c(%ebp)
 1c2:	c7 45 e8 0d 02 00 00 	movl   $0x20d,-0x18(%ebp)
 1c9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 1d0:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
 1d7:	c7 45 f4 0a 00 00 00 	movl   $0xa,-0xc(%ebp)
    int i = 0;

    printf(1, "READ TEST\n\n");
 1de:	e8 9d 04 00 00       	call   680 <printf>
 1e3:	83 c4 10             	add    $0x10,%esp
    for(i = 0; i < 5; i++) {
        testOffsetRead(fd, offsetArr[i]);
 1e6:	83 ec 08             	sub    $0x8,%esp
 1e9:	ff 74 9d e4          	pushl  -0x1c(%ebp,%ebx,4)

    int offsetArr[5] = {-10, 525, 0, 5, 10};
    int i = 0;

    printf(1, "READ TEST\n\n");
    for(i = 0; i < 5; i++) {
 1ed:	83 c3 01             	add    $0x1,%ebx
        testOffsetRead(fd, offsetArr[i]);
 1f0:	56                   	push   %esi
 1f1:	e8 ca fe ff ff       	call   c0 <testOffsetRead>

    int offsetArr[5] = {-10, 525, 0, 5, 10};
    int i = 0;

    printf(1, "READ TEST\n\n");
    for(i = 0; i < 5; i++) {
 1f6:	83 c4 10             	add    $0x10,%esp
 1f9:	83 fb 05             	cmp    $0x5,%ebx
 1fc:	75 e8                	jne    1e6 <testFile+0x56>
        testOffsetRead(fd, offsetArr[i]);
    }

    printf(1, "WRITE TEST\n\n");
 1fe:	50                   	push   %eax
 1ff:	50                   	push   %eax
    for(i = 0; i < 5; i++) {
 200:	31 db                	xor    %ebx,%ebx
    printf(1, "READ TEST\n\n");
    for(i = 0; i < 5; i++) {
        testOffsetRead(fd, offsetArr[i]);
    }

    printf(1, "WRITE TEST\n\n");
 202:	68 55 0a 00 00       	push   $0xa55
 207:	6a 01                	push   $0x1
 209:	e8 72 04 00 00       	call   680 <printf>
 20e:	83 c4 10             	add    $0x10,%esp
    for(i = 0; i < 5; i++) {
        testOffsetWrite(fd, offsetArr[i]);
 211:	83 ec 08             	sub    $0x8,%esp
 214:	ff 74 9d e4          	pushl  -0x1c(%ebp,%ebx,4)
    for(i = 0; i < 5; i++) {
        testOffsetRead(fd, offsetArr[i]);
    }

    printf(1, "WRITE TEST\n\n");
    for(i = 0; i < 5; i++) {
 218:	83 c3 01             	add    $0x1,%ebx
        testOffsetWrite(fd, offsetArr[i]);
 21b:	56                   	push   %esi
 21c:	e8 ef fe ff ff       	call   110 <testOffsetWrite>
    for(i = 0; i < 5; i++) {
        testOffsetRead(fd, offsetArr[i]);
    }

    printf(1, "WRITE TEST\n\n");
    for(i = 0; i < 5; i++) {
 221:	83 c4 10             	add    $0x10,%esp
 224:	83 fb 05             	cmp    $0x5,%ebx
 227:	75 e8                	jne    211 <testFile+0x81>
        testOffsetWrite(fd, offsetArr[i]);
    }

    close(fd);
 229:	83 ec 0c             	sub    $0xc,%esp
 22c:	56                   	push   %esi
 22d:	e8 18 03 00 00       	call   54a <close>

    exit();
 232:	e8 eb 02 00 00       	call   522 <exit>
            /* fd = open(efname, O_CREATE | O_RDWR | O_EXTENT); */
            /* if (fd <= 0){
                printf(1, "file could not be opened\n");
                exit();
            } */
            printf(1, "TESTING EXTENT-BASED FILE:\n\n");
 237:	51                   	push   %ecx
 238:	51                   	push   %ecx
 239:	68 2c 0a 00 00       	push   $0xa2c
 23e:	6a 01                	push   $0x1
 240:	e8 3b 04 00 00       	call   680 <printf>

            //write(fd, buf, sizeof(buf));
            printf(1, "\nText \"%s\" written to %s\n\n", buf, efname);
 245:	ff 35 e0 0f 00 00    	pushl  0xfe0
 24b:	68 e0 0d 00 00       	push   $0xde0
 250:	68 11 0a 00 00       	push   $0xa11
 255:	6a 01                	push   $0x1
 257:	e8 24 04 00 00       	call   680 <printf>
            exit();
 25c:	83 c4 20             	add    $0x20,%esp
 25f:	e8 be 02 00 00       	call   522 <exit>
testFile(int type) {
    int fd = -1;

    switch(type) {
        case PTR_FILE:
            fd = open(pfname, O_CREATE | O_RDWR);
 264:	50                   	push   %eax
 265:	50                   	push   %eax
 266:	68 02 02 00 00       	push   $0x202
 26b:	ff 35 e4 0f 00 00    	pushl  0xfe4
 271:	e8 ec 02 00 00       	call   562 <open>
            if (fd <= 0){
 276:	83 c4 10             	add    $0x10,%esp
 279:	85 c0                	test   %eax,%eax
testFile(int type) {
    int fd = -1;

    switch(type) {
        case PTR_FILE:
            fd = open(pfname, O_CREATE | O_RDWR);
 27b:	89 c6                	mov    %eax,%esi
            if (fd <= 0){
 27d:	7e 40                	jle    2bf <testFile+0x12f>
                printf(1, "file could not be opened\n");
                exit();
            }
            printf(1, "\nTESTING POINTER-BASED FILE:\n");
 27f:	53                   	push   %ebx
 280:	53                   	push   %ebx
 281:	68 f3 09 00 00       	push   $0x9f3
 286:	6a 01                	push   $0x1
 288:	e8 f3 03 00 00       	call   680 <printf>

            write(fd, buf, sizeof(buf));
 28d:	83 c4 0c             	add    $0xc,%esp
 290:	68 00 02 00 00       	push   $0x200
 295:	68 e0 0d 00 00       	push   $0xde0
 29a:	56                   	push   %esi
 29b:	e8 a2 02 00 00       	call   542 <write>
            printf(1, "\nText \"%s\" written to %s\n\n", buf, pfname);
 2a0:	ff 35 e4 0f 00 00    	pushl  0xfe4
 2a6:	68 e0 0d 00 00       	push   $0xde0
 2ab:	68 11 0a 00 00       	push   $0xa11
 2b0:	6a 01                	push   $0x1
 2b2:	e8 c9 03 00 00       	call   680 <printf>
            break;
 2b7:	83 c4 20             	add    $0x20,%esp
 2ba:	e9 f1 fe ff ff       	jmp    1b0 <testFile+0x20>

    switch(type) {
        case PTR_FILE:
            fd = open(pfname, O_CREATE | O_RDWR);
            if (fd <= 0){
                printf(1, "file could not be opened\n");
 2bf:	56                   	push   %esi
 2c0:	56                   	push   %esi
 2c1:	68 d9 09 00 00       	push   $0x9d9
 2c6:	6a 01                	push   $0x1
 2c8:	e8 b3 03 00 00       	call   680 <printf>
                exit();
 2cd:	e8 50 02 00 00       	call   522 <exit>
 2d2:	66 90                	xchg   %ax,%ax
 2d4:	66 90                	xchg   %ax,%ax
 2d6:	66 90                	xchg   %ax,%ax
 2d8:	66 90                	xchg   %ax,%ax
 2da:	66 90                	xchg   %ax,%ax
 2dc:	66 90                	xchg   %ax,%ax
 2de:	66 90                	xchg   %ax,%ax

000002e0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	53                   	push   %ebx
 2e4:	8b 45 08             	mov    0x8(%ebp),%eax
 2e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2ea:	89 c2                	mov    %eax,%edx
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2f0:	83 c1 01             	add    $0x1,%ecx
 2f3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 2f7:	83 c2 01             	add    $0x1,%edx
 2fa:	84 db                	test   %bl,%bl
 2fc:	88 5a ff             	mov    %bl,-0x1(%edx)
 2ff:	75 ef                	jne    2f0 <strcpy+0x10>
    ;
  return os;
}
 301:	5b                   	pop    %ebx
 302:	5d                   	pop    %ebp
 303:	c3                   	ret    
 304:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 30a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000310 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	56                   	push   %esi
 314:	53                   	push   %ebx
 315:	8b 55 08             	mov    0x8(%ebp),%edx
 318:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 31b:	0f b6 02             	movzbl (%edx),%eax
 31e:	0f b6 19             	movzbl (%ecx),%ebx
 321:	84 c0                	test   %al,%al
 323:	75 1e                	jne    343 <strcmp+0x33>
 325:	eb 29                	jmp    350 <strcmp+0x40>
 327:	89 f6                	mov    %esi,%esi
 329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 330:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 333:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 336:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 339:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 33d:	84 c0                	test   %al,%al
 33f:	74 0f                	je     350 <strcmp+0x40>
 341:	89 f1                	mov    %esi,%ecx
 343:	38 d8                	cmp    %bl,%al
 345:	74 e9                	je     330 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 347:	29 d8                	sub    %ebx,%eax
}
 349:	5b                   	pop    %ebx
 34a:	5e                   	pop    %esi
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    
 34d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 350:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 352:	29 d8                	sub    %ebx,%eax
}
 354:	5b                   	pop    %ebx
 355:	5e                   	pop    %esi
 356:	5d                   	pop    %ebp
 357:	c3                   	ret    
 358:	90                   	nop
 359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000360 <strlen>:

uint
strlen(const char *s)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 366:	80 39 00             	cmpb   $0x0,(%ecx)
 369:	74 12                	je     37d <strlen+0x1d>
 36b:	31 d2                	xor    %edx,%edx
 36d:	8d 76 00             	lea    0x0(%esi),%esi
 370:	83 c2 01             	add    $0x1,%edx
 373:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 377:	89 d0                	mov    %edx,%eax
 379:	75 f5                	jne    370 <strlen+0x10>
    ;
  return n;
}
 37b:	5d                   	pop    %ebp
 37c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 37d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 37f:	5d                   	pop    %ebp
 380:	c3                   	ret    
 381:	eb 0d                	jmp    390 <memset>
 383:	90                   	nop
 384:	90                   	nop
 385:	90                   	nop
 386:	90                   	nop
 387:	90                   	nop
 388:	90                   	nop
 389:	90                   	nop
 38a:	90                   	nop
 38b:	90                   	nop
 38c:	90                   	nop
 38d:	90                   	nop
 38e:	90                   	nop
 38f:	90                   	nop

00000390 <memset>:

void*
memset(void *dst, int c, uint n)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	57                   	push   %edi
 394:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 397:	8b 4d 10             	mov    0x10(%ebp),%ecx
 39a:	8b 45 0c             	mov    0xc(%ebp),%eax
 39d:	89 d7                	mov    %edx,%edi
 39f:	fc                   	cld    
 3a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3a2:	89 d0                	mov    %edx,%eax
 3a4:	5f                   	pop    %edi
 3a5:	5d                   	pop    %ebp
 3a6:	c3                   	ret    
 3a7:	89 f6                	mov    %esi,%esi
 3a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003b0 <strchr>:

char*
strchr(const char *s, char c)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	53                   	push   %ebx
 3b4:	8b 45 08             	mov    0x8(%ebp),%eax
 3b7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 3ba:	0f b6 10             	movzbl (%eax),%edx
 3bd:	84 d2                	test   %dl,%dl
 3bf:	74 1d                	je     3de <strchr+0x2e>
    if(*s == c)
 3c1:	38 d3                	cmp    %dl,%bl
 3c3:	89 d9                	mov    %ebx,%ecx
 3c5:	75 0d                	jne    3d4 <strchr+0x24>
 3c7:	eb 17                	jmp    3e0 <strchr+0x30>
 3c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3d0:	38 ca                	cmp    %cl,%dl
 3d2:	74 0c                	je     3e0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 3d4:	83 c0 01             	add    $0x1,%eax
 3d7:	0f b6 10             	movzbl (%eax),%edx
 3da:	84 d2                	test   %dl,%dl
 3dc:	75 f2                	jne    3d0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 3de:	31 c0                	xor    %eax,%eax
}
 3e0:	5b                   	pop    %ebx
 3e1:	5d                   	pop    %ebp
 3e2:	c3                   	ret    
 3e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003f0 <gets>:

char*
gets(char *buf, int max)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	56                   	push   %esi
 3f5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3f6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 3f8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 3fb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3fe:	eb 29                	jmp    429 <gets+0x39>
    cc = read(0, &c, 1);
 400:	83 ec 04             	sub    $0x4,%esp
 403:	6a 01                	push   $0x1
 405:	57                   	push   %edi
 406:	6a 00                	push   $0x0
 408:	e8 2d 01 00 00       	call   53a <read>
    if(cc < 1)
 40d:	83 c4 10             	add    $0x10,%esp
 410:	85 c0                	test   %eax,%eax
 412:	7e 1d                	jle    431 <gets+0x41>
      break;
    buf[i++] = c;
 414:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 418:	8b 55 08             	mov    0x8(%ebp),%edx
 41b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 41d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 41f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 423:	74 1b                	je     440 <gets+0x50>
 425:	3c 0d                	cmp    $0xd,%al
 427:	74 17                	je     440 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 429:	8d 5e 01             	lea    0x1(%esi),%ebx
 42c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 42f:	7c cf                	jl     400 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 431:	8b 45 08             	mov    0x8(%ebp),%eax
 434:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 438:	8d 65 f4             	lea    -0xc(%ebp),%esp
 43b:	5b                   	pop    %ebx
 43c:	5e                   	pop    %esi
 43d:	5f                   	pop    %edi
 43e:	5d                   	pop    %ebp
 43f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 440:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 443:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 445:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 449:	8d 65 f4             	lea    -0xc(%ebp),%esp
 44c:	5b                   	pop    %ebx
 44d:	5e                   	pop    %esi
 44e:	5f                   	pop    %edi
 44f:	5d                   	pop    %ebp
 450:	c3                   	ret    
 451:	eb 0d                	jmp    460 <stat>
 453:	90                   	nop
 454:	90                   	nop
 455:	90                   	nop
 456:	90                   	nop
 457:	90                   	nop
 458:	90                   	nop
 459:	90                   	nop
 45a:	90                   	nop
 45b:	90                   	nop
 45c:	90                   	nop
 45d:	90                   	nop
 45e:	90                   	nop
 45f:	90                   	nop

00000460 <stat>:

int
stat(const char *n, struct stat *st)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	56                   	push   %esi
 464:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 465:	83 ec 08             	sub    $0x8,%esp
 468:	6a 00                	push   $0x0
 46a:	ff 75 08             	pushl  0x8(%ebp)
 46d:	e8 f0 00 00 00       	call   562 <open>
  if(fd < 0)
 472:	83 c4 10             	add    $0x10,%esp
 475:	85 c0                	test   %eax,%eax
 477:	78 27                	js     4a0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 479:	83 ec 08             	sub    $0x8,%esp
 47c:	ff 75 0c             	pushl  0xc(%ebp)
 47f:	89 c3                	mov    %eax,%ebx
 481:	50                   	push   %eax
 482:	e8 f3 00 00 00       	call   57a <fstat>
 487:	89 c6                	mov    %eax,%esi
  close(fd);
 489:	89 1c 24             	mov    %ebx,(%esp)
 48c:	e8 b9 00 00 00       	call   54a <close>
  return r;
 491:	83 c4 10             	add    $0x10,%esp
 494:	89 f0                	mov    %esi,%eax
}
 496:	8d 65 f8             	lea    -0x8(%ebp),%esp
 499:	5b                   	pop    %ebx
 49a:	5e                   	pop    %esi
 49b:	5d                   	pop    %ebp
 49c:	c3                   	ret    
 49d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 4a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4a5:	eb ef                	jmp    496 <stat+0x36>
 4a7:	89 f6                	mov    %esi,%esi
 4a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004b0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	53                   	push   %ebx
 4b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4b7:	0f be 11             	movsbl (%ecx),%edx
 4ba:	8d 42 d0             	lea    -0x30(%edx),%eax
 4bd:	3c 09                	cmp    $0x9,%al
 4bf:	b8 00 00 00 00       	mov    $0x0,%eax
 4c4:	77 1f                	ja     4e5 <atoi+0x35>
 4c6:	8d 76 00             	lea    0x0(%esi),%esi
 4c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 4d0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 4d3:	83 c1 01             	add    $0x1,%ecx
 4d6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4da:	0f be 11             	movsbl (%ecx),%edx
 4dd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 4e0:	80 fb 09             	cmp    $0x9,%bl
 4e3:	76 eb                	jbe    4d0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 4e5:	5b                   	pop    %ebx
 4e6:	5d                   	pop    %ebp
 4e7:	c3                   	ret    
 4e8:	90                   	nop
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	56                   	push   %esi
 4f4:	53                   	push   %ebx
 4f5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4f8:	8b 45 08             	mov    0x8(%ebp),%eax
 4fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4fe:	85 db                	test   %ebx,%ebx
 500:	7e 14                	jle    516 <memmove+0x26>
 502:	31 d2                	xor    %edx,%edx
 504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 508:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 50c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 50f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 512:	39 da                	cmp    %ebx,%edx
 514:	75 f2                	jne    508 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 516:	5b                   	pop    %ebx
 517:	5e                   	pop    %esi
 518:	5d                   	pop    %ebp
 519:	c3                   	ret    

0000051a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 51a:	b8 01 00 00 00       	mov    $0x1,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <exit>:
SYSCALL(exit)
 522:	b8 02 00 00 00       	mov    $0x2,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <wait>:
SYSCALL(wait)
 52a:	b8 03 00 00 00       	mov    $0x3,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <pipe>:
SYSCALL(pipe)
 532:	b8 04 00 00 00       	mov    $0x4,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <read>:
SYSCALL(read)
 53a:	b8 05 00 00 00       	mov    $0x5,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <write>:
SYSCALL(write)
 542:	b8 10 00 00 00       	mov    $0x10,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <close>:
SYSCALL(close)
 54a:	b8 15 00 00 00       	mov    $0x15,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <kill>:
SYSCALL(kill)
 552:	b8 06 00 00 00       	mov    $0x6,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <exec>:
SYSCALL(exec)
 55a:	b8 07 00 00 00       	mov    $0x7,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <open>:
SYSCALL(open)
 562:	b8 0f 00 00 00       	mov    $0xf,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <mknod>:
SYSCALL(mknod)
 56a:	b8 11 00 00 00       	mov    $0x11,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <unlink>:
SYSCALL(unlink)
 572:	b8 12 00 00 00       	mov    $0x12,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <fstat>:
SYSCALL(fstat)
 57a:	b8 08 00 00 00       	mov    $0x8,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <link>:
SYSCALL(link)
 582:	b8 13 00 00 00       	mov    $0x13,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <mkdir>:
SYSCALL(mkdir)
 58a:	b8 14 00 00 00       	mov    $0x14,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <chdir>:
SYSCALL(chdir)
 592:	b8 09 00 00 00       	mov    $0x9,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <dup>:
SYSCALL(dup)
 59a:	b8 0a 00 00 00       	mov    $0xa,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <getpid>:
SYSCALL(getpid)
 5a2:	b8 0b 00 00 00       	mov    $0xb,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <sbrk>:
SYSCALL(sbrk)
 5aa:	b8 0c 00 00 00       	mov    $0xc,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <sleep>:
SYSCALL(sleep)
 5b2:	b8 0d 00 00 00       	mov    $0xd,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <uptime>:
SYSCALL(uptime)
 5ba:	b8 0e 00 00 00       	mov    $0xe,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <alsonice>:
SYSCALL(alsonice)
 5c2:	b8 16 00 00 00       	mov    $0x16,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <haspages>:
SYSCALL(haspages)
 5ca:	b8 17 00 00 00       	mov    $0x17,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <lseek>:
SYSCALL(lseek)
 5d2:	b8 18 00 00 00       	mov    $0x18,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    
 5da:	66 90                	xchg   %ax,%ax
 5dc:	66 90                	xchg   %ax,%ax
 5de:	66 90                	xchg   %ax,%ax

000005e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	57                   	push   %edi
 5e4:	56                   	push   %esi
 5e5:	53                   	push   %ebx
 5e6:	89 c6                	mov    %eax,%esi
 5e8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5ee:	85 db                	test   %ebx,%ebx
 5f0:	74 7e                	je     670 <printint+0x90>
 5f2:	89 d0                	mov    %edx,%eax
 5f4:	c1 e8 1f             	shr    $0x1f,%eax
 5f7:	84 c0                	test   %al,%al
 5f9:	74 75                	je     670 <printint+0x90>
    neg = 1;
    x = -xx;
 5fb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 5fd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 604:	f7 d8                	neg    %eax
 606:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 609:	31 ff                	xor    %edi,%edi
 60b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 60e:	89 ce                	mov    %ecx,%esi
 610:	eb 08                	jmp    61a <printint+0x3a>
 612:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 618:	89 cf                	mov    %ecx,%edi
 61a:	31 d2                	xor    %edx,%edx
 61c:	8d 4f 01             	lea    0x1(%edi),%ecx
 61f:	f7 f6                	div    %esi
 621:	0f b6 92 80 0a 00 00 	movzbl 0xa80(%edx),%edx
  }while((x /= base) != 0);
 628:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 62a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 62d:	75 e9                	jne    618 <printint+0x38>
  if(neg)
 62f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 632:	8b 75 c0             	mov    -0x40(%ebp),%esi
 635:	85 c0                	test   %eax,%eax
 637:	74 08                	je     641 <printint+0x61>
    buf[i++] = '-';
 639:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 63e:	8d 4f 02             	lea    0x2(%edi),%ecx
 641:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 645:	8d 76 00             	lea    0x0(%esi),%esi
 648:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 64b:	83 ec 04             	sub    $0x4,%esp
 64e:	83 ef 01             	sub    $0x1,%edi
 651:	6a 01                	push   $0x1
 653:	53                   	push   %ebx
 654:	56                   	push   %esi
 655:	88 45 d7             	mov    %al,-0x29(%ebp)
 658:	e8 e5 fe ff ff       	call   542 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 65d:	83 c4 10             	add    $0x10,%esp
 660:	39 df                	cmp    %ebx,%edi
 662:	75 e4                	jne    648 <printint+0x68>
    putc(fd, buf[i]);
}
 664:	8d 65 f4             	lea    -0xc(%ebp),%esp
 667:	5b                   	pop    %ebx
 668:	5e                   	pop    %esi
 669:	5f                   	pop    %edi
 66a:	5d                   	pop    %ebp
 66b:	c3                   	ret    
 66c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 670:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 672:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 679:	eb 8b                	jmp    606 <printint+0x26>
 67b:	90                   	nop
 67c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000680 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	57                   	push   %edi
 684:	56                   	push   %esi
 685:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 686:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 689:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 68c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 68f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 692:	89 45 d0             	mov    %eax,-0x30(%ebp)
 695:	0f b6 1e             	movzbl (%esi),%ebx
 698:	83 c6 01             	add    $0x1,%esi
 69b:	84 db                	test   %bl,%bl
 69d:	0f 84 b0 00 00 00    	je     753 <printf+0xd3>
 6a3:	31 d2                	xor    %edx,%edx
 6a5:	eb 39                	jmp    6e0 <printf+0x60>
 6a7:	89 f6                	mov    %esi,%esi
 6a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 6b0:	83 f8 25             	cmp    $0x25,%eax
 6b3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 6b6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 6bb:	74 18                	je     6d5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6bd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 6c0:	83 ec 04             	sub    $0x4,%esp
 6c3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 6c6:	6a 01                	push   $0x1
 6c8:	50                   	push   %eax
 6c9:	57                   	push   %edi
 6ca:	e8 73 fe ff ff       	call   542 <write>
 6cf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 6d2:	83 c4 10             	add    $0x10,%esp
 6d5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6d8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 6dc:	84 db                	test   %bl,%bl
 6de:	74 73                	je     753 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 6e0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 6e2:	0f be cb             	movsbl %bl,%ecx
 6e5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6e8:	74 c6                	je     6b0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 6ea:	83 fa 25             	cmp    $0x25,%edx
 6ed:	75 e6                	jne    6d5 <printf+0x55>
      if(c == 'd'){
 6ef:	83 f8 64             	cmp    $0x64,%eax
 6f2:	0f 84 f8 00 00 00    	je     7f0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6f8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 6fe:	83 f9 70             	cmp    $0x70,%ecx
 701:	74 5d                	je     760 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 703:	83 f8 73             	cmp    $0x73,%eax
 706:	0f 84 84 00 00 00    	je     790 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 70c:	83 f8 63             	cmp    $0x63,%eax
 70f:	0f 84 ea 00 00 00    	je     7ff <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 715:	83 f8 25             	cmp    $0x25,%eax
 718:	0f 84 c2 00 00 00    	je     7e0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 71e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 721:	83 ec 04             	sub    $0x4,%esp
 724:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 728:	6a 01                	push   $0x1
 72a:	50                   	push   %eax
 72b:	57                   	push   %edi
 72c:	e8 11 fe ff ff       	call   542 <write>
 731:	83 c4 0c             	add    $0xc,%esp
 734:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 737:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 73a:	6a 01                	push   $0x1
 73c:	50                   	push   %eax
 73d:	57                   	push   %edi
 73e:	83 c6 01             	add    $0x1,%esi
 741:	e8 fc fd ff ff       	call   542 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 746:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 74a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 74d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 74f:	84 db                	test   %bl,%bl
 751:	75 8d                	jne    6e0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 753:	8d 65 f4             	lea    -0xc(%ebp),%esp
 756:	5b                   	pop    %ebx
 757:	5e                   	pop    %esi
 758:	5f                   	pop    %edi
 759:	5d                   	pop    %ebp
 75a:	c3                   	ret    
 75b:	90                   	nop
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 760:	83 ec 0c             	sub    $0xc,%esp
 763:	b9 10 00 00 00       	mov    $0x10,%ecx
 768:	6a 00                	push   $0x0
 76a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 76d:	89 f8                	mov    %edi,%eax
 76f:	8b 13                	mov    (%ebx),%edx
 771:	e8 6a fe ff ff       	call   5e0 <printint>
        ap++;
 776:	89 d8                	mov    %ebx,%eax
 778:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 77b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 77d:	83 c0 04             	add    $0x4,%eax
 780:	89 45 d0             	mov    %eax,-0x30(%ebp)
 783:	e9 4d ff ff ff       	jmp    6d5 <printf+0x55>
 788:	90                   	nop
 789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 790:	8b 45 d0             	mov    -0x30(%ebp),%eax
 793:	8b 18                	mov    (%eax),%ebx
        ap++;
 795:	83 c0 04             	add    $0x4,%eax
 798:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 79b:	b8 78 0a 00 00       	mov    $0xa78,%eax
 7a0:	85 db                	test   %ebx,%ebx
 7a2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 7a5:	0f b6 03             	movzbl (%ebx),%eax
 7a8:	84 c0                	test   %al,%al
 7aa:	74 23                	je     7cf <printf+0x14f>
 7ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7b0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7b3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 7b6:	83 ec 04             	sub    $0x4,%esp
 7b9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 7bb:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7be:	50                   	push   %eax
 7bf:	57                   	push   %edi
 7c0:	e8 7d fd ff ff       	call   542 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 7c5:	0f b6 03             	movzbl (%ebx),%eax
 7c8:	83 c4 10             	add    $0x10,%esp
 7cb:	84 c0                	test   %al,%al
 7cd:	75 e1                	jne    7b0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7cf:	31 d2                	xor    %edx,%edx
 7d1:	e9 ff fe ff ff       	jmp    6d5 <printf+0x55>
 7d6:	8d 76 00             	lea    0x0(%esi),%esi
 7d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7e0:	83 ec 04             	sub    $0x4,%esp
 7e3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 7e6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 7e9:	6a 01                	push   $0x1
 7eb:	e9 4c ff ff ff       	jmp    73c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 7f0:	83 ec 0c             	sub    $0xc,%esp
 7f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7f8:	6a 01                	push   $0x1
 7fa:	e9 6b ff ff ff       	jmp    76a <printf+0xea>
 7ff:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 802:	83 ec 04             	sub    $0x4,%esp
 805:	8b 03                	mov    (%ebx),%eax
 807:	6a 01                	push   $0x1
 809:	88 45 e4             	mov    %al,-0x1c(%ebp)
 80c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 80f:	50                   	push   %eax
 810:	57                   	push   %edi
 811:	e8 2c fd ff ff       	call   542 <write>
 816:	e9 5b ff ff ff       	jmp    776 <printf+0xf6>
 81b:	66 90                	xchg   %ax,%ax
 81d:	66 90                	xchg   %ax,%ax
 81f:	90                   	nop

00000820 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 820:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 821:	a1 04 10 00 00       	mov    0x1004,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 826:	89 e5                	mov    %esp,%ebp
 828:	57                   	push   %edi
 829:	56                   	push   %esi
 82a:	53                   	push   %ebx
 82b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 82e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 830:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 833:	39 c8                	cmp    %ecx,%eax
 835:	73 19                	jae    850 <free+0x30>
 837:	89 f6                	mov    %esi,%esi
 839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 840:	39 d1                	cmp    %edx,%ecx
 842:	72 1c                	jb     860 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 844:	39 d0                	cmp    %edx,%eax
 846:	73 18                	jae    860 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 848:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 84a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 84c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 84e:	72 f0                	jb     840 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 850:	39 d0                	cmp    %edx,%eax
 852:	72 f4                	jb     848 <free+0x28>
 854:	39 d1                	cmp    %edx,%ecx
 856:	73 f0                	jae    848 <free+0x28>
 858:	90                   	nop
 859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 860:	8b 73 fc             	mov    -0x4(%ebx),%esi
 863:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 866:	39 d7                	cmp    %edx,%edi
 868:	74 19                	je     883 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 86a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 86d:	8b 50 04             	mov    0x4(%eax),%edx
 870:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 873:	39 f1                	cmp    %esi,%ecx
 875:	74 23                	je     89a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 877:	89 08                	mov    %ecx,(%eax)
  freep = p;
 879:	a3 04 10 00 00       	mov    %eax,0x1004
}
 87e:	5b                   	pop    %ebx
 87f:	5e                   	pop    %esi
 880:	5f                   	pop    %edi
 881:	5d                   	pop    %ebp
 882:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 883:	03 72 04             	add    0x4(%edx),%esi
 886:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 889:	8b 10                	mov    (%eax),%edx
 88b:	8b 12                	mov    (%edx),%edx
 88d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 890:	8b 50 04             	mov    0x4(%eax),%edx
 893:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 896:	39 f1                	cmp    %esi,%ecx
 898:	75 dd                	jne    877 <free+0x57>
    p->s.size += bp->s.size;
 89a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 89d:	a3 04 10 00 00       	mov    %eax,0x1004
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 8a2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8a5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8a8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 8aa:	5b                   	pop    %ebx
 8ab:	5e                   	pop    %esi
 8ac:	5f                   	pop    %edi
 8ad:	5d                   	pop    %ebp
 8ae:	c3                   	ret    
 8af:	90                   	nop

000008b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8b0:	55                   	push   %ebp
 8b1:	89 e5                	mov    %esp,%ebp
 8b3:	57                   	push   %edi
 8b4:	56                   	push   %esi
 8b5:	53                   	push   %ebx
 8b6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8bc:	8b 15 04 10 00 00    	mov    0x1004,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8c2:	8d 78 07             	lea    0x7(%eax),%edi
 8c5:	c1 ef 03             	shr    $0x3,%edi
 8c8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 8cb:	85 d2                	test   %edx,%edx
 8cd:	0f 84 a3 00 00 00    	je     976 <malloc+0xc6>
 8d3:	8b 02                	mov    (%edx),%eax
 8d5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 8d8:	39 cf                	cmp    %ecx,%edi
 8da:	76 74                	jbe    950 <malloc+0xa0>
 8dc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 8e2:	be 00 10 00 00       	mov    $0x1000,%esi
 8e7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 8ee:	0f 43 f7             	cmovae %edi,%esi
 8f1:	ba 00 80 00 00       	mov    $0x8000,%edx
 8f6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 8fc:	0f 46 da             	cmovbe %edx,%ebx
 8ff:	eb 10                	jmp    911 <malloc+0x61>
 901:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 908:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 90a:	8b 48 04             	mov    0x4(%eax),%ecx
 90d:	39 cf                	cmp    %ecx,%edi
 90f:	76 3f                	jbe    950 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 911:	39 05 04 10 00 00    	cmp    %eax,0x1004
 917:	89 c2                	mov    %eax,%edx
 919:	75 ed                	jne    908 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 91b:	83 ec 0c             	sub    $0xc,%esp
 91e:	53                   	push   %ebx
 91f:	e8 86 fc ff ff       	call   5aa <sbrk>
  if(p == (char*)-1)
 924:	83 c4 10             	add    $0x10,%esp
 927:	83 f8 ff             	cmp    $0xffffffff,%eax
 92a:	74 1c                	je     948 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 92c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 92f:	83 ec 0c             	sub    $0xc,%esp
 932:	83 c0 08             	add    $0x8,%eax
 935:	50                   	push   %eax
 936:	e8 e5 fe ff ff       	call   820 <free>
  return freep;
 93b:	8b 15 04 10 00 00    	mov    0x1004,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 941:	83 c4 10             	add    $0x10,%esp
 944:	85 d2                	test   %edx,%edx
 946:	75 c0                	jne    908 <malloc+0x58>
        return 0;
 948:	31 c0                	xor    %eax,%eax
 94a:	eb 1c                	jmp    968 <malloc+0xb8>
 94c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 950:	39 cf                	cmp    %ecx,%edi
 952:	74 1c                	je     970 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 954:	29 f9                	sub    %edi,%ecx
 956:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 959:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 95c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 95f:	89 15 04 10 00 00    	mov    %edx,0x1004
      return (void*)(p + 1);
 965:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 968:	8d 65 f4             	lea    -0xc(%ebp),%esp
 96b:	5b                   	pop    %ebx
 96c:	5e                   	pop    %esi
 96d:	5f                   	pop    %edi
 96e:	5d                   	pop    %ebp
 96f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 970:	8b 08                	mov    (%eax),%ecx
 972:	89 0a                	mov    %ecx,(%edx)
 974:	eb e9                	jmp    95f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 976:	c7 05 04 10 00 00 08 	movl   $0x1008,0x1004
 97d:	10 00 00 
 980:	c7 05 08 10 00 00 08 	movl   $0x1008,0x1008
 987:	10 00 00 
    base.s.size = 0;
 98a:	b8 08 10 00 00       	mov    $0x1008,%eax
 98f:	c7 05 0c 10 00 00 00 	movl   $0x0,0x100c
 996:	00 00 00 
 999:	e9 3e ff ff ff       	jmp    8dc <malloc+0x2c>

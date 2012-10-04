Utilizing the PlayFunston project to learn Objective C.
This program uses a decision tree and a current weather observation to determine if you should take your dog to Fort Funston.


To run program:
download GNUStep if running on Windows

gcc -o playfunston main.m -I c:/GNUstep/GNUstep/System/Library/Headers -L c:/
GNUstep/GNUstep/System/Library/Libraries -std=c99 -lobjc -lgnustep-base -fconst
ant-string-class=NSConstantString -fobjc-exceptions -ggdb

./playfunston


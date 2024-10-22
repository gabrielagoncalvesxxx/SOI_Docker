#!/bin/bash

cat <<EOL > /usr/src/projjava/Soma.java
public class Soma {
    public static void main(String[] args) {
        int a = Integer.parseInt(args[0]);
        int b = Integer.parseInt(args[1]);
        int c = a + b;
        System.out.println(c);
    }
}
EOL

docker exec javaaula javac /usr/src/projjava/Soma.java

docker exec javaaula java -cp /usr/src/projjava Soma 10 20

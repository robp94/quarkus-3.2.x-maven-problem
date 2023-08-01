mkdir -p local-repo
java -Dmaven.repo.local=local-repo \
-Dclassworlds.conf=teamcity.m2.conf \
-Dmaven.multiModuleProjectDirectory=../code-with-quarkus \
"-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=*:8000" \
 --add-opens \
 java.base/java.lang=ALL-UNNAMED \
 -classpath \
 "$MAVEN_HOME/boot/*:" \
 org.codehaus.plexus.classworlds.launcher.Launcher \
 -f \
 pom.xml \
 -B \
 -s \
 custom-settings.xml \
 -fae \
 -Plicense \
 -X \
 clean \
 package
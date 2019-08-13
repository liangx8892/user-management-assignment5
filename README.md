# User Management Application (spring mvc)


## How to run

```sh
git clone https://github.com/liangx8892/user-management-assignment5.git
cd user-management-assignment5
mvn clean package
cp ./target/user-management.war TOMCAT_HOME/webapps/
```

1. Build war file `mvn clean package`
2. Copy `./target/user-management.war` to `<TOMCAT_HOME>/webapps`
3. Start up tomcat server `sh <TOMCAT_HOME>/bin/startup.sh`
4. Open in browser: http://localhost:8080/user-management/
5. Built-in users: `admin/admin` role is administrator and `user/123` role is user.
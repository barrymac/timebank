dataSource {
    pooled = true
    driverClassName = "org.hsqldb.jdbcDriver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = false
    cache.use_query_cache = false
//    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
//            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
//            url = "jdbc:hsqldb:mem:devDB"
//            url = "jdbc:hsqldb:file:devDB"

            driverClassName = "com.mysql.jdbc.Driver"
            username = "root"
            password = "mysql"
            dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"

//            dbCreate = "create-drop"
            dbCreate = "update"
            url = "jdbc:mysql://localhost:3306/timebank?autoReconnect=true"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:hsqldb:mem:testDb"
        }
    }
    production {
        dataSource {
            pooled = true

            driverClassName = "com.mysql.jdbc.Driver"
            username = "root"
            password = "mysql"
            dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"

//            dbCreate = "create-drop"
            dbCreate = "update"
            url = "jdbc:mysql://localhost:3306/timebank?autoReconnect=true"

            properties {
                maxActive = 50
                maxIdle = 25
                minIdle = 1
                initialSize = 1
                minEvictableIdleTimeMillis = 60000
                timeBetweenEvictionRunsMillis = 60000
                numTestsPerEvictionRun = 3
                maxWait = 10000

                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = true

                validationQuery = "select now()"
            }
        }
    }
}

package com.web.store.config;

import java.beans.PropertyVetoException;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableTransactionManagement
@EnableScheduling
public class RootAppConfig {
    @Bean
    public DataSource dataSource() {
        ComboPooledDataSource ds = new ComboPooledDataSource();
        ds.setUser("team4sa@java20201019");
        ds.setPassword("Sa123456");
        try {
            ds.setDriverClass("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (PropertyVetoException e) {
            e.printStackTrace();
        }
        ds.setJdbcUrl("jdbc:sqlserver://java20201019.database.windows.net:1433;database=JavaDemo");
        ds.setInitialPoolSize(4);
        ds.setMaxPoolSize(8);
        return ds;
    }
    
    @Bean
    public LocalSessionFactoryBean sessionFactory() {
        LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
        factory.setDataSource(dataSource());
        factory.setPackagesToScan(new String[] {
                    "com.web.store"
                });
        factory.setHibernateProperties(additionalProperties());
        return factory;
    }
    @Bean(name="transactionManager")
    @Autowired
    public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
         HibernateTransactionManager txManager = new HibernateTransactionManager();
         txManager.setSessionFactory(sessionFactory);
         return txManager;
      }    
    
    private Properties additionalProperties()  {
        Properties properties=new Properties();
        properties.put("hibernate.dialect", org.hibernate.dialect.SQLServer2012Dialect.class);
        properties.put("hibernate.show_sql", Boolean.FALSE);
        properties.put("hibernate.format_sql", Boolean.TRUE);
        properties.put("default_batch_fetch_size", 10);
//        properties.put("hibernate.hbm2ddl.auto", "update");
        return properties;
    }
}

# ORACLE JDBC

## 问题:java使用jdbc进行数据库查询过程中,char类型的字段需要补齐空格才能匹配到正确结果
## 解决办法:orale提供了fixedString连接属性,该属性设置为true可以解决此类问题.
>  spring中实现接口BeanPostProcessor可设置datasource,加入该属性.
```java
 public Object postProcessBeforeInitialization(Object bean, String name) throws BeansException {
        if (bean instanceof DataSource) {
            DataSource dataSource = (DataSource)bean;
            if(!isOracle(dataSource)) return bean;
            PoolConfiguration configuration = dataSource.getPoolProperties();
            Properties properties = configuration.getDbProperties();
            if (null == properties) properties = new Properties();
            properties.put("fixedString", "true");
            configuration.setDbProperties(properties); 
        }
        return bean;
    }
```
## 举一反三
### BeanPostProcessor
### orale jdbc属性


|Name	|Type	|Description|
|---|---|---|
|accumulateBatchResult|	String (containing boolean value)	|"true" causes the number of modified rows used to determine when to flush a batch accumulates across all batches flushed from a single statement. The default is "false", counting each batch separately|
|database	|String	|connect string for the database|
|defaultBatchValue|	String (containing integer value)	|default batch value that triggers an execution request (default value is "10")|
|defaultExecuteBatch	|	String (containing integer value)|	default batch size when using Oracle batching|
|defaultNchar|		String (containing boolean value)|		"true" causes the default mode for all character data columns to be NCHAR.|	
|defaultRowPrefetch|		String (containing integer value)|		default number of rows to prefetch from the server (default value is "10")|	
|disableDefineColumnType	|	String (containing boolean value)|		"true" causes defineColumnType() to have no effect.This is highly recommended when using the Thin driver, especially when the database character set contains four byte characters that expand to two UCS2 surrogate characters, e.g. AL32UTF8. The method defineColumnType() provides no performance benefit (or any other benefit) when used with the 10g Release 1 (10.1) Thin driver. This property is provided so that you do not have to remove the calls from your code. This is especially valuable if you use the same code with Thin driver and either the OCI or Server Internal driver.|
|DMSName|	String	|name of the DMS Noun that is the parent of all JDBC DMS metrics. (see Note.)|
|DMSType	|String	|type of the DMS Noun that is the parent of all JDBC DMS metrics. (see Note.)|
|fixedString|	String (containing boolean value)|	"true" causes JDBC to use FIXED CHAR semantics when setObject() is called with a String argument. By default JDBC uses VARCHAR semantics. The difference is in blank padding. By default there is no blank padding. For example, 'a' does not equal 'a ' in a CHAR(4) unless fixedString is "true".|
|includeSynonyms	|String (containing boolean value)	|"true" to include column information from predefined "synonym" SQL entities when you execute a DataBaseMetaData getColumns() call; equivalent to connection setIncludeSynonyms() call (default value is "false")|
|internal_logon	|String	|username used in an internal logon. Must be the role, such as sysdba or sysoper, that allows you to log on as sys|
|oracle.jdbc.J2EE13Compliant|	String (containing boolean value)	|true" causes JDBC to use strict compliance for some edge cases. In general, Oracle's JDBC drivers allow some operations that are not permitted in the strict interpretation of J2EE 1.3. Setting this property to "true" will cause those cases to throw SQLExceptions. There are some other edge cases where Oracle's JDBC drivers have slightly different behavior than defined in J2EE 1.3. This results from Oracle having defined the behavior prior to the J2EE 1.3 specification and the resultant need for compatibility with existing customer code. Setting this property will result in full J2EE 1.3 compliance at the cost of incompatibility with some customer code. Can be either a system property or a connection property.|
|oracle.jdbc.TcpNoDelay	|String (containing boolean value)|	"true" causes the TCP_NODELAY property is set on the socket when using the Thin driver. See java.net.SocketOptions.TCP_NODELAY. Can be either a system property or a connection property.|
|oracle.jdbc.ocinativelibrary|	String|	name of the native library for the OCI driver. If not set, the default name, libocijdbcX (X is the version number), is used.|
|password	|String	|the password for logging into the database
|processEscapes	|String (containing boolean value)	|"true" if escape processing is enabled for all statements, "false" if escape processing is disabled (default value is "false")|
|remarksReporting|	String (containing boolean value)	|"true" if getTables() and getColumns() should report TABLE_REMARKS; equivalent to using setRemarksReporting() (default value is "false")|
|remarksReporting	|String (containing boolean value)	|"true" causes OracleDatabaseMetaData to include remarks in the metadata. This can result in a substantial reduction in performance.|
|restrictGetTables	|String (containing boolean value)	|"true" causes JDBC to return a more refined value for DatabaseMeta.getTables(). By default JDBC will return things that are not accessible tables. These can be non-table objects or accessible synonyms for inaccessible tables. If this property is "true", JDBC returns only accessible tables. This has a substantial performance penalty.|
|server|	String	|hostname of database|
|useFetchSizeWithLongColumn	|String (containing boolean value)	|"true" causes JDBC to prefetch rows even when there is a LONG or LONG RAW column in the result. By default JDBC fetches only one row at a time if there are LONG or LONG RAW columns in the result. Setting this property to true can improve performance but can also cause SQLExceptions if the results are too big.We recommend avoiding LONG and LONG RAW columns; use LOB instead.|
|user|	String	|user name for logging into the database|
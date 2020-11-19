
```mermaid
classDiagram
Injectable <|-- ResourceBase
ResourceBase <|-- ContextResource
ResourceBase <|-- ContextEnvironment
ResourceBase <|-- ContextResourceLink
ContextResource <--* NamingResources : 0..*
ContextEnvironment <--* NamingResources : 0..*
ContextResourceLink <--* NamingResources : 0..*
LifecycleMBeanBase <|-- NamingResourcesImpl
NamingResources <|-- NamingResourcesImpl
<<interface>> NamingResources
<<interface>> Injectable
ResourceBase ： description

```
+ ResourceBase
  资源基础类，每个类要有 description、name、type(clazz)、lookupName、properties等属性。他的子类主要有ContextEnvironment、ContextResource、ContextResourceLink。
  ContextEnvironment可以是webx.xml中“env-entry“节点配置的内容。”resource-ref“定义的元素会被实例化成ContextResource可以定义resource级别是容器级别还是应用级别，是否共享、是否单例、并可以定义无参数的关闭方法。server.xml中配置ResourceLink，会被实例化成ContextResourceLink需要定第该resource的全局名字和工厂类的名字。NamingResources可以维护以上三种Resource。
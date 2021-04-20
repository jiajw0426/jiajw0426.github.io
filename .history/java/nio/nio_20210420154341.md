## Buffer

不确切的说Buffer的用于存储基本类型的线性序列，有一下特点
+ Buffer中的元素个数是有限的，capacity是用于描述这个有限的个数。
+ 不像数组和序列，Buffer可以直接通过get（）方式获取元素，每次get的元素索引自增长，这个表示索引的属性就是position。
+ Buffer的limit属性代表可用元素的界限。
+ Buffer是可以写的同时也是可读，通过flip（）是buffer从可写状态，转为读状态。
+ Buffer是可以重复读，调用rewind方防范，position直接归零，可以重复读，当然也可以mark方法，开确定重复读取元素的起始位置。设置mark之后调用reset方法，position被重置为mark。
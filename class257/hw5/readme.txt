对于第一部分，我想让您想象一下BulkCo，这是一个虚构的仓库商店，
消费者和小型企业可以在这里批量购买物品。例如，您可以购买一升的牙膏。 
BulkCo有几个数据库。它的供应链管理和销售基础架构在一个可追溯到1970年代的传统PigIron 300数据库中进行管理。
它跟踪BulkCo商店中的商品调色板。它可以确保没有一家商店的同一产品的调色板超过两个。
当项目的调色板数量减少到一个时，将决定是否继续该产品，
如果是，则从供应商处重新订购。这需要在剩余的最后一个调色板完全售完之前完成。
除此系统外，BulkCo还拥有一个用于管理员工的HR系统和另一个用于管理其客户，
他们的购买习惯以及跟踪所接收的调色板和货品的条形码的系统。
两者都使用现代的关系数据库。最后，为了检查采购和供应时间序列的趋势，
建议广告传单中应包含哪些内容，应停售哪些产品以及暗示哪些产品值得库存，
BulkCo还设有一个数据仓库(data warehouse)。

对于以下每种数据集成模式：数据合并，数据联合，数据传播，已更改的数据捕获和数据虚拟化均提出了该模式的具体实例，
以及为什么可能需要将此模式用作该业务的数据过程集成的一部分的原因 。

一些供应商有多个地点，一些使用BulkCo的企业有多个帐户，用户可能会更改其地址或信用卡。 描述与上一次与BulkCo相关的练习不同的业务流程。 
对于此其他过程，请经历“总体数据质量管理”周期的四个步骤，以定义，度量，分析和改进与此过程相关的基础数据，并写上解释每个步骤将发生的情况。

PigIron 300 database
HR system
customers system
data warehouse

Data consolidation:
	BulkCo 的系统可以分为3个独立部分，PigIron 300 database，HR system，customers system。
	这三个独立部分的数据需要整合为一个更高质量的数据集合，以满足single source of truth这条定理。
	整合后的数据通常会存放在data warehouse里，用于data reporting 和 data analysis。
	举个例子，最近受疫情影响，HR system的人员流动比较频繁，有很多临时的雇员。
	customers system有很多用户退货。database有很多货品无法从货源补充
	所有这些因为疫情原因导致的数据异常，全部整合起来一起发送到data warehouse用于分析。
	
Data federation:
	Data federation主要目的是让database，HR，customers 3个系统时刻保持同步状态。
	举个例子，在商品管理PigIron 300 system中，一个牙膏存货不足了。
	正当准备补充新货源的时，突然发生了意外，导致新货源耽搁了一段时间。
	而在customers system中并没及时更新意外耽搁的时间，用户还以为有牙膏存货。
	这个时候就需要data federation运行一个queryt来协调所有子系统。
	
Data propagation:
	Data propagation可以把不同的外数据源集合在本地一起做分析。特别适应于广告推荐系统。
	举个例子，BulkCo可以链接一些第三方的数据源，来了解用户的地址，生活，平时搜索的keyword，购物习惯。
	从而推荐一些专门针对此用户商品作为广告。

Changed Data Capture:
	简称CDC，在多个系统中建立出发事件，从而同时更改多个数据库的信息
	举个例子，在customers system中，当用户购买了一个牙膏后，通过CDC更新货品database的库存。
	如果货品database的库存不够了，在通过事件告诉雇员需要进货。
	也可以使用于广告系统，每个货品都有一个动态的权重分布，当货品销量提高时，通过CDC增加权重，推荐给用户。
	
Data Virtualization:
	Data Virtualization比较类似data lake，同时获取多个系统的信息源数据并整合在一起。
	区别是，Data Virtualization没有储存实际的数据，或者只使用缓存临时储存。这样可以做到即时查看与修改数据。
	在客户端，Data Virtualization可以用于实时推荐一些当前热卖的商品给用户。
	在管理端，管理者可以通过每个货品的销量来调整价格与广告页面出现次数的权重

给出此业务的示例业务流程，并给出一个图表，显示如何使用业务流程模式实施此流程。
process:
	模拟一个用户购买牙膏的商业流程
	用户搜索牙膏 
	显示近一周销量最好的牙膏 (Data Virtualization)
	列出牙膏相关商品，剃须刀，毛巾，洗脸液 (Data propagation)
	用户购买牙膏，库存相应减少，此牙膏热度+1 (Changed Data Capture)
	牙膏库存不够了，需要进货，但是发生意外货源方也断货了
	调整所有系统立即下架此牙膏，关闭此牙膏的广告 (Data federation)
	主管人员重新分析此牙膏的销售情况，制定新的购货计划 (Data consolidation)
	
pattern:
	

一些供应商有多个地点，一些使用BulkCo的企业有多个帐户，用户可能会更改其地址或信用卡。 
描述与上一次与BulkCo相关的练习不同的业务流程。 
对于此其他过程，请经历“总体数据质量管理”周期的四个步骤，以定义，度量，
分析和改进与此过程相关的基础数据，并写上解释每个步骤将发生的情况。

business process: 公司从供应商购买新的货物

define:
	首先要对数据质量需求有一个明确的定义，例如什么类型的数据是可以容错的，什么类型数据必须完全精确，这些需要决策层先达成一个共识。
measure:
	对数据进行质量考核，从而得出一个正确百分比。考核的标准可以是，incompleteness,inaccuracy,inconsistency,invalidity,redundancy,stardard.
	某些模块对质量的要求不同，例如供应商的名字可以拼写错误，但是供货时间不能缺失。供应商的信用卡必须所有信息完全正确。
analyze:
	identify issues of 错误的数据，把错误类型归类。可以对数据质量分化为多个指标，例如complete, accurate conformance的完成百分比
improve:
	找出导致错误数据的原因。Complete initial data verification。修复错误数据。监控数据，及时获取数据质量反馈。
	举例来说，美国的zipcode是5位数，而加拿大是6位数，


决定数据质量的需求 是data customer的需求，
需要决策层实现制定好 
需要一套相同的框架去整合数据
需要不停的完善


可能的数据问题
	缺失
	不准确
	不一致
	错误
	重复
	格式错误
	


















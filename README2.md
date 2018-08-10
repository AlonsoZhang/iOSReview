# iOSReview

有关iOS开发的知识点代码模块集合。

### 3. UITableView

1. 重用机制（见TableViewReuse）
2. 数据源同步
	* 并发访问，数据拷贝 - 主线程记录删除动作，子线程完成后同步删除动作
	* 串行访问 - 在串行队列中完成主线程和子线程动作
3. UI事件传递&响应
	* UIView和CALayer - UIView为CALayer提供内容，以及负责处理触摸事件，参与响应链，CALayer显示内容contents。单一职责原则。
	* 事件传递与视图响应链（见UIViewEvent）
`- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event`
4. 图像显示原理
	* CPU - Layout(UI布局、文本计算)/Display（绘制）/Prepare（图片编解码）/Commit（提交位图）
	* GPU渲染管线 - 顶点着色、图元装配、光栅化、片段着色、片段处理->FrameBuffer
5. UI卡顿、掉帧的原因
	* 在16.7ms内（在下一帧VSync信号来之前）并没有在CPU和GPU共同完成下一帧画面的合成。
	* 滑动优化方案 
	* CPU - 对象创建、调整、销毁，预排版（布局计算、文本计算） 
	* GPU - 纹理渲染、视图混合
6. UIView的绘制原理
	* 异步绘制
	`- [layer.delegate displayLayer:]`代理负责生成对应的bitmap，设置该bitmap作为layer.contents属性的值
7. 离屏渲染
	* 何时触发？圆角（当和maskToBounds一起使用时）、图层模板、阴影、光栅化
	* 为何要避免？增加GPU的工作量，耗时超过16.7ms，会卡顿和掉帧。创建新的渲染缓冲区、上下文切换。

### 4. Objective-C相关

1. 分类Category
	* 分类使用环境：声明私有方法、分解体积庞大的类文件、把framework的私有方法公开化
	* 特点：运行时决议、可以为系统类添加分类
	* 分类中添加内容：实例方法、类方法、协议、属性
	* 加载调用栈
	* 最终编译的分类中的同名方法会最终生效
2. 扩展
	* 声明私有属性、声明私有方法、声明私有成员变量
3. 关联对象
	* 能给分类添加“成员变量”
4. 扩展
	* 声明私有属性、声明私有方法、声明私有成员变量

### 5. Runtime

1. id = objc_object结构体（1.isa_t 2.关于isa操作相关 3.弱引用相关 4.关联对象相关 5.内存管理相关）
2. class = objc_class继承自objc_object（1.Class superClass 2.cache_t cache 3.class_data_bits_t bits）
3. isa指针（指针型isa，isa的值代表Class的地址；非指针型isa，isa的值的部分代表Class的地址）
4. isa指向 关于对象，其指向类对象；关于类对象，其指向元类对象。
5. cache_t用于快速查找方法执行函数，是可增量扩展的哈希表结构，是局部性原理的最佳应用。
6. class_data_bits_t主要是对class_rw_t的封装，class_rw_t代表了类相关的读写信息、对class_ro_t的封装，class_ro_t代表了类相关的只读信息。

### 7.Block

1. Block是将函数及其执行上下文封装起来的对象。
2. Block调用即是函数调用。
3. 截获变量。对于基本数据类型的局部变量截获其值。对于对象类型的局部变量连同所有权修饰符一起截获。以指针形式截获局部静态变量。不截获全局变量、静态全局变量。
clang -rewrite-objc

### 13.算法


























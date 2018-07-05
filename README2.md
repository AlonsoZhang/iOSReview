# iOSReview

有关iOS开发的知识点代码模块集合。

### 1. UITableView

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

### 2. Objective-C相关

1. 分类Category
	* 分类使用环境：声明私有方法、分解体积庞大的类文件、把framework的私有方法公开化
	* 特点：运行时决议、可以为系统类添加分类
	* 分类中添加内容：实例方法、类方法、协议、属性
	* 加载调用栈
	* 最终编译的分类中的同名方法会最终生效
2. 扩展
	* 声明私有属性、声明私有方法、声明私有成员变量
	* 

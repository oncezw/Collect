/*:
Design Principles
==========
 [Resource](https://zhuanlan.zhihu.com/p/33607390)
*/
/*:
🐝 单一职责原则
--------------------------
 
> SRP：Single responsibility principle.
>
> There should never be more than one reason for a class to change.
 
 * **核心思想:** 应该有且仅有一个原因引起类的变更
 * **问题描述:** 假如有类Class1完成职责T1，T2，当职责T1或T2有变更需要修改时，有可能影响到该类的另外一个职责正常工作。
 * **好处:**  类的复杂度降低、可读性提高、可维护性提高、扩展性提高、降低了变更引起的风险。
 * **需注意:** 单一职责原则提出了一个编写程序的标准，用“职责”或“变化原因”来衡量接口或类设计得是否优良，但是“职责”和“变化原因”都是不可以度量的，因项目和环境而异。

*/
/*:
👫 里式替换原则
--------------------------
 
> LSP:  Liskov Substitution Principle.
>
> Functions that use pointers or references to base classes must be able to
useobjects of derived classes without knowing it.
 
 * **核心思想:** 在使用基类的的地方可以任意使用其子类，能保证子类完美替换基类。
 * **解释:** 只要父类能出现的地方子类就能出现。反之，父类则未必能胜任。
 * **好处:**  增强程序的健壮性，即使增加了子类，原有的子类还可以继续运行。
 * **需注意:** 如果子类不能完整地实现父类的方法，或者父类的某些方法在子类中已经发生“畸变”，则建议断开父子继承关系 采用依赖、聚合、组合等关系代替继承。
*/
/*:
💐 依赖倒置原则
--------------------------
 
> DIP:  Dependence Inversion Principle.
>
> High level modules should not depend upon low level modules,Both should depend
upon abstractions.
>
>Abstractions should not depend upon details.
>
>Details should depend upon abstracts.
 
 * **核心思想:** 高层模块不应该依赖底层模块，二者都该依赖其抽象；抽象不应该依赖细节；细节应该依赖抽象。
 * **解释:** 高层模块就是调用端，低层模块就是具体实现类。抽象就是指接口或抽象类。细节就是实现类。依赖倒置原则的本质就是通过抽象（接口或抽象类）使个各类或模块的实现彼此独立，互不影响，实现模块间的松耦合。
 * **好处:**  依赖倒置的好处在小型项目中很难体现出来。但在大中型项目中可以减少需求变化引起的工作量。使并行开发更友好。
 * **问题描述:** 类A直接依赖类B，假如要将类A改为依赖类C，则必须通过修改类A的代码来达成。这种场景下，类A一般是高层模块，负责复杂的业务逻辑；类B和类C是低层模块，负责基本的原子操作；假如修改类A，会给程序带来不必要的风险。
  * **解决方案:**   将类A修改为依赖接口interface，类B和类C各自实现接口interface，类A通过接口interface间接与类B或者类C发生联系，则会大大降低修改类A的几率。
*/
/*:
💡 接口隔离原则
--------------------------
 
> ISP:  Interface Segregation Principle.
>
> The dependency of one class to another one should depend on the smallest possible interface.
 
 * **核心思想:** 类间的依赖关系应该建立在最小的接口上。
 * **解释:** 建立单一接口，不要建立庞大臃肿的接口，尽量细化接口，接口中的方法尽量少。也就是说，我们要为各个类建立专用的接口，而不要试图去建立一个很庞大的接口供所有依赖它的类去调用。
 * **问题描述:** 类A通过接口interface依赖类B，类C通过接口interface依赖类D，如果接口interface对于类A和类B来说不是最小接口，则类B和类D必须去实现他们不需要的方法。
  * **解决方案:**
    * 接口尽量小，但是要有限度。对接口进行细化可以提高程序设计灵活性，但是如果过小，则会造成接口数量过多，使设计复杂化。所以一定要适度。
    * 提高内聚，减少对外交互。使接口用最少的方法去完成最多的事情。
    * 为依赖接口的类定制服务。只暴露给调用的类它需要的方法，它不需要的方法则隐藏起来。只有专注地为一个模块提供定制服务，才能建立最小的依赖关系。
*/
/*:
☔ 迪米特法则
--------------------------
 
> LKP:  Least Knowledge Principle.
>
> Only talk to your immediate friends.
 
 * **核心思想:** 类间解耦。
 * **解释:** 一个类对自己依赖的类知道的越少越好。自从我们接触编程开始，就知道了软件编程的总的原则：低耦合，高内聚。无论是面向过程编程还是面向对象编程，只有使各个模块之间的耦合尽量的低，才能提高代码的复用率。低耦合的优点不言而喻，但是怎么样编程才能做到低耦合呢？那正是迪米特法则要去完成的。
*/
/*:
🌰 开放封闭原则
--------------------------
 
> OCP:  Open Close Principle.
>
> Software entities like classes,modules and functions should be open for extension but closed for
modifications.
 
 * **核心思想:** 尽量通过扩展软件实体来解决需求变化，而不是通过修改已有的代码来完成变化（对于拓展是开放的，对于更改是封闭的）。
 * **解释:** 一个软件产品在生命周期内，都会发生变化，既然变化是一个既定的事实，我们就应该在设计的时候尽量适应这些变化，以提高项目的稳定性和灵活性。
*/
/*:
Summary
==========

>单一职责原则告诉我们实现类要职责单一；里氏替换原则告诉我们不要破坏继承体系；依赖倒置原则告诉我们要面向接口编程；接口隔离原则告诉我们在设计接口的时候要精简单一；迪米特法则告诉我们要降低耦合。而开闭原则是总纲，他告诉我们要对扩展开放，对修改关闭。
*/

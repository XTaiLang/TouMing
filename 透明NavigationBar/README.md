# OfflineDemo
<p>GIF：
 <p>![](https://github.com/dog047/OfflineDemo/raw/master/OfflineDemo.gif)


##2016.3.4 UPDATE
定制了转场动画，点击按钮会由遮罩过渡到下一个页面
 
##透明导航栏
自定义的NavigationController，NavigationBar也可以动画，系统自带的Push效果也可以定制动画
##Unit页面
不是用tableview做的。整个页面用透明的Scrollview当容器，Cell是单独的UIView。展开动画封装在Cell内部，展开时的移动动画在容器内处理。公司需求Unit页面不会有很多Cell，所以没有做重用机制（屏幕外的Cell也会动画）
##Lesson页面
CollectionView做的。难点在自定义CollectionViewFlowLayout
##Menu页面
大部分动画用UIViewAnimationBlock做的

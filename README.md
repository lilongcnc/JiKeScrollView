# JiKeScrollView
模仿首页即刻滚动效果

- 简书地址：
[《 仿『即刻』首页滚动效果》](http://www.jianshu.com/p/1b3ccfba1f6f)
- 个站地址：
[《 仿『即刻』首页滚动效果》](http://www.lilongcnc.cc/2016/11/24/24-%E4%BB%BF%E3%80%8E%E5%8D%B3%E5%88%BB%E3%80%8F%E9%A6%96%E9%A1%B5%E6%BB%9A%E5%8A%A8%E6%95%88%E6%9E%9C/?preview_id=272&preview_nonce=59ece59ecb&post_format=standard&preview=true)

##摘要
  优秀的应用总是值得我们去模仿，即刻的`首页的推荐主题内容滚动效果`和`个人信息页面的头像拖动效果`，还有`视频播放`等效果都值得我们去模仿和学习。 前段时间看到的巴巴巴巴巴巴掌的模仿首页滚动效果的安卓代码，并且分析实现的原理，于是便想着用iOS的代码也写一下。
上边提到的文章地址:巴巴巴巴巴巴掌的[《手摸手教你写炫酷控件》](https://github.com/JeasonWong/JikeGallery) 

##实现效果
![](http://upload-images.jianshu.io/upload_images/594219-17e6626c1ae14d7f.gif?imageMogr2/auto-orient/strip)

##实现说明
执行动画效果是直接用的UIView自带的动画方法.
我是图片滚动再写到文字滚动，然后再包含到外边的动态数据传入.所以整个**`JiKeScrollView`**的项目结构如下，每个文件都是一个单独的控件，都可以单独提取出来使用。
![](http://upload-images.jianshu.io/upload_images/594219-8be99cd7d49ed223.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



###数据驱动显示
这个名字有点大了,其实就是就考虑到我们在实际使用时候怎么方便一点.我这里的逻辑是:

先传入初始化的信息,代码如下:

    _myJikeScrollView.myFirstShowImageLinkArray = @[
                                                    @[@"11",@"12"],
                                                    @[@"13",@"14"],
                                                    @[@"15",@"16"]
                                                    ];
    _myJikeScrollView.myFirstShowLabelDesArray = @[
                                                   @[@"左边初始描述文字1",@"左边初始描述文字2"],
                                                   @[@"中间初始描述文字3",@"中间初始描述文字4"],
                                                   @[@"右边初始描述文字5",@"右边初始描述文字6"]
                                                   ];


如果想要执行滚动的时候,我们只需要传入下一组数据就行了,如下代码:

    _myJikeScrollView.myNextShowImageLinkArray = self.tempImageLinkDataArray[dataShowIndex];
    _myJikeScrollView.myNextShowLabelDesArray = self.tempImageDesDataArray[dataShowIndex];
    

其实我们仔细观察『即刻』点击'换一换',左边是有个圆形指针再转的,我想这个时候是在请求下下次我们要显示的数据.这样便可以保持每次次点击'换一换'之后能够马上`有数据滚动`.


###其他

因为完整代码有点多,所以Demo中分为了三部分,除了完整代码,还有是把基础组件单个使用的的**`JiKeScrollImageViewVC`**和**`JiKeScrollLabelVC`**.

![JiKeScrollLabelVC](http://upload-images.jianshu.io/upload_images/594219-f0f5897e74bd616a.gif?imageMogr2/auto-orient/strip)
![JiKeScrollImageViewVC](http://upload-images.jianshu.io/upload_images/594219-3893820864ff4c70.gif?imageMogr2/auto-orient/strip)





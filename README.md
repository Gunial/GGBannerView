# GGBannerView
一款简单的图片轮播器,暂时只能轮播图片<br/>
![](https://github.com/Gunial/GGBannerView/blob/master/GGBannerView.gif)<br/>
初始化方法:传递图片链接数组,以及选中后的回调,回调的数据可以在源码中进行修改,以满足自己的需求<br/>
- (instancetype)initWithImageUrls:(NSArray *)imageUrlArray selectedIndex:(selectedIndexCallBack)selectedIndex;<br/>

是否开启自动轮播功能:<br/>
bannerView.hasTimer = YES;<br/>

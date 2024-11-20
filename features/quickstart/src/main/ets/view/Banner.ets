import { BannerClass } from '../model/BannerClass';
import { bufferToString } from '../util/BufferUtil';


@Component
export struct Banner {
  @State bannerList: BannerClass[] = [
    {
      "id": '0',
      "imageSrc": "app.media.banner_pic0",
      "url": "https://developer.huawei.com/consumer/cn/training/course/video/C101718352529709527"
    },
    {
      "id": '1',
      "imageSrc": "app.media.banner_pic1",
      "url": "https://developer.huawei.com/consumer/cn/"
    },
    {
      "id": '2',
      "imageSrc": "app.media.banner_pic2",
      "url": "https://developer.huawei.com/consumer/cn/deveco-studio/"
    },
    {
      "id":'3',
      "imageSrc": "app.media.banner_pic3",
      "url": "https://developer.huawei.com/consumer/cn/arkts/"
    },
    {
      "id": '4',
      "imageSrc": "app.media.banner_pic4",
      "url": "https://developer.huawei.com/consumer/cn/arkui/"
    },
    {
      "id": '5',
      "imageSrc": "app.media.banner_pic5",
      "url": "https://developer.huawei.com/consumer/cn/sdk"
    }
  ];
  // 拿到路由栈
  @Consume('articlePathStack') articlePathStack: NavPathStack;

  // aboutToAppear(): void {
  //   this.getBannerDataFromJSON();
  // }
  //
  // getBannerDataFromJSON() {
  //   getContext(this).resourceManager.getRawFileContent('BannerData.json').then(value => {
  //     this.bannerList = JSON.parse(bufferToString(value)) as BannerClass[];
  //   })
  // }

  build() {
    Swiper() {
      ForEach(this.bannerList, (item: BannerClass) => {
        Image($r(item.imageSrc))
          .objectFit(ImageFit.Contain)
          .width('100%')
          .borderRadius(16)
          .padding({ top: 11, left: 16, right: 16 })
          .onClick(() => {
            // 把 item 塞到 bannerDetailPage 这里
            this.articlePathStack.pushPathByName('bannerDetailPage', item);
          })
      }, (item: BannerClass) => item.id)
    }
    .autoPlay(true)
    .loop(true)
    .indicator(
      new DotIndicator()
        .color('#1a000000')
        .selectedColor('#0A59F7'))
  }
}

import { BannerClass } from '../model/BannerClass';
import { webview } from '@kit.ArkWeb';

@Component
export struct BannerDetailPage {
  // @State message: string = 'Hello World';

  @State bannerClass: BannerClass | null = null;
  controller: webview.WebviewController = new webview.WebviewController();

  @Consume('articlePathStack') articlePathStack: NavPathStack;

  aboutToAppear(): void {
    // 在这里取出来 bannerDetailPage
    this.bannerClass = this.articlePathStack.getParamByName('bannerDetailPage')[0] as BannerClass;
    console.log('this.bannerClass', this.bannerClass.url)
  }

  build() {
    NavDestination() {
      Column() {
        Web({
          src: this.bannerClass?.url,
          controller: this.controller
        })
          .darkMode(WebDarkMode.Auto)
          .domStorageAccess(true)
          .zoomAccess(true)
          .fileAccess(true)
          .mixedMode(MixedMode.All)
          .javaScriptAccess(true)
          .width('100%')
          .layoutWeight(1)
      }
    }
    .width('100%')
    .height('100%')
  }
}
